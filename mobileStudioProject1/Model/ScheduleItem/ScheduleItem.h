#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ScheduleItem : NSObject

@property NSString *scheduleItemTitle;
@property NSDate *startDate;
@property NSString *startLocation;
@property NSString *destination;
@property CLLocationCoordinate2D startCoordinate;
@property CLLocationCoordinate2D destinationCoordinate;


-(instancetype) initWithTitle: (NSString*)title StartDate: (NSDate*) startDate Location: (NSString*)location Destination: (NSString*) destination StartCoordinate: (CLLocationCoordinate2D)startCoordinate AndDestinationCoordinate: (CLLocationCoordinate2D) destinationCoordinate;
@end
