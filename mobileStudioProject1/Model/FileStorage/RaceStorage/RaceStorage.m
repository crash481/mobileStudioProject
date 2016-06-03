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

+(void)removeRace:(Race*)race{
    for (NSNumber* type in race.transportTypes) {
        
        if([type isEqualToNumber:[NSNumber numberWithInteger:0]]){
            
            [self.skateboardSchedules removeObject:race];
        }
        else if ([type isEqualToNumber:[NSNumber numberWithInteger:1]]){
            [self.bikeSchedules removeObject:race];
        }
    }
}

+(void)saveRaces{
    NSMutableSet<Race*> *racesList = [[NSMutableSet alloc] init];
    racesList = (NSMutableSet<Race*>*)[racesList setByAddingObjectsFromArray: skateboardSchedules];
    racesList = (NSMutableSet<Race*>*)[racesList setByAddingObjectsFromArray: bikeSchedules];
    [FileStorage saveObject:racesList toFile:@"RacesList"];
}

+(void)loadRaces{
    NSMutableArray<Race*> *racesList = [[NSMutableArray alloc] init];
    racesList =  (NSMutableArray<Race*>*)[racesList arrayByAddingObjectsFromArray:[(NSSet<Race*>*)[FileStorage loadObjectFromFile:@"RacesList"] allObjects]];
    
    self.skateboardSchedules = (NSMutableArray<Race*>*)[[NSMutableArray alloc] init];
    self.bikeSchedules = [(NSMutableArray<Race*>*)[NSMutableArray alloc] init];
    
    for (Race* race in racesList) {
        if( [race.transportTypes containsObject:[NSNumber numberWithInteger:TransportTypeSkateboard] ] ){
            [self.skateboardSchedules addObject:race];
        }
        if ( [race.transportTypes containsObject:[NSNumber numberWithInteger:TransportTypeBike] ] ){
            [self.bikeSchedules addObject:race];
        }
    }
    
}

@end
