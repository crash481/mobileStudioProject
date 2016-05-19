#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CreateEvent2StepView : UIView<UITextFieldDelegate>

@property MKMapView *mapView;
@property UITextField *startPlaceTextField;
@property UITextField *destinationPlaceTextField;
@property (readonly)UIButton *createButton;
@end
