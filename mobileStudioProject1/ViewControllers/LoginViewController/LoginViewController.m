#import "LoginViewController.h"
#import "LoginView.h"
#import "SchedulesTabBarViewController.h"
#import "FileStorage.h"
#import "User.h"
#import "UserProfile.h"

@interface LoginViewController ()

@property LoginView *loginView;
@property NSString *username;
@property NSString *password;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginView.enterButton addTarget:self action:@selector(enterButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadView {

    self.loginView = [[LoginView alloc] init];
    self.view = self.loginView;
}

- (void)enterButtonClicked:(id)sender {
    
    if(self.loginView.loginTextField.hasText){
        self.username = self.loginView.loginTextField.text;
    }
    else{
        self.username = @"unknownUserName";
    }
    [UserProfile sharedProfile].user.nickname = self.username;
    [[UserProfile sharedProfile] saveUserProfile];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
