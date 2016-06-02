#import "RaceStorage.h"
#import "FileStorage.h"

@implementation RaceStorage

static NSMutableArray<Race*> *skateboardSchedules;
static NSMutableArray<Race*> *bikeSchedules;

+(NSMutableArray<Race*> *)skateboardSchedules{
    return skateboardSchedules;
}

+(void)setSkateboardSchedules: (NSMutableArray<Race*> *)skateboardSchedulesToAdd{
    skateboardSchedules = skateboardSchedulesToAdd;
}

+(NSMutableArray<Race*> *)bikeSchedules{
    return bikeSchedules;
}

+(void)setBikeSchedules: (NSMutableArray<Race*> *)bikeSchedulesToAdd{
    bikeSchedules = bikeSchedulesToAdd;
}

+(void)addRace:(Race*)race{
    for (NSNumber* type in race.transportTypes) {
        
        if([type isEqualToNumber:[NSNumber numberWithInteger:0]]){
           
            [self.skateboardSchedules addObject:race];
        }
        else if ([type isEqualToNumber:[NSNumber numberWithInteger:1]]){
            [self.bikeSchedules addObject:race];
        }
    }
}

+(void)saveRaces:(NSMutableArray<Race*>*)races{
    
    NSMutableArray<Race*> *skateboardRaces = [[NSMutableArray alloc] init];
    NSMutableArray<Race*> *bikeRaces = [[NSMutableArray alloc] init];
    
    for (Race *race in races) {
        if([race.transportTypes containsObject:@0]){
            [skateboardRaces addObject:race];
        }
        if([race.transportTypes containsObject:@1]){
            [bikeRaces addObject:race];
        }
    }
    
    [FileStorage saveObject:self.skateboardSchedules toFile:@"SkateboardRacesList"];
    [FileStorage saveObject:self.bikeSchedules toFile:@"BikeRacesList"];
}

+(void)loadRaces{
    
    self.skateboardSchedules = (NSMutableArray<Race*>*)[FileStorage loadObjectFromFile:@"SkateboardRacesList"];
    self.bikeSchedules = (NSMutableArray<Race*>*)[FileStorage loadObjectFromFile:@"BikeRacesList"];
}

@end
