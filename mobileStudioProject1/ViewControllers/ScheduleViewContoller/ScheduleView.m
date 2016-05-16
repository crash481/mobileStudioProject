#import "ScheduleView.h"
#import "UIView+Facade.h"

@interface ScheduleView ()

@property (readwrite) UITableView* tableView;
@end


@implementation ScheduleView

- (instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.tableView = [[UITableView alloc] init];
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.tableView  fillSuperview];
}

@end
