#import "CreateEvent2StepViewController.h"
#import "CreateEvent2StepView.h"
#import "ScheduleItem.h"

@interface CreateEvent2StepViewController ()

@property CreateEvent2StepView *createEvent2StepView;
@property NSString *eventTitle;
@property NSDate *eventDate;
@property NSString *startLocation;
@property NSString *destination;
@property CLLocationCoordinate2D startCoordinate;
@property CLLocationCoordinate2D destinationCoordinate;


@property NSUInteger numberOfSetUserLocationOnMap;

@end

@implementation CreateEvent2StepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.createEvent2StepView.mapView  setDelegate:self];
    [self.createEvent2StepView.createButton addTarget:self action:@selector(createButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    
    UITapGestureRecognizer* mapViewTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapViewTapped:)];
    mapViewTapRecognizer.numberOfTapsRequired = 1;
    mapViewTapRecognizer.numberOfTouchesRequired = 1;
    [mapViewTapRecognizer requireGestureRecognizerToFail:doubleTap];
    
    [self.createEvent2StepView.mapView addGestureRecognizer:mapViewTapRecognizer];
    self.numberOfSetUserLocationOnMap = 1;
}

- (void)loadView{
    [super loadView];
    
    self.createEvent2StepView = [[CreateEvent2StepView alloc] init];
    self.view = self.createEvent2StepView;
}

- (instancetype)initWithEventTitle: (NSString*)eventTitle andEventDate: (NSDate*)eventDate{
    
    if(self = [super init]){
        self.eventTitle = eventTitle;
        self.eventDate = eventDate;
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    if(self.numberOfSetUserLocationOnMap>0){
        [self.createEvent2StepView.mapView setRegion:MKCoordinateRegionMake(self.createEvent2StepView.mapView.userLocation.coordinate, MKCoordinateSpanMake(0.01, 0.01))];
    }
    self.numberOfSetUserLocationOnMap = 0;
    
}

- (void)createButtonTapped: (id)sender{
    
    if(![self.createEvent2StepView.startPlaceTextField hasText] || ![self.createEvent2StepView.destinationPlaceTextField hasText]){
        return;
    }
    self.startLocation = [[self.createEvent2StepView startPlaceTextField] text];
    self.destination = [[self.createEvent2StepView destinationPlaceTextField] text];
    ScheduleItem *newSheduleItem = [[ScheduleItem alloc] initWithTitle:self.eventTitle StartDate:self.eventDate Location:self.startLocation Destination:self.destination StartCoordinate:self.startCoordinate AndDestinationCoordinate:self.destinationCoordinate];
    
    [self.delegate didCreateSheduleItem:newSheduleItem];
    [self.navigationController popToViewController:self.delegate animated:YES];
    
}

- (void)mapViewTapped: (UIGestureRecognizer *)gestureRecognizer{
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CGPoint touchPoint = [gestureRecognizer locationInView:self.createEvent2StepView.mapView];
        CLLocationCoordinate2D tapLocation = [self.createEvent2StepView.mapView convertPoint:touchPoint toCoordinateFromView:self.createEvent2StepView.mapView];
        
        
        [geocoder reverseGeocodeLocation: [[CLLocation alloc] initWithLatitude:tapLocation.latitude longitude:tapLocation.longitude]  completionHandler:
         ^(NSArray<CLPlacemark*> *_Nullable placemarks, NSError *_Nullable error){
             for(int i = 0; i<[placemarks count]; i++){
                  if(self.createEvent2StepView.destinationPlaceTextField.isEditing){
                      [self.createEvent2StepView.destinationPlaceTextField setText:[placemarks[i] name]];
                  }
                  else{
                      [self.createEvent2StepView.startPlaceTextField setText:[placemarks[i] name]];
                      [self.createEvent2StepView.destinationPlaceTextField becomeFirstResponder];
                  }
             }
         }];
    }
}

@end
