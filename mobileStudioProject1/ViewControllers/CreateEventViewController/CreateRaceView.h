#import <UIKit/UIKit.h>

@interface CreateRaceView : UIView<UITextFieldDelegate, UIPickerViewDelegate>

@property (readonly)UITextField *titleTextField;
@property (readonly)UIDatePicker *datePicker;
@property (readonly)UITableView *transportTypeTableView;
@property (readonly)UIButton *nextButton;
@property (readonly)UILabel* errorLabel;

@end
