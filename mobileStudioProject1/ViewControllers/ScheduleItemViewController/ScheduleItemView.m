#import "ScheduleItemView.h"
#import "UIView+Facade.h"
#import "NSDate+DateTools.h"

@interface ScheduleItemView()

@property UILabel *startDateLabel;
@property UILabel *startLocationLabel;
@property UILabel *destinationLabel;
@property(readwrite) UIButton *joinButton;
@property(readwrite) UIButton *membersButton;

@property UILabel *startDateText;
@property UILabel *startLocationText;
@property UILabel *destinationText;
@property UILabel *durationText;

@end


@implementation ScheduleItemView

- (instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.mapView = [[MKMapView alloc] init];
        self.startDateLabel = [[UILabel alloc] init];
        self.startLocationLabel = [[UILabel alloc] init];
        self.destinationLabel = [[UILabel alloc] init];
        self.startDateText = [[UILabel alloc] init];
        self.startLocationText = [[UILabel alloc] init];
        self.destinationText = [[UILabel alloc] init];
        self.joinButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.membersButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        
        [self.startLocationText setText:@"Выезд из: "];
        [self.destinationText setText:@"Едем в: "];
        [self.startDateText setText:@"Начало заезда: "];
       
        [self.joinButton setTitle:@"Присоедениться" forState: UIControlStateNormal ];
        [self.joinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.joinButton setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        [self.membersButton setTitle:@"Участники" forState: UIControlStateNormal ];
        [self.membersButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.membersButton setBackgroundImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
        
        [self addSubview: self.mapView];
        [self addSubview: self.startDateText];
        [self addSubview: self.startLocationText];
        [self addSubview: self.destinationText];
        [self addSubview: self.startDateLabel];
        [self addSubview: self.startLocationLabel];
        [self addSubview: self.destinationLabel];
        [self addSubview: self.joinButton];
        [self addSubview: self.membersButton];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.startLocationText anchorTopLeftWithLeftPadding:10 topPadding:15 width:130 height:20];
    [self.destinationText alignUnder:self.startLocationText withLeftPadding:10 topPadding:5 width:130 height:20];
    [self.startDateText alignUnder:self.destinationText withLeftPadding:10 topPadding:5 width:130 height:20];
    
    [self.startLocationLabel anchorTopLeftWithLeftPadding:145 topPadding:15 width:200 height:20];
    [self.destinationLabel alignUnder:self.startLocationLabel withLeftPadding:145 topPadding:5 width:200 height:20];
    [self.startDateLabel alignUnder:self.destinationLabel withLeftPadding:145 topPadding:5 width:200 height:20];
    
    
    [self.joinButton alignUnder:self.startDateLabel withLeftPadding:20 topPadding:self.frame.size.height*0.07 width:self.frame.size.width*0.42 height:35];
    [self.membersButton alignUnder:self.startDateLabel withRightPadding:20 topPadding:self.frame.size.height*0.07 width:self.frame.size.width*0.42 height:35];
    
    [self.mapView alignUnder:self.joinButton centeredFillingWidthAndHeightWithLeftAndRightPadding:0 topAndBottomPadding:0];

}
-(void) configureData: (ScheduleItem*)scheduleItem{
    
    self.startLocationLabel.text = scheduleItem.startLocation;
    self.destinationLabel.text = scheduleItem.destination;
    self.startDateLabel.text = [scheduleItem.startDate formattedDateWithFormat:@"dd MMMM YYYY в HH:mm" locale:[[NSLocale alloc]initWithLocaleIdentifier:@"ru_RU"]];
    
    MKPointAnnotation *startPin = [[MKPointAnnotation alloc] init];
    startPin.coordinate = scheduleItem.startCoordinate;
    startPin.subtitle = scheduleItem.startLocation;
    startPin.title = @"Start";
    
    MKPointAnnotation *destinationPin = [[MKPointAnnotation alloc] init];
    destinationPin.coordinate = scheduleItem.destinationCoordinate;
    destinationPin.subtitle = scheduleItem.destination;
    destinationPin.title = @"Finish";
    
    [self.mapView addAnnotation:startPin];
    [self.mapView addAnnotation:destinationPin];
    
    self.mapView.showsUserLocation = YES;
    
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake((startPin.coordinate.latitude + destinationPin.coordinate.latitude)/2, (startPin.coordinate.longitude + destinationPin.coordinate.longitude)/2.0), MKCoordinateSpanMake(fabs(startPin.coordinate.latitude - destinationPin.coordinate.latitude)*2, fabs(startPin.coordinate.longitude - destinationPin.coordinate.longitude)*2))];

    
}


@end
