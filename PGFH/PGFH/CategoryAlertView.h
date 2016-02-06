//
//  CategoryAlertView.h
//  PGFH
//
//  Created by mansoor shaikh on 07/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
#import "AppDelegate.h"
#import "AsyncImageView.h"
#import "MainViewController.h"

@interface CategoryAlertView : CustomIOS7AlertView
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) AsyncImageView *serverImage;
@property(nonatomic,retain) NSMutableArray *categoryListArray;
@property(nonatomic,retain) MainViewController *mvc;

@end
