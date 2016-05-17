#import "SchedulesTabBarViewController.h"
#import "ScheduleViewController.h"
#import "NSDate+DateTools.h"

@interface SchedulesTabBarViewController ()

@end

@implementation SchedulesTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    
    NSMutableArray<ScheduleItem*> *skateShedules = [[NSMutableArray alloc] init];
    NSDate *startDate = [NSDate dateWithYear:2016 month:5 day:14 hour:17 minute:00 second:00];
    [skateShedules addObject: [[ScheduleItem alloc] initWithTitle:@"Гонка до Адмиралтейской" StartDate:startDate  Location:@"Петроградская" Destination:@"Адмиралтейская" StartCoordinate:CLLocationCoordinate2DMake(59.93, 30.338) AndDestinationCoordinate:CLLocationCoordinate2DMake(59.943, 30.36) ]];
    [skateShedules addObject: [[ScheduleItem alloc] initWithTitle:@"Гоняем по отдыху" StartDate:startDate  Location:@"Петроградская" Destination:@"Озерки" StartCoordinate:CLLocationCoordinate2DMake(59.93, 30.338) AndDestinationCoordinate:CLLocationCoordinate2DMake(59.943, 30.36) ]];
    [skateShedules addObject: [[ScheduleItem alloc] initWithTitle:@"Учимся слайдить итд." StartDate:startDate  Location:@"Черная речка" Destination:@"Черная речка" StartCoordinate:CLLocationCoordinate2DMake(59.93, 30.338) AndDestinationCoordinate:CLLocationCoordinate2DMake(59.943, 30.36) ]];
    
    
    NSMutableArray<ScheduleItem*> *bikeShedules = [[NSMutableArray alloc] init];
    [bikeShedules addObject: [[ScheduleItem alloc] initWithTitle:@"Обзорный заезд по центру" StartDate:startDate  Location:@"Центральный район" Destination:@"Центральный район" StartCoordinate:CLLocationCoordinate2DMake(59.93, 30.338) AndDestinationCoordinate:CLLocationCoordinate2DMake(59.943, 30.36) ]];
    [bikeShedules addObject: [[ScheduleItem alloc] initWithTitle:@"Научим трюкам" StartDate:startDate  Location:@"Адмиралтейская" Destination:@"Адмиралтейская" StartCoordinate:CLLocationCoordinate2DMake(59.99, 30.311) AndDestinationCoordinate:CLLocationCoordinate2DMake(59.933, 30.39) ]];
    
    
    
     UINavigationController *skateboardsNavController = [[UINavigationController alloc] initWithRootViewController: [[ScheduleViewController alloc] initWithSchedules:skateShedules]];
    skateboardsNavController.topViewController.navigationItem.title = @"Скейт/Лонгборд";
    skateboardsNavController.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    skateboardsNavController.tabBarItem.title = @"Скейт/Лонгборд";
    skateboardsNavController.tabBarItem.image = [UIImage imageNamed:@"Skateboard"];
    skateboardsNavController.navigationBar.translucent = NO;
    
    
    UINavigationController *bikesNavController = [[UINavigationController alloc] initWithRootViewController: [[ScheduleViewController alloc] initWithSchedules:bikeShedules] ];
    bikesNavController.topViewController.navigationItem.title = @"Велосипед";
    bikesNavController.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    bikesNavController.tabBarItem.title = @"Велосипед";
    bikesNavController.tabBarItem.image = [UIImage imageNamed:@"Bike"];
    bikesNavController.navigationBar.translucent = NO;
    
    [self setViewControllers:@[skateboardsNavController, bikesNavController]];
    
}


@end
