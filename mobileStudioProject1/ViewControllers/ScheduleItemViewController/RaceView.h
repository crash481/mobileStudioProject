#import <UIKit/UIKit.h>
#import "Race.h"
#import <MapKit/MapKit.h>

@interface RaceView : UIView

@property MKMapView *mapView;
@property(readonly) UIButton *joinButton;
@property(readonly) UIButton *membersButton;
-(void) configureData: (Race*)scheduleItem ;

@end
