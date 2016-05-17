#import "CreateEventViewController.h"
#import "CreateEventView.h"
@interface CreateEventViewController ()

@property CreateEventView *createEventView;
@end

@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)loadView{
    
    self.createEventView = [[CreateEventView alloc] init];
    self.view = self.createEventView;
}


@end
