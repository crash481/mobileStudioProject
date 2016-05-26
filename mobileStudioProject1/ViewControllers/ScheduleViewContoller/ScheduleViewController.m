#import "ScheduleViewController.h"
#import "RaceViewController.h"
#import "DateTools.h"
#import "ScheduleTableViewCell.h"
#import "CreateRaceViewController.h"

@interface ScheduleViewController()

@property NSMutableArray<Race*> *schedules;
@property ScheduleView *scheduleView;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEventClicked:)];
    
    [self.scheduleView.tableView reloadData];
    
}

-(instancetype)initWithSchedules: (NSArray*)schedules{
    
    if(self = [super init]){
       self.schedules = [schedules mutableCopy];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.schedules.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIndentifier = @"scheduleCell";
    ScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if( cell == nil ){
        cell = [[ScheduleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    }
    
    [cell configureData: self.schedules[indexPath.row] ];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Race *scheduleItem = self.schedules[indexPath.row];
    
    RaceViewController *scheduleItemViewController = [[RaceViewController alloc] initWithRace:scheduleItem];
    [self.navigationController pushViewController:scheduleItemViewController animated:YES];
    
    
}

-(void)loadView{
    self.scheduleView = [[ScheduleView alloc] init];
    self.view = self.scheduleView;
    self.scheduleView.tableView.delegate = self;
    self.scheduleView.tableView.dataSource = self;
}

-(void)addEventClicked: (id)sender{
    CreateRaceViewController *createEventViewController = [[CreateRaceViewController alloc] init];
    createEventViewController.delegate = self;
    [self.navigationController pushViewController:createEventViewController animated:YES];
}

-(void)didCreateSheduleItem:(Race *)scheduleItem{
    [self.schedules addObject:scheduleItem];
    [self.scheduleView.tableView reloadData];
}


@end
