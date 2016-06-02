#import "FileStorage.h"

@implementation FileStorage

+(void)saveObject:(id<NSCoding>)object toFile:(NSString*)filename{
    NSString* documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    [NSKeyedArchiver  archiveRootObject:object toFile: [documentsDirectoryPath stringByAppendingPathComponent:filename] ];
}

+(id<NSCoding>)loadObjectFromFile: (NSString*)filename{
    
    NSString* documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
   return [NSKeyedUnarchiver unarchiveObjectWithFile:[documentsDirectoryPath stringByAppendingPathComponent:filename]];
}

@end
