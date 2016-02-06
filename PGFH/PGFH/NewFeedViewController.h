//
//  NewFeedViewController.h
//  PGFH
//
//  Created by arvind on 9/2/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import "menuControllers/MainViewController.h"


@interface NewFeedViewController : UIViewController<CLLocationManagerDelegate,UIAccelerometerDelegate>
@property(nonatomic,retain)IBOutlet UIButton *searchBtn,*pasteBtn,*fileBtn,*backBtn;
@property(nonatomic,retain) IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain) NSString *longitudeLabel,*latitudeLabel,*currentLocation;
- (IBAction)resetMaxValues:(id)sender;
@property(nonatomic,retain) MainViewController *mvc;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
