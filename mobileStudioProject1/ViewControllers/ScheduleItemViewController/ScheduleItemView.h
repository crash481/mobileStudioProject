#import <UIKit/UIKit.h>
#import "ScheduleItem.h"
#import <MapKit/MapKit.h>

@interface ScheduleItemView : UIView

@property MKMapView *mapView;
@property(readonly) UIButton *joinButton;
@property(readonly) UIButton *membersButton;
-(void) configureData: (ScheduleItem*)scheduleItem ;

@end
