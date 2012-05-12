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
    NSData *response;
}

-(id)initWithUsername:(NSString *) theUsername password:(NSString *)thePassword;
-(void)login;
-(BOOL)loginCorrect;

@property (nonatomic, assign) id  delegate;

@end
