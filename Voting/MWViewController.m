//
//  MWViewController.m
//  Voting
//
//  Created by Max Woolf on 12/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MWViewController.h"

@interface MWViewController ()

@end

@implementation MWViewController

- (void)viewDidLoad
{
    NSString * postString = @"username=magw20&password=fupk5ek2";
    NSData *postData = [NSData dataWithBytes:[postString UTF8String] length:[postString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.sussex.ac.uk/ussuelection/public/"]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog(@"%@", [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
