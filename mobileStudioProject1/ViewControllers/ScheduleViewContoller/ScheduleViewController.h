#import <UIKit/UIKit.h>
#import "ScheduleItem.h"
#import "ScheduleView.h"
#import <MapKit/MapKit.h>
#import "CreateEvent2StepViewController.h"

@interface ScheduleViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate,CreateEvent2StepDelegate>


-(instancetype)initWithSchedules: (NSArray*)schedules;

@end

