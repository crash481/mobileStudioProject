#import "RaceView.h"
#import "UIView+Facade.h"
#import "NSDate+DateTools.h"
#import "RacePointAnnotation.h"

@interface RaceView()

@property UILabel *startDateLabel;
@property UILabel *startLocationLabel;
@property UILabel *destinationLabel;
@property(readwrite) UIButton *joinButton;
@property(readwrite) UIButton *membersButton;
@property UILabel *transportTypeLabel;
@property UITableView *transportTypeTableView;

@property UILabel *startDateText;
@property UILabel *startLocationText;
@property UILabel *destinationText;
@property UILabel *durationText;

@end


@implementation RaceView

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
        self.transportTypeLabel = [[UILabel alloc] init];
        self.transportTypeTableView = [[UITableView alloc] init];
        
        [self.transportTypeLabel setText:@"Транспорт для участия:"];
        [self.transportTypeLabel setFont:[UIFont systemFontOfSize:15]];
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
        [self addSubview:self.transportTypeLabel];
        [self addSubview:self.transportTypeTableView];

        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.startLocationText anchorTopLeftWithLeftPadding:10 topPadding:8 width:130 height:20];
    [self.destinationText alignUnder:self.startLocationText withLeftPadding:10 topPadding:3 width:130 height:20];
    [self.startDateText alignUnder:self.destinationText withLeftPadding:10 topPadding:3 width:130 height:20];
    
    [self.startLocationLabel anchorTopLeftWithLeftPadding:145 topPadding:8 width:200 height:20];
    [self.destinationLabel alignUnder:self.startLocationLabel withLeftPadding:145 topPadding:3 width:200 height:20];
    [self.startDateLabel alignUnder:self.destinationLabel withLeftPadding:145 topPadding:3 width:200 height:20];
    
    [self.transportTypeLabel anchorTopCenterWithTopPadding:80 width:self.width*0.6 height:16];
    [self.transportTypeTableView alignUnder:self.transportTypeLabel matchingCenterWithTopPadding:3 width:self.width*0.6 height:self.height*0.2];
    
    [self.joinButton alignUnder:self.transportTypeTableView withLeftPadding:10 topPadding:3 width:self.frame.size.width*0.45 height:35];
    [self.membersButton alignUnder:self.transportTypeTableView withRightPadding:10 topPadding:3 width:self.frame.size.width*0.45 height:35];
    
    [self.mapView alignUnder:self.joinButton centeredFillingWidthAndHeightWithLeftAndRightPadding:0 topAndBottomPadding:0];
    self.mapView.frame = CGRectMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y+5, self.mapView.frame.size.width, self.mapView.frame.size.height);

}
-(void) configureData: (Race*)race{
    
    self.startLocationLabel.text = race.startLocation;
    self.destinationLabel.text = race.destination;
    self.startDateLabel.text = [race.startDate formattedDateWithFormat:@"dd MMMM YYYY в HH:mm" locale:[[NSLocale alloc]initWithLocaleIdentifier:@"ru_RU"]];
    
    RacePointAnnotation *startPin = [[RacePointAnnotation alloc] initWithType: RaceAnnotationTypeStart coordinate: race.startCoordinate andSubtitle: race.startLocation];
    RacePointAnnotation *destinationPin = [[RacePointAnnotation alloc] initWithType: RaceAnnotationTypeFinish coordinate: race.destinationCoordinate andSubtitle: race.destination];
    [self.mapView addAnnotation:startPin];
    [self.mapView addAnnotation:destinationPin];
    
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake((startPin.coordinate.latitude + destinationPin.coordinate.latitude)/2, (startPin.coordinate.longitude + destinationPin.coordinate.longitude)/2.0), MKCoordinateSpanMake(fabs(startPin.coordinate.latitude - destinationPin.coordinate.latitude)*2, fabs(startPin.coordinate.longitude - destinationPin.coordinate.longitude)*2))];

    
}


@end
