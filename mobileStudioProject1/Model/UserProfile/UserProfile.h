#import <Foundation/Foundation.h>
#import "User.h"
@interface UserProfile : NSObject

@property (nonatomic)User* user;
+ (instancetype)sharedProfile;
- (void)saveUserProfile;
- (User*) user;
@end
