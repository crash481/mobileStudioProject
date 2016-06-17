#import "LoginView.h"
#import "UIView+Facade.h"

@interface LoginView ()

@property UITextField *loginTextField;
@property UITextField *passwordTextField;
@property UIButton *loginButton;
@property UIButton *registrationButton;
@property UIButton *enterButton;

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame ]){
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        
        self.loginTextField = [[UITextField alloc] init];
        self.loginTextField.backgroundColor = [UIColor lightGrayColor];
        self.loginTextField.textColor = [UIColor whiteColor];
        self.loginTextField.leftViewMode = UITextFieldViewModeAlways;
        self.loginTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginImage"]];
        [self.loginTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.loginTextField setPlaceholder:@"Логин"];
        self.loginTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [self.loginTextField setDelegate:self];
        
        self.passwordTextField = [[UITextField alloc] init];
        self.passwordTextField.backgroundColor = [UIColor lightGrayColor];
        self.passwordTextField.textColor = [UIColor whiteColor];
        self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        self.passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PasswordImage"]];
        [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.passwordTextField setPlaceholder:@"Пароль"];
        self.passwordTextField.secureTextEntry = YES;
        [self.passwordTextField setDelegate:self];
        
        
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.loginButton setBackgroundImage: [UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.loginButton setTitle:@"Войти" forState:UIControlStateNormal];
        self.registrationButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.registrationButton setBackgroundImage: [UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        [self.registrationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.registrationButton setTitle:@"Регистрация" forState:UIControlStateNormal];
        
        self.enterButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.enterButton setTitle:@"Войти без регистрации" forState:UIControlStateNormal];
        [self.enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self addSubview:self.loginButton];
        [self addSubview:self.registrationButton];
        [self addSubview:self.loginTextField];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.enterButton];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.loginTextField anchorBottomCenterWithBottomPadding:self.frame.size.height/2+80 width:290 height:38];
    [self.passwordTextField alignUnder:self.loginTextField matchingLeftAndRightWithTopPadding:10 height:38];
    
    [self.loginButton alignUnder:self.passwordTextField matchingLeftWithTopPadding:8 width:120 height:32];
    [self.registrationButton alignUnder:self.passwordTextField matchingRightWithTopPadding:8 width:150 height:32];
    
    [self.enterButton anchorBottomCenterWithBottomPadding:20 width:200 height:25];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return  YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField.layer setBorderColor: [[UIColor lightTextColor] CGColor] ];
    [textField.layer setBorderWidth:1.5];
    [textField.layer setCornerRadius:6];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField.layer setBorderWidth:0];
    return YES;
}
@end