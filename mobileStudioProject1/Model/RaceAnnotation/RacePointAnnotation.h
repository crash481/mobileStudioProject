#import <MapKit/MapKit.h>

typedef NS_ENUM(NSInteger, RaceAnnotationType) {
    RaceAnnotationTypeStart,
    RaceAnnotationTypeFinish
};

@interface RacePointAnnotation : MKPointAnnotation

@property NSUInteger annotationType;

-(instancetype) initWithType: (NSUInteger)type coordinate: (CLLocationCoordinate2D)coordinate andSubtitle: (NSString*)subtitle;

@end
