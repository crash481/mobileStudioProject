#import "CreateRace2StepView.h"
#import "UIView+Facade.h"

@interface CreateRace2StepView()

@property UIButton *createButton;
@property UIButton *startOnMapButton;
@property UIButton *destinationOnMapButton;
@property UIButton *confirmMapSelection;

@end

@implementation CreateRace2StepView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        
        self.mapView = [[MKMapView alloc] init];
        self.startPlaceTextField = [[UITextField alloc] init];
        self.destinationPlaceTextField = [[UITextField alloc] init];
        self.createButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.startOnMapButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.destinationOnMapButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.confirmMapSelection = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [self.startPlaceTextField setPlaceholder:@"Начало заезда из:"];
        [self.startPlaceTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.startPlaceTextField setDelegate:self];
        self.startPlaceTextField.enabled = NO;
        [self.destinationPlaceTextField setPlaceholder:@"Конец заезда в:"];
        [self.destinationPlaceTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.destinationPlaceTextField setDelegate:self];
        self.destinationPlaceTextField.enabled = NO;
        [self.createButton setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        [self.createButton setTitle:@"Создать" forState:UIControlStateNormal];
        [self.createButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.confirmMapSelection setBackgroundImage:[UIImage imageNamed:@"AddButton"] forState:UIControlStateNormal];
        [self.confirmMapSelection setTitle:@"Подтвердить" forState:UIControlStateNormal];
        [self.confirmMapSelection setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.confirmMapSelection setHidden:YES];
        self.mapView.backgroundColor = [UIColor whiteColor];
        self.mapView.alpha = 0.9;
        
        
        [self.startOnMapButton setBackgroundImage:[UIImage imageNamed:@"DeleteButton"] forState:UIControlStateNormal];
        [self.startOnMapButton setAlpha:0.65];
        [self.startOnMapButton setTitle:@"Выбрать" forState:UIControlStateNormal];
        [self.startOnMapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIView *startLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 82, 31)];
         self.startPlaceTextField.leftView = startLeftView;
        [self.startPlaceTextField setLeftViewMode:UITextFieldViewModeAlways];
        
        [self.destinationOnMapButton setBackgroundImage:[UIImage imageNamed:@"DeleteButton"] forState:UIControlStateNormal];
        [self.destinationOnMapButton setAlpha:0.65];
        [self.destinationOnMapButton setTitle:@"Выбрать" forState:UIControlStateNormal];
        [self.destinationOnMapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIView *destinationLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 82, 31)];
        self.destinationPlaceTextField.leftView = destinationLeftView;
        [self.destinationPlaceTextField setLeftViewMode:UITextFieldViewModeAlways];

        [self addSubview:self.mapView];
        [self addSubview:self.startPlaceTextField];
        [self addSubview:self.destinationPlaceTextField];
        [self addSubview:self.createButton];
        [self addSubview:self.confirmMapSelection];
        [self addSubview:self.startOnMapButton];
        [self addSubview:self.destinationOnMapButton];
    }
    return self;
}

- (void)layoutSubviews{
    
        [self.startPlaceTextField anchorTopCenterWithTopPadding:15 width:self.frame.size.width*0.9 height:35];
        [self.destinationPlaceTextField alignUnder:self.startPlaceTextField matchingCenterWithTopPadding:10 width:self.frame.size.width*0.9 height:35];
        [self.createButton alignUnder:self.destinationPlaceTextField matchingCenterWithTopPadding:15 width:230 height:34];
        [self.mapView alignUnder:self.createButton centeredFillingWidthAndHeightWithLeftAndRightPadding:0 topAndBottomPadding:0];
        [self.confirmMapSelection anchorBottomCenterWithBottomPadding:0 width:self.frame.size.width height:36];
        self.mapView.frame = CGRectMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y+5, self.mapView.frame.size.width, self.mapView.frame.size.height);
    
    [self.startOnMapButton alignUnder:self.startPlaceTextField matchingLeftWithTopPadding:-33 width:80 height:31];
    CGRect startOnMapButtonFrame = self.startOnMapButton.frame;
    startOnMapButtonFrame.origin.x +=2;
    self.startOnMapButton.frame = startOnMapButtonFrame;
    
    [self.destinationOnMapButton alignUnder:self.destinationPlaceTextField matchingLeftWithTopPadding:-33 width:80 height:31];
    CGRect destinationOnMapButtonFrame = self.destinationOnMapButton.frame;
    destinationOnMapButtonFrame.origin.x +=2;
    self.destinationOnMapButton.frame = destinationOnMapButtonFrame;
    
}

@end
