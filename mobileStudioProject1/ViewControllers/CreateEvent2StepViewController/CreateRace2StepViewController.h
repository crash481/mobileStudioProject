#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Race.h"

@protocol CreateRace2StepDelegate <NSObject>

- (void)didCreateSheduleItem: (Race*)race;

@end

@interface CreateRace2StepViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak) id<CreateRace2StepDelegate> delegate;

- (instancetype)initWithEventTitle: (NSString*)eventTitle transportTypes: (NSArray<NSNumber*>*)transportTypes andEventDate: (NSDate*)eventDate;

@end


