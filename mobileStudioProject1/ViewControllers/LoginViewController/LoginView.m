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
        
        self.loginTextField = [[UITextField alloc] init];
        self.loginTextField.backgroundColor = [UIColor lightGrayColor];
        self.loginTextField.textColor = [UIColor whiteColor];
        self.loginTextField.leftViewMode = UITextFieldViewModeAlways;
        self.loginTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginImage"]];
        [self.loginTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.loginTextField setPlaceholder:@"Логин"];
        
        self.passwordTextField = [[UITextField alloc] init];
        self.passwordTextField.backgroundColor = [UIColor lightGrayColor];
        self.passwordTextField.textColor = [UIColor whiteColor];
        self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        self.passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PasswordImage"]];
        [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.passwordTextField setPlaceholder:@"Пароль"];
        
        
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
    
    [self.loginTextField anchorBottomCenterWithBottomPadding:self.frame.size.height/2+80 width:280 height:30];
    [self.passwordTextField anchorBottomCenterWithBottomPadding:self.frame.size.height/2+40 width:280 height:30];
    
    [self.loginButton anchorBottomLeftWithLeftPadding:self.frame.size.width/2-140 bottomPadding:self.frame.size.height/2 width:115 height:25];
    [self.registrationButton anchorBottomLeftWithLeftPadding:self.frame.size.width/2-5 bottomPadding:self.frame.size.height/2 width:145 height:25];

    [self.enterButton anchorBottomCenterWithBottomPadding:20 width:200 height:25];
}

@end