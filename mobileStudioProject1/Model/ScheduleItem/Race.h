#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Race : NSObject<NSCoding>

typedef NS_ENUM(NSInteger, TransportType) {
    TransportTypeSkateboard,
    TransportTypeBike
};

@property NSString *raceTitle;
@property NSDate *startDate;
@property NSString *startLocation;
@property NSString *destination;
@property CLLocationCoordinate2D startCoordinate;
@property CLLocationCoordinate2D destinationCoordinate;
@property NSSet<NSNumber*> *transportTypes;


-(instancetype) initWithTitle: (NSString*)title transportType: (NSSet<NSNumber*>*)transportTypes startDate: (NSDate*) startDate location: (NSString*)location destination: (NSString*) destination startCoordinate: (CLLocationCoordinate2D)startCoordinate andDestinationCoordinate: (CLLocationCoordinate2D) destinationCoordinate;
@end
