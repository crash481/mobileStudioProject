#import "AppDelegate.h"
#import "LoginViewController.h"
#import "IQKeyboardManager.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    self.window.rootViewController = loginViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    
    IQKeyboardManager *IQKeyboard = [IQKeyboardManager sharedManager];
    [IQKeyboard setEnable:YES];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
