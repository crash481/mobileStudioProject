#import "Race.h"

@implementation Race


-(instancetype) initWithTitle: (NSString*)title transportType: (NSArray<NSNumber*>*)transportTypes startDate: (NSDate*) startDate location: (NSString*)location destination: (NSString*) destination startCoordinate: (CLLocationCoordinate2D)startCoordinate andDestinationCoordinate: (CLLocationCoordinate2D) destinationCoordinate{
    
    if(self = [super init]){
        self.raceTitle = title;
        self.transportTypes = transportTypes;
        self.startDate = startDate;
        self.startLocation = location;
        self.destination = destination;
        self.startCoordinate = startCoordinate;
        self.destinationCoordinate = destinationCoordinate;
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super init]){
        self.raceTitle = [aDecoder decodeObjectForKey:@"raceTitle"];
        self.transportTypes = [aDecoder decodeObjectForKey:@"transportTypes"];
        self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
        self.startLocation = [aDecoder decodeObjectForKey:@"startLocation"];
        self.destination = [aDecoder decodeObjectForKey:@"destination"];
        self.startCoordinate = CLLocationCoordinate2DMake([aDecoder decodeDoubleForKey:@"startCoordinateLatitude"], [aDecoder decodeDoubleForKey:@"startCoordinateLongitude"]);
        self.destinationCoordinate = CLLocationCoordinate2DMake([aDecoder decodeDoubleForKey:@"destinationCoordinateLatitude"], [aDecoder decodeDoubleForKey:@"destinationCoordinateLongitude"]);
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.raceTitle forKey:@"raceTitle"];
    [aCoder encodeObject:self.transportTypes forKey:@"transportTypes"];
    [aCoder encodeObject:self.startDate forKey:@"startDate"];
    [aCoder encodeObject:self.startLocation forKey:@"startLocation"];
    [aCoder encodeObject:self.destination forKey:@"destination"];
    [aCoder encodeDouble:self.startCoordinate.latitude forKey:@"startCoordinateLatitude"];
    [aCoder encodeDouble:self.startCoordinate.longitude forKey:@"startCoordinateLongitude"];
    [aCoder encodeDouble:self.destinationCoordinate.latitude forKey:@"destinationCoordinateLatitude"];
    [aCoder encodeDouble:self.destinationCoordinate.longitude forKey:@"destinationCoordinateLongitude"];
    
}


@end
