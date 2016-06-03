#import "CreateRaceView.h"
#import "UIView+Facade.h"
#import "Race.h"
@interface CreateRaceView()

@property UITextField *titleTextField;
@property UILabel *dateLabel;
@property UIDatePicker *datePicker;
@property UILabel *transportTypeLabel;
@property UITableView *transportTypeTableView;
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
        self.transportTypeLabel = [[UILabel alloc] init];
        self.transportTypeTableView = [[UITableView alloc] init];
       
        [self.titleTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.titleTextField setPlaceholder:@"Название заезда"];
        [self.titleTextField setDelegate:self];
        [self.dateLabel setText:@"Дата и время начала заезда:"];
        [self.dateLabel setFont:[UIFont systemFontOfSize:16]];
        [self.transportTypeLabel setText:@"Транспорт для участия:"];
        [self.transportTypeLabel setFont:[UIFont systemFontOfSize:15]];
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
        [self addSubview:self.transportTypeLabel];
        [self addSubview:self.transportTypeTableView];
        [self addSubview:self.datePicker];
        [self addSubview:self.nextButton];
        [self addSubview:self.errorLabel];
    }
    return self;
}

-(void)layoutSubviews{
        [self.titleTextField anchorTopCenterWithTopPadding:10 width:self.frame.size.width*0.8 height:35];
        [self.errorLabel alignUnder:self.titleTextField matchingLeftWithTopPadding:2 width:300 height:12];
        [self.transportTypeLabel alignUnder:self.titleTextField matchingCenterWithTopPadding:25 width:self.width*0.8 height:15];
        [self.transportTypeTableView alignUnder:self.transportTypeLabel matchingCenterWithTopPadding:8 width:self.width*0.8 height:self.height*0.23];
        [self.dateLabel alignUnder:self.transportTypeTableView withLeftPadding:12 topPadding:10 width:340 height:13];
        [self.datePicker alignBetweenTop:self.dateLabel andBottom:self.nextButton centeredWithLeftAndRightPadding:0 topAndBottomPadding:0];
        [self.nextButton anchorBottomCenterWithBottomPadding:10 width:230 height:38];
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
