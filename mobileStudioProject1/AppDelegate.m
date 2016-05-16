#import "AppDelegate.h"
#import "SchedulesTabBarViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SchedulesTabBarViewController *schedulesTabBarViewController = [[SchedulesTabBarViewController alloc] init];
    self.window.rootViewController = schedulesTabBarViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
