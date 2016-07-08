#import <UIKit/UIKit.h>

@interface AccountView : UIView

@property (readonly)UITextField *realNameTextBox;
@property (readonly)UITableView *skillsTableView;
@property (readonly)UIButton *addSkillButton;
@property (readonly)UIButton *logoutButton;
@property (readonly) UILabel *noSkillsLabel;
@end
