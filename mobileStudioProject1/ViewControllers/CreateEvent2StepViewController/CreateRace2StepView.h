#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CreateRace2StepView : UIView<UITextFieldDelegate>

@property MKMapView *mapView;
@property UITextField *startPlaceTextField;
@property UITextField *destinationPlaceTextField;
@property (readonly)UIButton *createButton;
@property (readonly)UIButton *startOnMapButton;
@property (readonly)UIButton *destinationOnMapButton;
@property (readonly)UIButton *confirmMapSelection;

@end
