#import "ScheduleView.h"
#import "UIView+Facade.h"

@interface ScheduleView ()

@property (readwrite) UITableView* tableView;
@property (readwrite) UILabel *noRacesLabel;
@end


@implementation ScheduleView

- (instancetype) initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        [self setBackgroundColor: [UIColor redColor]];
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]]];
        
        self.tableView = [[UITableView alloc] init];
        self.noRacesLabel = [[UILabel alloc] init];
        
        [self.noRacesLabel setText:@"Заездов нет"];
        [self.noRacesLabel setFont:[UIFont systemFontOfSize:20]];
        [self.noRacesLabel setTextAlignment:NSTextAlignmentCenter];
        self.noRacesLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.85];
        self.noRacesLabel.layer.cornerRadius = 6;
        self.noRacesLabel.clipsToBounds = YES;
        [self.noRacesLabel setHidden:YES];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:self.noRacesLabel];
        [self addSubview:self.tableView];
    }
    
    self.tableView.backgroundColor = [UIColor clearColor];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.tableView  anchorInCenterFillingWidthAndHeightWithLeftAndRightPadding:8 topAndBottomPadding:0];
    [self.noRacesLabel anchorInCenterWithWidth:self.width-16  height:60];
}

@end
