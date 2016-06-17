#import <UIKit/UIKit.h>

@interface LoginView : UIView<UITextFieldDelegate>

@property (readonly)UITextField *loginTextField;
@property (readonly)UIButton *loginButton;
@property (readonly)UIButton *registrationButton;
@property (readonly)UIButton *enterButton;

@end
