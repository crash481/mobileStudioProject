#import "AccountViewController.h"
#import "AccountView.h"
@interface AccountViewController ()

@property AccountView *accountView;
@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"someAccountName";
}

-(void)loadView{
    [super loadView];
    self.accountView = [[AccountView alloc] init];
    self.view = self.accountView;
}


@end
