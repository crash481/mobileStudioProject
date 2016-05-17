#import <UIKit/UIKit.h>
#import "ScheduleItemView.h"

@interface ScheduleItemViewController : UIViewController <MKMapViewDelegate>

@property (readonly) ScheduleItem* scheduleItem;


-(instancetype) initWithScheduleItem: (ScheduleItem*) scheduleItem;

@end
