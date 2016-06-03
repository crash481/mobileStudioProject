#import "RacePointAnnotation.h"

@implementation RacePointAnnotation


-(instancetype) initWithType: (NSUInteger)type coordinate: (CLLocationCoordinate2D)coordinate andSubtitle: (NSString*)subtitle{

    if(self = [super init]){
        
        self.annotationType = type;
        self.coordinate = coordinate;
        self.subtitle = subtitle;
        if(type == RaceAnnotationTypeStart){
            self.title = @"Start";
        }
        else if(type == RaceAnnotationTypeFinish){
            self.title = @"Finish";
        }
    }
    return self;
}

@end
