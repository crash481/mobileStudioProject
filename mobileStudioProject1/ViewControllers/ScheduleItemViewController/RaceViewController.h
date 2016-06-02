#import <UIKit/UIKit.h>
#import "RaceView.h"

@interface RaceViewController : UIViewController <MKMapViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (readonly) Race* race;


-(instancetype) initWithRace: (Race*) race;

@end
