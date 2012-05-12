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
    NSString * postString = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
    NSData *postData = [NSData dataWithBytes:[postString UTF8String] length:[postString length]];
    loginRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.sussex.ac.uk/ussuelection/public/"]];
    [loginRequest setHTTPMethod:@"POST"];
    [loginRequest setHTTPBody:postData];
    NSError *error = nil;
    response = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse:nil error:&error];
    if (error)
    {
        //If there's an error, alert the delegate
        [delegate loginFailedWithError:error];
    }else if(![self loginCorrect]){
        //If the password was incorrect, use a different error
        NSError *passwordFailError = [[NSError alloc]  initWithDomain:@"SUPasswordFailError" code:1 userInfo:nil];
        [delegate loginFailedWithError:passwordFailError];
    }else{
        //Otherwise alert the delegate that everything is fine and pass the finished page back to the view controller.
        [delegate didLoginSuccesfullyWithResponse:response];
    }
}

-(BOOL)loginCorrect
{
    if([[self getTitle]isEqualToString:@"Students Union Elections : University of Sussex"])
    {
        return NO;
    }
    return YES;
}

-(NSString *)getTitle
{
    NSString *html = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSString *left = [[html componentsSeparatedByString:@"</title>"]objectAtIndex:0];
    NSString *right = [[left componentsSeparatedByString:@"<title>"]objectAtIndex:1];
    NSLog(@"%@", right);
    return right;
}
@end
