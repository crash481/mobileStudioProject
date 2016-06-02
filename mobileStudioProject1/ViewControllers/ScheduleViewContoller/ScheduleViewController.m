#import "ScheduleViewController.h"
#import "RaceViewController.h"
#import "DateTools.h"
#import "ScheduleTableViewCell.h"
#import "CreateRaceViewController.h"
#import "RaceStorage.h"

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

-(void)viewWillAppear:(BOOL)animated{
    [self.scheduleView.tableView reloadData];
}

-(instancetype)initWithSchedules: (NSMutableArray<Race*>*)schedules{
    
    if(self = [super init]){
       self.schedules = schedules;
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
    
    Race *race = self.schedules[indexPath.row];
    
    RaceViewController *raceViewController = [[RaceViewController alloc] initWithRace:race];
    [self.navigationController pushViewController:raceViewController animated:YES];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Исключить" handler:^(UITableViewRowAction * __nonnull action, NSIndexPath * __nonnull indexPath) {
        [self.schedules removeObjectAtIndex:indexPath.row];
        
        [RaceStorage removeRace: [self.schedules objectAtIndex:indexPath.row]];
        [RaceStorage saveRaces];
        [self.scheduleView.tableView reloadData];
    }];
    
    
    return @[delete];
}

-(void)loadView{
    self.scheduleView = [[ScheduleView alloc] init];
    self.view = self.scheduleView;
    self.scheduleView.tableView.delegate = self;
    self.scheduleView.tableView.dataSource = self;
}

-(void)addEventClicked: (id)sender{
    CreateRaceViewController *createRaceViewController = [[CreateRaceViewController alloc] init];
    createRaceViewController.delegate = self;
    [self.navigationController pushViewController:createRaceViewController animated:YES];
}

-(void)didCreateSheduleItem:(Race *)race{
    
    [RaceStorage addRace:race];
    [self.scheduleView.tableView reloadData];
    [RaceStorage saveRaces];
}


@end
