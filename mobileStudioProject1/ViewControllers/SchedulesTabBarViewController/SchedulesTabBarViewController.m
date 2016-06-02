#import "SchedulesTabBarViewController.h"
#import "ScheduleViewController.h"
#import "AccountViewController.h"
#import "NSDate+DateTools.h"
#import "RaceStorage.h"

@interface SchedulesTabBarViewController ()

@end

@implementation SchedulesTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    [RaceStorage loadRaces];
    
    ScheduleViewController *skateboardsViewController = [[ScheduleViewController alloc] initWithSchedules:[RaceStorage skateboardSchedules]];
    skateboardsViewController.view.tag = 0;
    UINavigationController *skateboardsNavController = [[UINavigationController alloc] initWithRootViewController: skateboardsViewController];
    
    skateboardsNavController.topViewController.navigationItem.title = @"Скейт/Лонгборд";
    skateboardsNavController.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    skateboardsNavController.tabBarItem.title = @"Скейт/Лонгборд";
    skateboardsNavController.tabBarItem.image = [UIImage imageNamed:@"Skateboard"];
    skateboardsNavController.navigationBar.translucent = NO;
    
    ScheduleViewController *bikesViewController = [[ScheduleViewController alloc] initWithSchedules:[RaceStorage bikeSchedules]];
    bikesViewController.view.tag = 1;
    UINavigationController *bikesNavController = [[UINavigationController alloc] initWithRootViewController: bikesViewController];
    bikesNavController.topViewController.navigationItem.title = @"Велосипед";
    bikesNavController.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    bikesNavController.tabBarItem.title = @"Велосипед";
    bikesNavController.tabBarItem.image = [UIImage imageNamed:@"Bike"];
    bikesNavController.navigationBar.translucent = NO;
    
    UINavigationController *accountNavController = [[UINavigationController alloc] initWithRootViewController:[[AccountViewController alloc] init]];
    accountNavController.tabBarItem.image = [UIImage imageNamed:@"AccountIcon"];
    accountNavController.tabBarItem.title = @"Аккаунт";
    accountNavController.navigationBar.translucent = NO;
    
    [self setViewControllers:@[skateboardsNavController, bikesNavController, accountNavController]];
    
}


@end
