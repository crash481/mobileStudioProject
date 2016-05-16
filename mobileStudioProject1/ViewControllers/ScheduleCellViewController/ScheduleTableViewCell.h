#import <UIKit/UIKit.h>
#import "ScheduleItem.h"

@interface ScheduleTableViewCell : UITableViewCell

- (void)configureData: (ScheduleItem*)scheduleItem;

@end
