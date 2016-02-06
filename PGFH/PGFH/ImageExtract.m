//
//  ImageExtract.m
//  PGFH
//
//  Created by mansoor shaikh on 16/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "ImageExtract.h"

@implementation ImageExtract
@synthesize serverImage;

- (id)init
{
    self = [super init];
    if (self) {
        [self setContainerView:[self imageExtractView]];
    }
    return self;
}


-(UIView *)imageExtractView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200,250)];
    [demoView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"howtoregister_alert_bg.png"]]];
    demoView.layer.cornerRadius=5;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
    demoView.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    UIButton *topButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,200,40)];
    [topButton setTitle:@"PGFH" forState:UIControlStateNormal];
    [topButton setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forState:UIControlStateNormal];
    topButton.layer.cornerRadius=15;
    [topButton setFont:[UIFont boldSystemFontOfSize:20]];
    [demoView addSubview:topButton];
    
    UIButton *cancel=[[UIButton alloc] initWithFrame:CGRectMake(163,5,30,30)];
    [cancel setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(closeAlert:)
     forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:cancel];
    [demoView bringSubviewToFront:cancel];
    
    serverImage=[[AsyncImageView alloc] initWithFrame:CGRectMake(0,45, 200, 200)];
    [demoView addSubview:serverImage];
    serverImage.backgroundColor=[UIColor clearColor];

    [self addSubview:demoView];
    
    return demoView;
}

-(void)closeAlert:(id)sender{
    [self close];
}


@end
