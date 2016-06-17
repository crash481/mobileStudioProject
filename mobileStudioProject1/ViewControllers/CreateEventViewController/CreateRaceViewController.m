#import "CreateRaceViewController.h"
#import "CreateRaceView.h"
#import "CreateRace2StepViewController.h"
#import "UIView+CustomAnimations.h"

@interface CreateRaceViewController ()

@property CreateRaceView *createRaceView;

@property NSString *eventTitle;
@property NSDate *eventDate;
@property NSMutableArray<NSNumber*> *selectedTransportTypes;
@property NSMutableArray<NSString*> *transportTypes;
@property UIScrollView *scroll;

@end

@implementation CreateRaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Создание мероприятия"];
    [self.createRaceView.nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
     self.transportTypes = (NSMutableArray<NSString*>*)@[@"Скейтборд/лонгборд", @"Велосипед" ];
    
    self.selectedTransportTypes = [[NSMutableArray alloc] init];
    self.createRaceView.transportTypeTableView.delegate = self;
    self.createRaceView.transportTypeTableView.dataSource = self;
    self.createRaceView.transportTypeTableView.allowsMultipleSelection = YES;
    
}

- (void)loadView{
    [super loadView];
    
   self.createRaceView = [[CreateRaceView alloc] init];
    self.scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scroll.contentSize = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - self.tabBarController.tabBar.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height).size;
    
    self.createRaceView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - self.tabBarController.tabBar.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height);
    
    [self.scroll addSubview:self.createRaceView];
    self.view = self.scroll;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIndentifier = @"transportTypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    }
    cell.textLabel.text = self.transportTypes[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.transportTypes.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 28;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
     [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
}

- (void)nextButtonClicked: (id)sender{
    
    if(![self.createRaceView.titleTextField  hasText]){
        self.createRaceView.errorLabel.text = @"Введите название заезда";
        [self.createRaceView.errorLabel setHidden:NO];
        [self.createRaceView.titleTextField.layer setBorderColor:[[UIColor redColor] CGColor] ];
        [self.createRaceView.titleTextField.layer setBorderWidth: 1];
        [self.createRaceView.titleTextField.layer setCornerRadius: 6];
        [self.createRaceView.titleTextField triggerShakeAnimationToView];
    }
    else if ([self.createRaceView.transportTypeTableView indexPathsForSelectedRows].count == 0){
        self.createRaceView.errorLabel.text = @"Выберите транспорт для участия";
        [self.createRaceView.errorLabel setHidden:NO];
        
    }
    else{
        self.eventTitle = self.createRaceView.titleTextField.text;
        self.eventDate = self.createRaceView.datePicker.date;
        for (NSIndexPath *indexPath in [self.createRaceView.transportTypeTableView indexPathsForSelectedRows]) {
            [self.selectedTransportTypes addObject: [NSNumber numberWithInteger:indexPath.row]];
        }
        
        [self.createRaceView.errorLabel setHidden:YES];
        CreateRace2StepViewController *createRaceStep2ViewController = [[CreateRace2StepViewController alloc] initWithEventTitle:self.eventTitle transportTypes:self.selectedTransportTypes andEventDate:self.eventDate];
        createRaceStep2ViewController.delegate = self.delegate;
        [self.navigationController pushViewController:createRaceStep2ViewController animated:YES];
    }
}


@end
