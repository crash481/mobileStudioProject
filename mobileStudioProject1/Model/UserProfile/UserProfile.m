#import "UserProfile.h"
#import "FileStorage.h"
@interface UserProfile()

@end

@implementation UserProfile

User* _user;

+ (instancetype)sharedProfile{
    static UserProfile *sharedProfile = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedProfile = [[UserProfile alloc] init];
            // Do any other initialisation stuff here
    });
    return sharedProfile;
}

-(void)saveUserProfile{
    [FileStorage saveObject:self.user toFile:@"UserProfile"];
}

-(User *)user{
    if(!_user){
        _user = (User*)[FileStorage loadObjectFromFile:@"UserProfile"];
        if(!_user){
            _user = [[User alloc] initWithNickname:@"TestNickname" realName:@"TestRealName" andSkillsDictionaty:(NSMutableDictionary<NSNumber*,NSNumber*>*)[[NSMutableDictionary alloc] init]];
        }
    }
    return _user;
}
@end
