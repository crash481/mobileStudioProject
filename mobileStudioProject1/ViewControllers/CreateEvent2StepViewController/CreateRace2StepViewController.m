#import "CreateRace2StepViewController.h"
#import "CreateRace2StepView.h"
#import "Race.h"

@interface CreateRace2StepViewController ()

@property CreateRace2StepView *createEvent2StepView;
@property NSString *eventTitle;
@property NSDate *eventDate;
@property NSString *startLocation;
@property NSString *destination;
@property CLLocationCoordinate2D startCoordinate;
@property CLLocationCoordinate2D destinationCoordinate;


@property NSUInteger numberOfSetUserLocationOnMap;

@end

@implementation CreateRace2StepViewController

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
    
    self.createEvent2StepView = [[CreateRace2StepView alloc] init];
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
    Race *newSheduleItem = [[Race alloc] initWithTitle:self.eventTitle StartDate:self.eventDate Location:self.startLocation Destination:self.destination StartCoordinate:self.startCoordinate AndDestinationCoordinate:self.destinationCoordinate];
    
    [self.delegate didCreateSheduleItem:newSheduleItem];
    [self.navigationController popToViewController:(UIViewController*)self.delegate animated:YES];
    
}

- (void)mapViewTapped: (UIGestureRecognizer *)gestureRecognizer{
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CGPoint touchPoint = [gestureRecognizer locationInView:self.createEvent2StepView.mapView];
        CLLocationCoordinate2D tapLocation = [self.createEvent2StepView.mapView convertPoint:touchPoint toCoordinateFromView:self.createEvent2StepView.mapView];
        
        [geocoder reverseGeocodeLocation: [[CLLocation alloc] initWithLatitude:tapLocation.latitude longitude:tapLocation.longitude]  completionHandler:
         ^(NSArray<CLPlacemark*> *_Nullable placemarks, NSError *_Nullable error){
                  if(self.createEvent2StepView.destinationPlaceTextField.isEditing){
                      [self.createEvent2StepView.destinationPlaceTextField setText:[placemarks[0] name]];
                      self.destinationCoordinate = tapLocation;
                      
                      MKPointAnnotation *destinationPin = [[MKPointAnnotation alloc] init];
                      destinationPin.coordinate = self.destinationCoordinate;
                      destinationPin.title = [placemarks[0] name];
                      destinationPin.title = @"Finish";
                      
                      for (MKPointAnnotation *annotation in [self.createEvent2StepView.mapView annotations]) {
                          if([annotation.title isEqualToString:@"Finish"]){
                              [self.createEvent2StepView.mapView removeAnnotation:annotation];
                          }
                      }
                      [self.createEvent2StepView.mapView addAnnotation:destinationPin];
                  }
                  else{
                      [self.createEvent2StepView.startPlaceTextField setText:[placemarks[0] name]];
                      [self.createEvent2StepView.destinationPlaceTextField becomeFirstResponder];
                      self.startCoordinate = tapLocation;
                      
                      MKPointAnnotation *startPin = [[MKPointAnnotation alloc] init];
                      startPin.coordinate = self.startCoordinate;
                      startPin.title = @"Start";

                      for (MKPointAnnotation *annotation in [self.createEvent2StepView.mapView annotations]) {
                          if([annotation.title isEqualToString:@"Start"]){
                              [self.createEvent2StepView.mapView removeAnnotation:annotation];
                          }
                      }
                      [self.createEvent2StepView.mapView addAnnotation:startPin];
                  }
         }];
    }
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *startAnnotationIdentifier = @"Start";
    static NSString *destinationAnnotationIdentifier = @"Finish";
    
    if([annotation.title isEqualToString:@"Start"]){
        MKAnnotationView* startAnnotationView = [self.createEvent2StepView.mapView dequeueReusableAnnotationViewWithIdentifier:startAnnotationIdentifier];
        if(!startAnnotationView){
            startAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:startAnnotationIdentifier];
            startAnnotationView.image = [UIImage imageNamed:@"StartPin"];
            startAnnotationView.centerOffset = CGPointMake(0, -[UIImage imageNamed:@"StartPin"].size.height/2);
        }
        return startAnnotationView;
    }
    else if([annotation.title isEqualToString:@"Finish"]){
        MKAnnotationView* destinationAnnotationView = [self.createEvent2StepView.mapView dequeueReusableAnnotationViewWithIdentifier:destinationAnnotationIdentifier];
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
