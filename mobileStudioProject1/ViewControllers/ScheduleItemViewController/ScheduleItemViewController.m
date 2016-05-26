#import "ScheduleItemViewController.h"
#import "EventMembersViewController.h"

@interface ScheduleItemViewController ()

@property (readwrite) ScheduleItem* scheduleItem;
@property ScheduleItemView *scheduleItemView;

@end

@implementation ScheduleItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.navigationItem.title = self.scheduleItem.scheduleItemTitle;
    self.scheduleItemView.mapView.delegate = self;
    [self.scheduleItemView configureData: self.scheduleItem];
    [self.scheduleItemView.membersButton addTarget:self action:@selector(membersButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)loadView{
    self.scheduleItemView = [[ScheduleItemView alloc] init];
    self.view = self.scheduleItemView;
    
}



-(instancetype) initWithScheduleItem: (ScheduleItem*) scheduleItem{
    
    if(self = [super init]){
        self.scheduleItem = scheduleItem;
    }
    return self;
}



-(void)membersButtonClicked:(id)sender{
    
    EventMembersViewController *eventMembersViewController = [[EventMembersViewController alloc] init];
    
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:eventMembersViewController];
    [self presentViewController:navBar animated:YES completion:nil];
    
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *startAnnotationIdentifier = @"Start";
    static NSString *destinationAnnotationIdentifier = @"Finish";
    
    if([annotation.title isEqualToString:@"Start"]){
        MKAnnotationView* startAnnotationView = [self.scheduleItemView.mapView dequeueReusableAnnotationViewWithIdentifier:startAnnotationIdentifier];
        if(!startAnnotationView){
            startAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:startAnnotationIdentifier];
            startAnnotationView.image = [UIImage imageNamed:@"StartPin"];
            [startAnnotationView setCanShowCallout:YES];
        }
        return startAnnotationView;
    }
    else if([annotation.title isEqualToString:@"Finish"]){
        MKAnnotationView* destinationAnnotationView = [self.scheduleItemView.mapView dequeueReusableAnnotationViewWithIdentifier:destinationAnnotationIdentifier];
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
