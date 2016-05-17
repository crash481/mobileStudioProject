#import "LoginViewController.h"
#import "LoginView.h"
#import "SchedulesTabBarViewController.h"

@interface LoginViewController ()

@property LoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginView.enterButton addTarget:self action:@selector(enterButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)loadView{

    self.loginView = [[LoginView alloc] init];
    self.view = self.loginView;
}

-(void)enterButtonClicked: (id)sender{
    
    SchedulesTabBarViewController *schedulesTabBarViewController = [[SchedulesTabBarViewController alloc] init];
    [self presentViewController:schedulesTabBarViewController animated:YES completion:nil];
}

@end
