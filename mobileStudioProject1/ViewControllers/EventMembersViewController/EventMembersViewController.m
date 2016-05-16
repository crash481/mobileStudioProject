#import "EventMembersViewController.h"
#import "EventMembersView.h"
#import "Member.h"

@interface EventMembersViewController ()

@property EventMembersView *eventMembersView;
@property NSMutableArray<Member*> *members;

@end

@implementation EventMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.members = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"Участники";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonPressed:)];
    

 
    
    [self.members addObject: [[Member alloc] initWithNickname:@"Игорь" andAge:21]  ];
    [self.members addObject: [[Member alloc] initWithNickname:@"Игорь" andAge:17]  ];
    [self.members addObject: [[Member alloc] initWithNickname:@"Игорь" andAge:23]  ];
    [self.members addObject: [[Member alloc] initWithNickname:@"Игорь" andAge:19]  ];
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

-(void) detailsButtonPressed: ( UITableViewRowAction * _Nonnull ) action indexPath: (NSIndexPath * __nonnull) indexPath {
        // handle
};

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIndentifier = @"memberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIndentifier];
    }
    
    cell.textLabel.text = self.members[indexPath.row].nickname;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Возраст: %lu", (unsigned long)self.members[indexPath.row].age];
    
    
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
        NSLog(@"hello");
    }];
    
    return @[delete, more];
}

@end
