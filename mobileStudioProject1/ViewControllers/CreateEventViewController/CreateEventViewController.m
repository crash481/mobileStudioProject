#import "CreateEventViewController.h"
#import "CreateEventView.h"
#import "CreateEvent2StepViewController.h"

@interface CreateEventViewController ()

@property CreateEventView *createEventView;

@property NSString *eventTitle;
@property NSDate *eventDate;

@end

@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Создание мероприятия"];
    [self.createEventView.nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loadView{
    
    self.createEventView = [[CreateEventView alloc] init];
    self.view = self.createEventView;
}

- (void)nextButtonClicked: (id)sender{
    
    if([self.createEventView.titleTextField  hasText]){
        self.eventTitle = self.createEventView.titleTextField.text;
        self.eventDate = self.createEventView.datePicker.date;
        
        CreateEvent2StepViewController *createEventStep2ViewController = [[CreateEvent2StepViewController alloc] initWithEventTitle:self.eventTitle andEventDate:self.eventDate];
        createEventStep2ViewController.delegate = self.delegate;
        [self.navigationController pushViewController:createEventStep2ViewController animated:YES];
    }
    else{
        [self.createEventView.errorLabel setHidden:NO];
        [self.createEventView.titleTextField.layer setBorderColor:[[UIColor redColor] CGColor] ];
        [self.createEventView.titleTextField.layer setBorderWidth: 1];
        [self.createEventView.titleTextField.layer setCornerRadius: 6];
        [self triggerShakeAnimationToView: self.createEventView.titleTextField];
    }
}

- (void)triggerShakeAnimationToView: (UIView*)viewToShake {
    const int MAX_SHAKES = 6;
    const CGFloat SHAKE_DURATION = 0.05;
    const CGFloat SHAKE_TRANSFORM = 4;
    
    CGFloat direction = 1;
    
    for (int i = 0; i <= MAX_SHAKES; i++) {
        [UIView animateWithDuration:SHAKE_DURATION
                              delay:SHAKE_DURATION * i
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             if (i >= MAX_SHAKES) {
                                 viewToShake.transform = CGAffineTransformIdentity;
                             } else {
                                 viewToShake.transform = CGAffineTransformMakeTranslation(SHAKE_TRANSFORM * direction, 0);
                             }
                         } completion:nil];
        
        direction *= -1;
    }
}


@end
