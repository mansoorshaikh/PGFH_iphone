//
//  CameraAlertView.m
//  PGFH
//
//  Created by mansoor shaikh on 11/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "CameraAlertView.h"
#import "UIColor+Expanded.h"
#import "AsyncImageView.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <QuartzCore/QuartzCore.h>
@implementation CameraAlertView
@synthesize appDelegate,popover,demoView,cancel;

- (id)init
{
    self = [super init];
    appDelegate=[[UIApplication sharedApplication] delegate];
    if (self) {
        [self setContainerView:[self createDemoView_Camera]];
    }
    return self;
}


- (UIView *)createDemoView_Camera
{
    
     demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300,150)];
    [demoView setBackgroundColor:[UIColor whiteColor]];
     demoView.layer.cornerRadius=5;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
     demoView.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    
    UIButton *topButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    [topButton setTitle:@"Picture Option" forState:UIControlStateNormal];
    [topButton setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forState:UIControlStateNormal];
    topButton.layer.cornerRadius=15;
    [topButton setFont:[UIFont boldSystemFontOfSize:20]];
    [demoView addSubview:topButton];
        
    return demoView;
}

-(void)closeAlert:(id)sender{
    [self close];
}







@end
