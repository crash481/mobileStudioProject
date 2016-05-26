#import "CreateRaceView.h"
#import "UIView+Facade.h"
@interface CreateRaceView()

@property UITextField *titleTextField;
@property UILabel *dateLabel;
@property UIDatePicker *datePicker;
@property UIButton *nextButton;
@property UILabel* errorLabel;

@end


@implementation CreateRaceView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleTextField = [[UITextField alloc] init];
        self.dateLabel = [[UILabel alloc] init];
        self.datePicker = [[UIDatePicker alloc] init];
        self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.errorLabel = [[UILabel alloc] init];
        
        [self.titleTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.titleTextField setPlaceholder:@"Название заезда"];
        [self.titleTextField setDelegate:self];
        [self.dateLabel setText:@"Выберите дату и время начала заезда:"];
        [self.dateLabel setFont:[UIFont systemFontOfSize:16]];
        [self.datePicker setDatePickerMode:UIDatePickerModeDateAndTime ];
        [self.datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:0]];
        [self.nextButton setTitle:@"Далее" forState:UIControlStateNormal];
        [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.nextButton setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        [self.errorLabel setText:@"Введите название заезда"];
        [self.errorLabel setTextColor:[UIColor redColor]];
        [self.errorLabel setFont:[UIFont systemFontOfSize:12]];
        [self.errorLabel setHidden:YES];
        
        [self addSubview:self.titleTextField];
        [self addSubview:self.dateLabel];
        [self addSubview:self.datePicker];
        [self addSubview:self.nextButton];
        [self addSubview:self.errorLabel];
    }
    return self;
}

-(void)layoutSubviews{
    
    if( [[UIDevice currentDevice] orientation] != UIDeviceOrientationLandscapeLeft &&  [[UIDevice currentDevice] orientation] != UIDeviceOrientationLandscapeRight){
    
        [self.titleTextField anchorTopCenterWithTopPadding:20 width:self.frame.size.width*0.8 height:40];
        [self.errorLabel alignUnder:self.titleTextField matchingLeftWithTopPadding:5 width:300 height:12];
        [self.dateLabel alignUnder:self.titleTextField withLeftPadding:10 topPadding:35 width:320 height:14];
        [self.datePicker alignBetweenTop:self.dateLabel andBottom:self.nextButton centeredWithLeftAndRightPadding:0 topAndBottomPadding:0];
        [self.nextButton anchorBottomCenterWithBottomPadding:20 width:200 height:35];
    }
    else {
    [self.titleTextField anchorTopCenterWithTopPadding:15 width:self.frame.size.width*0.8 height:30];
    [self.errorLabel alignUnder:self.titleTextField matchingLeftWithTopPadding:5 width:300 height:12];
    [self.dateLabel alignUnder:self.titleTextField withLeftPadding:10 topPadding:25 width:340 height:13];
    [self.datePicker alignBetweenTop:self.dateLabel andBottom:self.nextButton centeredWithLeftAndRightPadding:0 topAndBottomPadding:0];
    [self.nextButton anchorBottomCenterWithBottomPadding:10 width:200 height:35];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return  YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField.layer setBorderColor: [[UIColor blueColor] CGColor] ];
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
