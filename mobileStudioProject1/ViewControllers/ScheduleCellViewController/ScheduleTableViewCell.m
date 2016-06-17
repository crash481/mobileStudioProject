#import "ScheduleTableViewCell.h"
#import "UIView+Facade.h"
#import "NSDate+DateTools.h"
#import "Chameleon.h"

@interface ScheduleTableViewCell ()

@property UILabel *titleLabel;
@property UILabel *startDateLabel;
@property UILabel *startLocationLabel;
@property UILabel *destinationLabel;
@property UIImage *transportImage;

@end

@implementation ScheduleTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.titleLabel = [[UILabel alloc] init];
        self.startDateLabel = [[UILabel alloc] init];
        self.startLocationLabel = [[UILabel alloc] init];
        self.destinationLabel = [[UILabel alloc] init];
        
        self.layer.cornerRadius = 6;
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.85];
        [self.titleLabel setFont: [UIFont systemFontOfSize:17] ];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.startDateLabel setFont: [UIFont systemFontOfSize:12] ];
        [self.startLocationLabel setFont: [UIFont systemFontOfSize:14] ];
        [self.startLocationLabel setTextAlignment:NSTextAlignmentLeft];
        [self.destinationLabel setFont: [UIFont systemFontOfSize:14] ];
        [self.destinationLabel setTextAlignment:NSTextAlignmentRight];
        
//        self.titleLabel.textColor = [UIColor whiteColor];
//        self.startDateLabel.textColor = [UIColor whiteColor];
//        self.startLocationLabel.textColor = [UIColor whiteColor];
//        self.destinationLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.startDateLabel];
        [self.contentView addSubview:self.startLocationLabel];
        [self.contentView addSubview:self.destinationLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
//    CGRect rect = self.frame;
//    rect.origin.x = 6;
//    rect.size.width = [[UIScreen mainScreen] bounds].size.width -12;
//    self.frame = rect;
    
    [self.titleLabel sizeToFit];
    [self.titleLabel anchorTopCenterWithTopPadding:19 width:self.frame.size.width*0.9 height:self.titleLabel.height];
    
    [self.startDateLabel sizeToFit];
    [self.startDateLabel anchorTopLeftWithLeftPadding:10 topPadding:4 width:self.frame.size.width*0.9 height:self.startDateLabel.height];
    
    [self.startLocationLabel sizeToFit];
    [self.startLocationLabel anchorTopLeftWithLeftPadding:15 topPadding:41 width:self.frame.size.width*0.40 height:self.startLocationLabel.height];
    
    [self.destinationLabel sizeToFit];
    [self.destinationLabel anchorTopRightWithRightPadding:15 topPadding:41 width:self.frame.size.width*0.40 height:self.destinationLabel.height];
    
    
}

- (void)configureData: (Race*)race {
    
    self.titleLabel.text = race.raceTitle;
    self.startDateLabel.text = [race.startDate formattedDateWithFormat:@"dd MMMM YYYY в HH:mm" locale:[[NSLocale alloc]initWithLocaleIdentifier:@"ru_RU"]];
    self.startLocationLabel.text = race.startLocation;
    self.destinationLabel.text = race.destination;
    
}

@end
