#import "ScheduleView.h"
#import "UIView+Facade.h"

@interface ScheduleView ()

@property (readwrite) UITableView* tableView;
@end


@implementation ScheduleView

- (instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        [self setBackgroundColor: [UIColor redColor]];
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
        self.tableView = [[UITableView alloc] init];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.tableView];
    }
    
    self.tableView.backgroundColor = [UIColor clearColor];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.tableView  anchorInCenterFillingWidthAndHeightWithLeftAndRightPadding:8 topAndBottomPadding:0];
}

@end
