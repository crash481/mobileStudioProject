#import <UIKit/UIKit.h>
#import "ActionSheetPicker.h"
#import "User.h"

@interface AccountViewController : UIViewController<ActionSheetCustomPickerDelegate, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

-(instancetype)initAsMemberAccount:(User*)user;
-(instancetype)initAsUserAccount:(User*)user;

@end
