#import "EventMembersViewController.h"
#import "EventMembersView.h"
#import "AccountViewController.h"
#import "User.h"
#import "Race.h"
#import "Chameleon.h"

@interface EventMembersViewController ()

@property EventMembersView *eventMembersView;
@property NSMutableArray<User*> *members;

@end

@implementation EventMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.members = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"Участники";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonPressed:)];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor flatBlackColor];
    self.navigationController.navigationBar.tintColor = [UIColor flatRedColorDark];
    
    User *hardcodeUser = [[User alloc] initWithNickname:@"garik1992@yayandex.ru" realName:@"Игорь" andSkillsDictionaty:@{[NSNumber numberWithInteger:TransportTypeSkateboard] : [NSNumber numberWithInteger:SkillLevelNewbie], [NSNumber numberWithInteger:TransportTypeBike] : [NSNumber numberWithInteger:SkillLevelMaster]}];
    
    [self.members addObject: hardcodeUser  ];
    [self.members addObject: hardcodeUser  ];
    [self.members addObject: hardcodeUser  ];
    [self.members addObject: hardcodeUser  ];
    [self.eventMembersView.tableView reloadData];
    
}

-(void)loadView{

    self.eventMembersView = [[EventMembersView alloc] init];
    self.view = self.eventMembersView;
    self.eventMembersView.tableView.delegate = self;
    self.eventMembersView.tableView.dataSource = self;
}


-(void)backButtonPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIndentifier = @"memberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIndentifier];
    }
    
    cell.textLabel.text = self.members[indexPath.row].nickname;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Имя: %@", self.members[indexPath.row].realName];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.members.count;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Исключить" handler:^(UITableViewRowAction * __nonnull action, NSIndexPath * __nonnull indexPath) {
        
        [self.members removeObjectAtIndex:indexPath.row];
        [self.eventMembersView.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    UITableViewRowAction *more = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Подробнее" handler:^(UITableViewRowAction * __nonnull action, NSIndexPath * __nonnull indexPath) {
        AccountViewController *accountViewController = [[AccountViewController alloc] initAsMemberAccount:self.members[indexPath.row]];
        UINavigationController *accountNavController = [[UINavigationController alloc] initWithRootViewController:accountViewController];
        accountViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:accountViewController action:@selector(backButtonPressed:)];
        [accountNavController.navigationBar setTranslucent:NO];
        [self presentViewController:accountNavController animated:YES completion:nil];
    }];
    
    return @[delete, more];
}

@end
