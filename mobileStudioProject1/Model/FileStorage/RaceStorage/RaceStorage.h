#import <Foundation/Foundation.h>
#import "Race.h"
@interface RaceStorage : NSObject


+(NSMutableArray<Race*> *)skateboardSchedules;
+(void)setSkateboardSchedules: (NSMutableArray<Race*> *)skateboardSchedules;
+(NSMutableArray<Race*> *)bikeSchedules;
+(void)setBikeSchedules: (NSMutableArray<Race*> *)bikeSchedules;

+(void)addRace:(Race*)race;
+(void)removeRace:(Race*)race;
+(void)loadRaces;
+(void)saveRaces;
@end
