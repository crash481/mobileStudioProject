#import "CreateRace2StepViewController.h"
#import "CreateRace2StepView.h"
#import "Race.h"

@interface CreateRace2StepViewController ()

@property CreateRace2StepView *createRace2StepView;
@property NSString *eventTitle;
@property NSDate *eventDate;
@property NSArray<NSNumber*> *transportTypes;
@property NSString *startLocation;
@property NSString *destination;
@property CLLocationCoordinate2D startCoordinate;
@property CLLocationCoordinate2D destinationCoordinate;


@property NSUInteger numberOfSetUserLocationOnMap;

@end

@implementation CreateRace2StepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.createRace2StepView.mapView  setDelegate:self];
    [self.createRace2StepView.createButton addTarget:self action:@selector(createButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    
    UITapGestureRecognizer* mapViewTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapViewTapped:)];
    mapViewTapRecognizer.numberOfTapsRequired = 1;
    mapViewTapRecognizer.numberOfTouchesRequired = 1;
    [mapViewTapRecognizer requireGestureRecognizerToFail:doubleTap];
    
    [self.createRace2StepView.mapView addGestureRecognizer:mapViewTapRecognizer];
    self.numberOfSetUserLocationOnMap = 1;
}

- (void)loadView{
    [super loadView];
    
    self.createRace2StepView = [[CreateRace2StepView alloc] init];
    self.view = self.createRace2StepView;
}

- (instancetype)initWithEventTitle: (NSString*)eventTitle transportTypes: (NSArray<NSNumber*>*)transportTypes andEventDate: (NSDate*)eventDate{
    
    if(self = [super init]){
        self.eventTitle = eventTitle;
        self.transportTypes = transportTypes;
        self.eventDate = eventDate;
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    if(self.numberOfSetUserLocationOnMap>0){
        [self.createRace2StepView.mapView setRegion:MKCoordinateRegionMake(self.createRace2StepView.mapView.userLocation.coordinate, MKCoordinateSpanMake(0.03, 0.03))];
    }
    self.numberOfSetUserLocationOnMap = 0;
    
}

- (void)createButtonTapped: (id)sender{
    
    if(![self.createRace2StepView.startPlaceTextField hasText] || ![self.createRace2StepView.destinationPlaceTextField hasText]){
        return;
    }
    self.startLocation = [[self.createRace2StepView startPlaceTextField] text];
    self.destination = [[self.createRace2StepView destinationPlaceTextField] text];
    Race *newSheduleItem = [[Race alloc] initWithTitle:self.eventTitle transportType:self.transportTypes startDate:self.eventDate location:self.startLocation destination:self.destination startCoordinate:self.startCoordinate andDestinationCoordinate:self.destinationCoordinate];
    
    [self.delegate didCreateSheduleItem:newSheduleItem];
    [self.navigationController popToViewController:(UIViewController*)self.delegate animated:YES];
    
}

- (void)mapViewTapped: (UIGestureRecognizer *)gestureRecognizer{
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CGPoint touchPoint = [gestureRecognizer locationInView:self.createRace2StepView.mapView];
        CLLocationCoordinate2D tapLocation = [self.createRace2StepView.mapView convertPoint:touchPoint toCoordinateFromView:self.createRace2StepView.mapView];
        
        [geocoder reverseGeocodeLocation: [[CLLocation alloc] initWithLatitude:tapLocation.latitude longitude:tapLocation.longitude]  completionHandler:
         ^(NSArray<CLPlacemark*> *_Nullable placemarks, NSError *_Nullable error){
                  if(self.createRace2StepView.destinationPlaceTextField.isEditing){
                      [self.createRace2StepView.destinationPlaceTextField setText:[placemarks[0] name]];
                      self.destinationCoordinate = tapLocation;
                      
                      MKPointAnnotation *destinationPin = [[MKPointAnnotation alloc] init];
                      destinationPin.coordinate = self.destinationCoordinate;
                      destinationPin.title = [placemarks[0] name];
                      destinationPin.title = @"Finish";
                      
                      for (MKPointAnnotation *annotation in [self.createRace2StepView.mapView annotations]) {
                          if([annotation.title isEqualToString:@"Finish"]){
                              [self.createRace2StepView.mapView removeAnnotation:annotation];
                          }
                      }
                      [self.createRace2StepView.mapView addAnnotation:destinationPin];
                  }
                  else{
                      [self.createRace2StepView.startPlaceTextField setText:[placemarks[0] name]];
                      [self.createRace2StepView.destinationPlaceTextField becomeFirstResponder];
                      self.startCoordinate = tapLocation;
                      
                      MKPointAnnotation *startPin = [[MKPointAnnotation alloc] init];
                      startPin.coordinate = self.startCoordinate;
                      startPin.title = @"Start";

                      for (MKPointAnnotation *annotation in [self.createRace2StepView.mapView annotations]) {
                          if([annotation.title isEqualToString:@"Start"]){
                              [self.createRace2StepView.mapView removeAnnotation:annotation];
                          }
                      }
                      [self.createRace2StepView.mapView addAnnotation:startPin];
                  }
         }];
    }
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *startAnnotationIdentifier = @"Start";
    static NSString *destinationAnnotationIdentifier = @"Finish";
    
    if([annotation.title isEqualToString:@"Start"]){
        MKAnnotationView* startAnnotationView = [self.createRace2StepView.mapView dequeueReusableAnnotationViewWithIdentifier:startAnnotationIdentifier];
        if(!startAnnotationView){
            startAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:startAnnotationIdentifier];
            startAnnotationView.image = [UIImage imageNamed:@"StartPin"];
            startAnnotationView.centerOffset = CGPointMake(0, -[UIImage imageNamed:@"StartPin"].size.height/2);
        }
        return startAnnotationView;
    }
    else if([annotation.title isEqualToString:@"Finish"]){
        MKAnnotationView* destinationAnnotationView = [self.createRace2StepView.mapView dequeueReusableAnnotationViewWithIdentifier:destinationAnnotationIdentifier];
        if(!destinationAnnotationView){
            destinationAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:destinationAnnotationIdentifier];
            [destinationAnnotationView setContentMode:UIViewContentModeTop];
            destinationAnnotationView.image = [UIImage imageNamed:@"FinishPin"];
            destinationAnnotationView.centerOffset = CGPointMake(25, -40);
        }
        return destinationAnnotationView;
    }
    return nil;
}
@end
