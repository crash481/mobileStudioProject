#import "ScheduleItemViewController.h"
#import "EventMembersViewController.h"

@interface ScheduleItemViewController ()

@property (readwrite) ScheduleItem* scheduleItem;
@property ScheduleItemView *scheduleItemView;

@end

@implementation ScheduleItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    self.navigationItem.title = self.scheduleItem.scheduleItemTitle;
    [self.navigationItem.backBarButtonItem setTitle:@"fdf"];
    
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
@end
