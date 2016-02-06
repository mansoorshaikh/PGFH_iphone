//
//  CategoryAlertView.m
//  PGFH
//
//  Created by mansoor shaikh on 07/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "CategoryAlertView.h"
#import "UIColor+Expanded.h"
#import <QuartzCore/QuartzCore.h>
@implementation CategoryAlertView
@synthesize appDelegate,serverImage,categoryListArray,mvc;
- (id)init
{
    self = [super init];
    appDelegate=[[UIApplication sharedApplication] delegate];
    if (self) {
        [self setContainerView:[self createDemoView]];
    }
    return self;
}

-(void)closeAlert:(id)sender{
    [self close];
}


- (UIView *)createDemoView
{
        UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 320)];
    [demoView setBackgroundColor:[UIColor blackColor]];
    demoView.layer.cornerRadius=5;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
    demoView.layer.borderColor=[[UIColor whiteColor]CGColor];

    UIImageView *selectcategory=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [selectcategory setImage:[UIImage imageNamed:@"navigationbar.png"]];
    [demoView addSubview:selectcategory];
    
    UILabel *selectCategoryLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 2,150, 50)];
    selectCategoryLabel.textColor=[UIColor colorWithHexString:@"ffffff"];
    selectCategoryLabel.text=@"Choose Category";
    [selectCategoryLabel setFont:[UIFont boldSystemFontOfSize:17]];
    selectCategoryLabel.textAlignment=UITextAlignmentCenter;
    [demoView addSubview:selectCategoryLabel];
    
    UIButton *cancel=[[UIButton alloc] initWithFrame:CGRectMake(163,10,30,30)];
    [cancel setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(closeAlert:)
     forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:cancel];
    [demoView bringSubviewToFront:cancel];

    
    UIScrollView *categoryScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 200, 260)];
    categoryScrollView.contentSize=CGSizeMake(200, [appDelegate.categoryListArray count]*45);
    int yValue=0;
    for (int count=0; count<[appDelegate.categoryListArray count]; count++) {
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, yValue, 200, 38)];
        [btn setTitle:[appDelegate.categoryListArray objectAtIndex:count] forState:UIControlStateNormal];
        btn.tag=count;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn addTarget:self action:@selector(buttonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        [categoryScrollView addSubview:btn];
        yValue=yValue+4;
        UIImageView *lineLbl=[[UIImageView alloc] initWithFrame:CGRectMake(0, yValue,200,2)];
        lineLbl.backgroundColor = [UIColor whiteColor];
        [categoryScrollView addSubview:lineLbl];

        yValue=yValue+44;
    }
    [demoView addSubview:categoryScrollView];
    
    return demoView;
}

-(void)buttonAction:(UIButton*)btn{
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    NSString *catStr=[[NSString alloc]init];
    catStr=[appDelegate.categoryListArray objectAtIndex:btn.tag];
    mvc.searchString=@"";
    mvc.categoryString=[[NSString alloc]init];
    mvc.categoryString=catStr;
    [self popViewController];
}
-(IBAction)popViewController{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}
@end
