#import <UIKit/UIKit.h>
#import "CreateRace2StepViewController.h"

@interface CreateRaceViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (readonly)NSString *eventTitle;
@property (readonly)NSDate *eventDate;
@property (weak)id<CreateRace2StepDelegate> delegate;
    
@end
