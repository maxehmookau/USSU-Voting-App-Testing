#import "MWViewController.h"

@interface MWViewController ()

@end

@implementation MWViewController

#pragma mark - Login Connection Delegate Methods
-(void)loginFailedWithError:(NSError *)error
{
    NSLog(@"Failure");
}

-(void)didLoginSuccesfullyWithResponse:(NSData *)response
{
    NSLog(@"Success");
}

- (void)viewDidLoad
{
    loginConnection = [[LoginConnection alloc] initWithUsername:@"magw20" password:@""];
    [loginConnection setDelegate:self];
    [loginConnection login];
    [super viewDidLoad];
}


@end
