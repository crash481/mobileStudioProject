#import "EventMembersView.h"
#import "UIView+Facade.h"

@interface EventMembersView ()

@property (readwrite) UITableView* tableView;

@end

@implementation EventMembersView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.tableView = [[UITableView alloc] init];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        self.tableView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.tableView];
    }
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    [self.tableView fillSuperview];
}



@end
