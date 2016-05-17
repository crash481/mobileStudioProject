#import "ScheduleItemViewController.h"
#import "EventMembersViewController.h"
#import "CreateEventViewController.h"

@interface ScheduleItemViewController ()

@property (readwrite) ScheduleItem* scheduleItem;
@property ScheduleItemView *scheduleItemView;

@end

@implementation ScheduleItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    self.navigationItem.title = self.scheduleItem.scheduleItemTitle;
    self.navigationItem.RightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEventClicked:)];
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

-(void)addEventClicked: (id)sender{
    CreateEventViewController *createEventViewController = [[CreateEventViewController alloc] init];
    [self.navigationController pushViewController:createEventViewController animated:YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
  

}


@end
