//
//  AppDelegate.h
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property(nonatomic,retain)LoginViewController *loginviewController;

@property(nonatomic,retain) NSString *currentlocation,*searchString;
@property(nonatomic,retain) NSMutableArray *feedData,*userData,*categoryListArray;
@property(nonatomic,retain) NSString *latitudeStrs,*longitudeStrs;
@property(nonatomic,readwrite) int index,indexs;
@property(nonatomic,retain) NSString *deviceToken;
@property(nonatomic,retain) NSString *pushStr;
@end

