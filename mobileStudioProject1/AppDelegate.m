#import "AppDelegate.h"
#import "LoginViewController.h"
#import "SchedulesTabBarViewController.h"
#import "IQKeyboardManager.h"
#import <MapKit/MapKit.h>
#import "Chameleon.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SchedulesTabBarViewController *schedulesTabBarViewController = [[SchedulesTabBarViewController alloc] init];
    self.window.rootViewController = schedulesTabBarViewController;
    
    IQKeyboardManager *IQKeyboard = [IQKeyboardManager sharedManager];
    [IQKeyboard setEnable:YES];
    [IQKeyboard setShouldResignOnTouchOutside:YES];
    [self.window makeKeyAndVisible];
    
   
    return YES;
}


@end
