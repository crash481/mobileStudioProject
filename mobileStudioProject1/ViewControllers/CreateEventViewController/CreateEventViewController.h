#import <UIKit/UIKit.h>
#import "CreateEvent2StepViewController.h"

@interface CreateEventViewController : UIViewController

@property (readonly)NSString *eventTitle;
@property (readonly)NSDate *eventDate;
@property (weak)id<CreateEvent2StepDelegate> delegate;
    
@end
