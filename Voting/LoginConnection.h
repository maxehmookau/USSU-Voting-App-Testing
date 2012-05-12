#import <Foundation/Foundation.h>
@class LoginConnection;
@protocol LoginConnectionDelegate

-(void)didLoginSuccesfullyWithResponse:(NSData *)response;
-(void)loginFailedWithError:(NSError *)error;

@end


@interface LoginConnection : NSObject
{
    NSString *username;
    NSString *password;
    NSMutableURLRequest *loginRequest;
}

-(id)initWithUsername:(NSString *) theUsername password:(NSString *)thePassword;
-(void)login;

@property (nonatomic, assign) id  delegate;

@end
