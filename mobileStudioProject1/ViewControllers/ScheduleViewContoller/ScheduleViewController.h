#import <UIKit/UIKit.h>
#import "ScheduleItem.h"
#import "ScheduleView.h"
#import <MapKit/MapKit.h>

@interface ScheduleViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate>


-(instancetype)initWithSchedules: (NSArray*)schedules;

@end

