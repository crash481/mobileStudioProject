#import <UIKit/UIKit.h>
#import "Race.h"
#import "ScheduleView.h"
#import <MapKit/MapKit.h>
#import "CreateRace2StepViewController.h"

@interface ScheduleViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate,CreateRace2StepDelegate>


-(instancetype)initWithSchedules: (NSArray*)schedules;

@end

