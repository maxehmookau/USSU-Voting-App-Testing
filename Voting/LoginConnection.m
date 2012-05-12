#import "LoginConnection.h"

@implementation LoginConnection
@synthesize delegate;
-(id)initWithUsername:(NSString *)theUsername password:(NSString *)thePassword
{
    username = theUsername;
    password = thePassword;
    return [super init];
}

-(void)login
{
    NSString * postString = @"username=magw20&password=fupk5ek2";
    NSData *postData = [NSData dataWithBytes:[postString UTF8String] length:[postString length]];
    loginRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.sussex.ac.uk/ussuelection/public/"]];
    [loginRequest setHTTPMethod:@"POST"];
    [loginRequest setHTTPBody:postData];
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse:nil error:&error];
    NSLog(@"%@", [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
    if (error)
    {
        //If there's an error, alert the delegate
        [delegate loginFailedWithError:error];
    }else{
        [delegate didLoginSuccesfullyWithResponse:response];
    }
}
@end
