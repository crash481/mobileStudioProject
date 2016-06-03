#import "RaceViewController.h"
#import "EventMembersViewController.h"
#import "RacePointAnnotation.h"

@interface RaceViewController ()

@property (readwrite) Race* race;
@property RaceView *raceView;
@property NSMutableArray<NSString*> *transportTypesName;

@end

@implementation RaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.navigationItem.title = self.race.raceTitle;
    self.raceView.mapView.delegate = self;
    [self.raceView configureData: self.race];
    [self.raceView.membersButton addTarget:self action:@selector(membersButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.raceView.transportTypeTableView.delegate = self;
    self.raceView.transportTypeTableView.dataSource = self;
    self.transportTypesName = (NSMutableArray<NSString*>*)@[@"Скейтборд/лонгборд", @"Велосипед" ];
}

-(void)loadView{
    self.raceView = [[RaceView alloc] init];
    self.view = self.raceView;
}



-(instancetype) initWithRace: (Race*) race{
    
    if(self = [super init]){
        self.race = race;
    }
    return self;
}



-(void)membersButtonClicked:(id)sender{
    
    EventMembersViewController *eventMembersViewController = [[EventMembersViewController alloc] init];
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:eventMembersViewController];
    [self presentViewController:navBar animated:YES completion:nil];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIndentifier = @"transportTypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    }
    
    cell.textLabel.text = self.transportTypesName[ [[self.race.transportTypes allObjects][indexPath.row] integerValue]];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.race.transportTypes.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(RacePointAnnotation<MKAnnotation>*)annotation{
    
    static NSString *startAnnotationIdentifier = @"Start";
    static NSString *destinationAnnotationIdentifier = @"Finish";
    
    if( annotation.annotationType == RaceAnnotationTypeStart ){
        MKAnnotationView* startAnnotationView = [self.raceView.mapView dequeueReusableAnnotationViewWithIdentifier:startAnnotationIdentifier];
        if(!startAnnotationView){
            startAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:startAnnotationIdentifier];
            startAnnotationView.image = [UIImage imageNamed:@"StartPin"];
            [startAnnotationView setCanShowCallout:YES];
        }
        return startAnnotationView;
    }
    else if([annotation.title isEqualToString:@"Finish"]){
        MKAnnotationView* destinationAnnotationView = [self.raceView.mapView dequeueReusableAnnotationViewWithIdentifier:destinationAnnotationIdentifier];
        if(!destinationAnnotationView){
            destinationAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:destinationAnnotationIdentifier];
            [destinationAnnotationView setContentMode:UIViewContentModeTop];
            destinationAnnotationView.image = [UIImage imageNamed:@"FinishPin"];
            [destinationAnnotationView setCanShowCallout:YES];
        }
        return destinationAnnotationView;
    }
    return nil;
}

@end
