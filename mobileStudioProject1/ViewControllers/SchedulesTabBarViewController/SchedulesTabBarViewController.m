#import "SchedulesTabBarViewController.h"
#import "ScheduleViewController.h"
#import "AccountViewController.h"
#import "NSDate+DateTools.h"
#import "LoginViewController.h"
#import "RaceStorage.h"
#import "FileStorage.h"
#import "UserProfile.h"
#import "Chameleon.h"

@interface SchedulesTabBarViewController ()

@property BOOL boolForPresentLoginWindow;
@end

@implementation SchedulesTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    [RaceStorage loadRaces];
    self.boolForPresentLoginWindow = YES;
    self.tabBar.barTintColor = [UIColor flatBlackColor];
    self.tabBar.tintColor = [UIColor flatRedColorDark];
    
    ScheduleViewController *skateboardsViewController = [[ScheduleViewController alloc] initWithSchedules:[RaceStorage skateboardSchedules]];
    skateboardsViewController.view.tag = 0;
    UINavigationController *skateboardsNavController = [[UINavigationController alloc] initWithRootViewController: skateboardsViewController];
    
    skateboardsNavController.topViewController.navigationItem.title = @"Скейт/Лонгборд";
    skateboardsNavController.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    skateboardsNavController.tabBarItem.title = @"Скейт/Лонгборд";
    skateboardsNavController.tabBarItem.image = [UIImage imageNamed:@"Skateboard"];
    skateboardsNavController.navigationBar.translucent = NO;
    skateboardsNavController.navigationBar.barStyle = UIBarStyleBlack;
    skateboardsNavController.navigationBar.barTintColor = [UIColor flatBlackColor];
    skateboardsNavController.navigationBar.tintColor = [UIColor flatRedColorDark];
    
    
    ScheduleViewController *bikesViewController = [[ScheduleViewController alloc] initWithSchedules:[RaceStorage bikeSchedules]];
    bikesViewController.view.tag = 1;
    UINavigationController *bikesNavController = [[UINavigationController alloc] initWithRootViewController: bikesViewController];
    bikesNavController.topViewController.navigationItem.title = @"Велосипед";
    bikesNavController.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    bikesNavController.tabBarItem.title = @"Велосипед";
    bikesNavController.tabBarItem.image = [UIImage imageNamed:@"Bike"];
    bikesNavController.navigationBar.translucent = NO;
    bikesNavController.navigationBar.barStyle = UIBarStyleBlack;
    bikesNavController.navigationBar.barTintColor = [UIColor flatBlackColor];
    bikesNavController.navigationBar.tintColor = [UIColor flatRedColorDark];
    
    UINavigationController *accountNavController = [[UINavigationController alloc] initWithRootViewController:[[AccountViewController alloc] initAsUserAccount:[UserProfile sharedProfile].user ]];
    accountNavController.tabBarItem.image = [UIImage imageNamed:@"AccountIcon"];
    accountNavController.tabBarItem.title = @"Аккаунт";
    accountNavController.navigationBar.translucent = NO;
    accountNavController.navigationBar.barStyle = UIBarStyleBlack;
    accountNavController.navigationBar.barTintColor = [UIColor flatBlackColor];
    accountNavController.navigationBar.tintColor = [UIColor flatRedColorDark];
    
    [self setViewControllers:@[skateboardsNavController, bikesNavController, accountNavController]];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(self.boolForPresentLoginWindow){
        LoginViewController *loginViewController = [[LoginViewController alloc] init];
        [self presentViewController:loginViewController animated:NO completion:nil];
        self.boolForPresentLoginWindow = NO;
    }
}



@end
