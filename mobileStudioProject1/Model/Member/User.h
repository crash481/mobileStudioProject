#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>


typedef NS_ENUM(NSInteger, SkillLevel) {
    SkillLevelNewbie,
    SkillLevelAdept,
    SkillLevelAdvanced,
    SkillLevelMaster
};

@property NSString *nickname;
@property NSString* realName;
@property NSMutableDictionary<NSNumber*,NSNumber*> *skillsDictionary;

-(instancetype)initWithNickname: (NSString*)nickname realName: (NSString*)realName andSkillsDictionaty: (NSMutableDictionary<NSNumber*,NSNumber*>*)skillsDictionary;
@end
