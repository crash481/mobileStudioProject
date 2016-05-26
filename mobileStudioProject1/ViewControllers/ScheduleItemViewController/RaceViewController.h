#import <UIKit/UIKit.h>
#import "RaceView.h"

@interface RaceViewController : UIViewController <MKMapViewDelegate>

@property (readonly) Race* scheduleItem;


-(instancetype) initWithRace: (Race*) scheduleItem;

@end
