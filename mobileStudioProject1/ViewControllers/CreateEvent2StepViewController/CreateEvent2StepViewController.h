#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ScheduleItem.h"

@protocol CreateEvent2StepDelegate <NSObject>

- (void)didCreateSheduleItem: (ScheduleItem*)scheduleItem;

@end

@interface CreateEvent2StepViewController : UIViewController<MKMapViewDelegate>

@property (weak) id<CreateEvent2StepDelegate> delegate;

- (instancetype)initWithEventTitle: (NSString*)eventTitle andEventDate: (NSDate*)eventDate;

@end


