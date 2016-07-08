#import "AccountViewController.h"
#import "LoginViewController.h"
#import "AccountView.h"
#import "FileStorage.h"
#import "User.h"
#import "UserProfile.h"

@interface AccountViewController ()

@property AccountView *accountView;
@property NSArray<NSString*> *transportStrings;
@property NSArray<NSString*> *levelStrings;
@property User *accountUser;
@property BOOL isUserAccount;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.accountUser.nickname;
    if(!self.accountUser.realName){
        self.accountUser.realName = @"Не заполнено";
    }
    self.accountView.realNameTextBox.placeholder = self.accountUser.realName;
    self.accountView.realNameTextBox.delegate = self;
    self.accountView.skillsTableView.delegate = self;
    self.accountView.skillsTableView.dataSource = self;
    self.transportStrings = @[@"Скейт/Лонгборд", @"Велосипед"]; //needs same order as TransportType enum in User.h, in future necessary to improve  logic
    self.levelStrings = @[@"Новичок", @"Способный", @"Продвинутый", @"Эксперт"]; //needs same order as SkillLevel enum in User.h, in future necessary to improve  logic
    [self.accountView.skillsTableView reloadData];
    [self.accountView.addSkillButton addTarget:self action:@selector(addSkillButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.accountView.logoutButton addTarget:self action:@selector(logoutButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(instancetype)initAsMemberAccount:(User*)user{
    if(self = [super init]){
        self.accountUser = user;
        self.isUserAccount = NO;
    }
    return self;
}

-(instancetype)initAsUserAccount:(User*)user{
    if(self = [super init]){
        self.accountUser = user;
        self.isUserAccount = YES;
    }
    return self;
}



-(void)loadView{
    [super loadView];
    self.accountView = [[AccountView alloc] init];
    self.view = self.accountView;
}

-(void)viewWillAppear:(BOOL)animated{
    if(self.isUserAccount){
        self.accountUser = [[UserProfile sharedProfile] user];
        self.navigationItem.title = self.accountUser.nickname;
        if(!self.accountUser.realName){
            self.accountUser.realName = @"Не заполнено";
        }
        self.accountView.realNameTextBox.placeholder = self.accountUser.realName;
        [self.accountView.skillsTableView reloadData];
    }
    else{
        self.accountView.logoutButton.hidden = YES;
        self.accountView.addSkillButton.hidden = YES;
        self.accountView.realNameTextBox.userInteractionEnabled = NO;
    }
    
    if(self.accountUser.skillsDictionary.count==0){
        [self.accountView.noSkillsLabel setHidden:NO];
    }
    else{
        [self.accountView.noSkillsLabel setHidden:YES];
    }
}

-(void)addSkillButtonTapped:(id)sender{
    [ActionSheetCustomPicker showPickerWithTitle:@"Новое умение" delegate:self showCancelButton:YES origin:sender];
}

-(void)logoutButtonTapped:(id)sender{
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self presentViewController:loginViewController animated:YES completion:nil];
}

-(void)backButtonPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0){
        return self.transportStrings.count;
    }
    else{
        return self.levelStrings.count;
    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel* label = (UILabel*)view;
    if (label == nil) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 22)];
        [label setTextAlignment:NSTextAlignmentCenter];
    }
    if(component==0){
        label.text = self.transportStrings[row];
    }
    else{
        label.text = self.levelStrings[row];
    }
    return label;
}

- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin{
    
    NSNumber *selectedTransport = [NSNumber numberWithInteger:[(UIPickerView*)[actionSheetPicker pickerView] selectedRowInComponent:0] ];
    NSNumber *selectedSkill = [NSNumber numberWithInteger:[(UIPickerView*)[actionSheetPicker pickerView] selectedRowInComponent:1] ];
    [self.accountUser.skillsDictionary setObject:selectedSkill forKey:selectedTransport];
    [self.accountView.skillsTableView reloadData];
    [[UserProfile sharedProfile] saveUserProfile];
    if(self.accountUser.skillsDictionary.count==0){
        [self.accountView.noSkillsLabel setHidden:NO];
    }
    else{
        [self.accountView.noSkillsLabel setHidden:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseIndentifier = @"skillCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIndentifier];
    }
    cell.textLabel.text = self.transportStrings[self.accountUser.skillsDictionary.allKeys[indexPath.section].integerValue];
    cell.detailTextLabel.text = self.levelStrings[ [self.accountUser.skillsDictionary objectForKey: self.accountUser.skillsDictionary.allKeys[indexPath.section]].integerValue ];
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.85];
    cell.layer.cornerRadius = 5;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.accountUser.skillsDictionary.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Удалить" handler:^(UITableViewRowAction * __nonnull action, NSIndexPath * __nonnull indexPath) {
        
        [self.accountUser.skillsDictionary removeObjectForKey: self.accountUser.skillsDictionary.allKeys[indexPath.section]];
        [self.accountView.skillsTableView reloadData];
        [[UserProfile sharedProfile] saveUserProfile];
        if(self.accountUser.skillsDictionary.count==0){
            [self.accountView.noSkillsLabel setHidden:NO];
        }
        else{
            [self.accountView.noSkillsLabel setHidden:YES];
        }
    }];
    return @[delete];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.hasText){
        self.accountUser.realName = textField.text;
        self.accountView.realNameTextBox.placeholder = self.accountUser.realName;
        self.accountView.realNameTextBox.text = @"";
        [[UserProfile sharedProfile] saveUserProfile];
    }
}


@end
