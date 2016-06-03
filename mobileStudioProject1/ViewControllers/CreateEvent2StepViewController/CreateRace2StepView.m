#import "CreateRace2StepView.h"
#import "UIView+Facade.h"

@interface CreateRace2StepView()

@property UIButton *createButton;

@end

@implementation CreateRace2StepView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.mapView = [[MKMapView alloc] init];
        self.startPlaceTextField = [[UITextField alloc] init];
        self.destinationPlaceTextField = [[UITextField alloc] init];
        self.createButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [self.startPlaceTextField setPlaceholder:@"Начало заезда из:"];
        [self.startPlaceTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.startPlaceTextField setDelegate:self];
        [self.destinationPlaceTextField setPlaceholder:@"Конец заезда в:"];
        [self.destinationPlaceTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.destinationPlaceTextField setDelegate:self];
        [self.createButton setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        [self.createButton setTitle:@"Создать" forState:UIControlStateNormal];
        [self.createButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self addSubview:self.mapView];
        [self addSubview:self.startPlaceTextField];
        [self addSubview:self.destinationPlaceTextField];
        [self addSubview:self.createButton];
    }
    return self;
}

- (void)layoutSubviews{
    
    if( [[UIDevice currentDevice] orientation] != UIDeviceOrientationLandscapeLeft &&  [[UIDevice currentDevice] orientation] != UIDeviceOrientationLandscapeRight ){
        
        [self.startPlaceTextField anchorTopCenterWithTopPadding:15 width:self.frame.size.width*0.8 height:35];
        [self.destinationPlaceTextField alignUnder:self.startPlaceTextField matchingCenterWithTopPadding:10 width:self.frame.size.width*0.8 height:35];
        [self.createButton alignUnder:self.destinationPlaceTextField matchingCenterWithTopPadding:15 width:230 height:34];
        [self.mapView alignUnder:self.createButton centeredFillingWidthAndHeightWithLeftAndRightPadding:0 topAndBottomPadding:0];
    }
    else{
        [self.startPlaceTextField anchorTopCenterWithTopPadding:10 width:self.frame.size.width*0.8 height:30];
        [self.destinationPlaceTextField alignUnder:self.startPlaceTextField matchingCenterWithTopPadding:7 width:self.frame.size.width*0.8 height:30];
        [self.createButton alignUnder:self.destinationPlaceTextField matchingCenterWithTopPadding:7 width:220 height:30];
        [self.mapView alignUnder:self.createButton centeredFillingWidthAndHeightWithLeftAndRightPadding:0 topAndBottomPadding:0];
    }
    self.mapView.frame = CGRectMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y+5, self.mapView.frame.size.width, self.mapView.frame.size.height);
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
