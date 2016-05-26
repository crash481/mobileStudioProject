#import <UIKit/UIKit.h>

@interface CreateRaceView : UIView<UITextFieldDelegate>

@property (readonly)UITextField *titleTextField;
@property (readonly)UIDatePicker *datePicker;
@property (readonly)UIButton *nextButton;
@property (readonly)UILabel* errorLabel;

@end