#import "Member.h"


@implementation Member

-(instancetype)initWithNickname: (NSString*)nickname andAge: (NSUInteger)age{
    
    if(self = [super init]){
        self.nickname = nickname;
        self.age = age;
    }
    return self;
}

@end
