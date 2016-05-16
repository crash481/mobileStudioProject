#import <Foundation/Foundation.h>

@interface Member : NSObject

@property NSString *nickname;
@property NSUInteger age;

-(instancetype)initWithNickname: (NSString*)nickname andAge: (NSUInteger)age;

@end
