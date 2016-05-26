#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Race.h"

@protocol CreateRace2StepDelegate <NSObject>

- (void)didCreateSheduleItem: (Race*)scheduleItem;

@end

@interface CreateRace2StepViewController : UIViewController<MKMapViewDelegate>

@property (weak) id<CreateRace2StepDelegate> delegate;

- (instancetype)initWithEventTitle: (NSString*)eventTitle andEventDate: (NSDate*)eventDate;

@end


