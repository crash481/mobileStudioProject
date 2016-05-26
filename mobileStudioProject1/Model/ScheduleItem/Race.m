#import "Race.h"

@implementation Race

-(instancetype) initWithTitle: (NSString*)title StartDate: (NSDate*) startDate Location: (NSString*)location Destination: (NSString*) destination StartCoordinate: (CLLocationCoordinate2D)startCoordinate AndDestinationCoordinate: (CLLocationCoordinate2D) destinationCoordinate{
    
    if(self = [super init]){
        self.scheduleItemTitle = title;
        self.startDate = startDate;
        self.startLocation = location;
        self.destination = destination;
        self.startCoordinate = startCoordinate;
        self.destinationCoordinate = destinationCoordinate;
    }
    return self;
}

@end
