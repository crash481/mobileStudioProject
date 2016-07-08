#import "ScheduleViewController.h"
#import "RaceViewController.h"
#import "DateTools.h"
#import "ScheduleTableViewCell.h"
#import "CreateRaceViewController.h"
#import "RaceStorage.h"
#import "ArrayDataSource.h"
#import "Chameleon.h"
#import "UIScrollView+SVPullToRefresh.h"

@interface ScheduleViewController()

@property NSMutableArray<Race*> *schedules;
@property ScheduleView *scheduleView;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scheduleView.tableView.delegate = self;
    self.scheduleView.tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEventClicked:)];
    
    [self.scheduleView.tableView addPullToRefreshWithActionHandler:^(void){
        [RaceStorage loadRaces];
        if(self.schedules.count==0){
            [self.scheduleView.noRacesLabel setHidden:NO];
            [self.scheduleView.tableView reloadData];
        }
        else{
            [self.scheduleView.noRacesLabel setHidden:YES];
            [self.scheduleView.tableView reloadData];
        }
        
        [self.scheduleView.tableView.pullToRefreshView stopAnimating];
    }];
    [self.scheduleView.tableView.pullToRefreshView setTextColor:[UIColor flatWhiteColor]];
    [self.scheduleView.tableView.pullToRefreshView setArrowColor:[UIColor flatRedColorDark]];
    [self.scheduleView.tableView.pullToRefreshView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
}

-(void)viewWillAppear:(BOOL)animated{
    if(self.schedules.count==0){
        [self.scheduleView.noRacesLabel setHidden:NO];
    }
    else{
        [self.scheduleView.noRacesLabel setHidden:YES];
    }
}

-(instancetype)initWithSchedules: (NSMutableArray<Race*>*)schedules{
    
    if(self = [super init]){
       self.schedules = schedules;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.schedules.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 14;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIndentifier = @"scheduleCell";
    ScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    if( cell == nil ){
        cell = [[ScheduleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    }
    [cell configureData: self.schedules[indexPath.section] ];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Race *race = self.schedules[indexPath.section];
    RaceViewController *raceViewController = [[RaceViewController alloc] initWithRace:race];
    [self.navigationController pushViewController:raceViewController animated:YES];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Удалить" handler:^(UITableViewRowAction * __nonnull action, NSIndexPath * __nonnull indexPath) {
        
        [RaceStorage removeRace: [self.schedules objectAtIndex:indexPath.section]];
        [RaceStorage saveRaces];
        [self.scheduleView.tableView reloadData];
        if(self.schedules.count==0){
            [self.scheduleView.noRacesLabel setHidden:NO];
        }
        else{
            [self.scheduleView.noRacesLabel setHidden:YES];
        }
    }];
    delete.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.6];
    return @[delete];
}

-(void)loadView{
    self.scheduleView = [[ScheduleView alloc] init];
    self.view = self.scheduleView;
}

-(void)addEventClicked: (id)sender{
    CreateRaceViewController *createRaceViewController = [[CreateRaceViewController alloc] init];
    createRaceViewController.delegate = self;
    [self.navigationController pushViewController:createRaceViewController animated:YES];
}

-(void)didCreateSheduleItem:(Race *)race{
    
    [RaceStorage addRace:race];
    [RaceStorage saveRaces];
    [self.scheduleView.tableView reloadData];
}


@end
