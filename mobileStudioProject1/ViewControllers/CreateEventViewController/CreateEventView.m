#import "CreateEventView.h"
#import "UIView+Facade.h"
@interface CreateEventView()

@property UITextField *titleTextField;
@property UILabel *dateLabel;
@property UIDatePicker *datePicker;
@property UIButton *nextButton;

@end


@implementation CreateEventView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleTextField = [[UITextField alloc] init];
        self.dateLabel = [[UILabel alloc] init];
        self.datePicker = [[UIDatePicker alloc] init];
        self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        
        [self.titleTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.titleTextField setPlaceholder:@"Название заезда"];
        [self.dateLabel setText:@"Выберите дату и время начала заезда:"];
        [self.dateLabel setFont:[UIFont systemFontOfSize:16]];
        [self.datePicker setDatePickerMode:UIDatePickerModeDateAndTime ];
        [self.nextButton setTitle:@"Далее" forState:UIControlStateNormal];
        [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.nextButton setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        
        
        
        [self addSubview:self.titleTextField];
        [self addSubview:self.dateLabel];
        [self addSubview:self.datePicker];
        [self addSubview:self.nextButton];
    }
    return self;
}

-(void)layoutSubviews{
    
    if( [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait ){
    
    [self.titleTextField anchorTopCenterWithTopPadding:self.frame.size.height*0.06 width:self.frame.size.width*0.8 height:40];
    [self.dateLabel alignUnder:self.titleTextField withLeftPadding:10 topPadding:self.frame.size.height*0.12 width:320 height:14];
    [self.datePicker alignUnder:self.dateLabel withLeftPadding:0 topPadding:5 width:self.frame.size.width height:self.frame.size.height*0.5];
    [self.nextButton alignUnder:self.datePicker matchingCenterWithTopPadding:self.frame.size.height*0.05 width:200 height:35];
    }
    else {
    [self.titleTextField anchorTopCenterWithTopPadding:self.frame.size.height*0.06 width:self.frame.size.width*0.8 height:30];
    [self.dateLabel alignUnder:self.titleTextField withLeftPadding:10 topPadding:self.frame.size.height*0.1 width:340 height:13];
    [self.datePicker alignUnder:self.dateLabel withLeftPadding:0 topPadding:0 width:self.frame.size.width height:self.frame.size.height*0.5];
    [self.nextButton alignUnder:self.datePicker matchingCenterWithTopPadding:self.frame.size.height*0.03 width:200 height:27];
    }
}


@end
