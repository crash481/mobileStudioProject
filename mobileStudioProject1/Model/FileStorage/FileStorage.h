#import <Foundation/Foundation.h>
#import "Race.h"
@interface FileStorage : NSObject

+(void)saveObject:(id<NSCoding>)object toFile:(NSString*)filename;
+(id<NSCoding>)loadObjectFromFile: (NSString*)filename;
@end
