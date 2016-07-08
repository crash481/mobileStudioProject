#import "AccountView.h"
#import "UIView+Facade.h"
#import "IQKeyboardManager.h"


@interface AccountView()

@property UITextField *realNameTextBox;
@property UITableView *skillsTableView;
@property UIButton *addSkillButton;
@property UIButton *logoutButton;
@property UILabel *realNameLeftLabel;
@property (readwrite) UILabel *noSkillsLabel;

@end

@implementation AccountView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        
        self.realNameTextBox = [[UITextField alloc] init];
        self.skillsTableView = [[UITableView alloc] init];
        self.addSkillButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.realNameLeftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 30)];
        self.noSkillsLabel = [[UILabel alloc] init];
        
        [self.noSkillsLabel setText:@"Способностей нет"];
        [self.noSkillsLabel setFont:[UIFont systemFontOfSize:20]];
        [self.noSkillsLabel setTextAlignment:NSTextAlignmentCenter];
        self.noSkillsLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.85];
        self.noSkillsLabel.layer.cornerRadius = 6;
        self.noSkillsLabel.clipsToBounds = YES;
        [self.noSkillsLabel setHidden:YES];
        [self.realNameLeftLabel setText:@"Ваше имя:"];
        [self.realNameLeftLabel setTextColor:[UIColor blackColor]];
        [self.realNameLeftLabel setTextAlignment:NSTextAlignmentRight];
        [self.realNameTextBox setBorderStyle:UITextBorderStyleRoundedRect];
        [self.realNameTextBox setBackgroundColor: [UIColor whiteColor] ];
        [self.realNameTextBox setLeftView:self.realNameLeftLabel];
        [self.realNameTextBox setLeftViewMode:UITextFieldViewModeAlways];
        
        self.skillsTableView.backgroundColor = [UIColor clearColor];
        self.skillsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.addSkillButton setTitle:@"Новое умение" forState:UIControlStateNormal];
        self.addSkillButton.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
        [self.addSkillButton setBackgroundImage:[UIImage imageNamed:@"AddButton"] forState:UIControlStateNormal];
        [self.addSkillButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        [self.logoutButton setTitle:@"Сменить аккаунт" forState:UIControlStateNormal];
        [self.logoutButton setBackgroundImage:[UIImage imageNamed:@"DeleteButton"] forState:UIControlStateNormal];
        [self.logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.logoutButton.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:15];
        
        [self addSubview:self.realNameTextBox];
        [self addSubview:self.skillsTableView];
        [self addSubview:self.addSkillButton];
        [self addSubview:self.logoutButton];
        [self addSubview:self.realNameLeftLabel];
        [self addSubview:self.noSkillsLabel];
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
 
    [self.realNameTextBox anchorTopCenterWithTopPadding:20 width:self.width*0.85 height:40];
    [self.logoutButton anchorBottomRightWithRightPadding:6 bottomPadding:8 width:self.width*0.475 height:37];
    [self.addSkillButton anchorBottomLeftWithLeftPadding:6 bottomPadding:8 width:self.width*0.475 height:37 ];
    [self.skillsTableView alignBetweenTop:self.realNameTextBox andBottom:self.addSkillButton centeredWithLeftAndRightPadding:10 topAndBottomPadding:10];
    [self.noSkillsLabel anchorInCenterWithWidth:self.width-16  height:60];
}

@end
