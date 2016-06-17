#import "User.h"


@implementation User

-(instancetype)initWithNickname: (NSString*)nickname realName: (NSString*)realName andSkillsDictionaty: (NSMutableDictionary<NSNumber*,NSNumber*>*)skillsDictionary{
    if(self = [super init]){
        self.nickname = nickname;
        self.realName = realName;
        self.skillsDictionary = skillsDictionary;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super init]){
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.realName = [aDecoder decodeObjectForKey:@"realName"];
        self.skillsDictionary = [aDecoder decodeObjectForKey:@"skillsDictionary"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.realName forKey:@"realName"];
    [aCoder encodeObject:self.skillsDictionary forKey:@"skillsDictionary"];
}

@end
