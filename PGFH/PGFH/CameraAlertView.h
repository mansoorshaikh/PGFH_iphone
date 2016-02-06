//
//  CameraAlertView.h
//  PGFH
//
//  Created by mansoor shaikh on 11/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
#import "AppDelegate.h"
@class AppDelegate;
@interface CameraAlertView : CustomIOS7AlertView<UIPopoverControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, retain) UIPopoverController *popover;

@property(nonatomic,retain) AppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet UIView *demoView;
@property (nonatomic, retain) IBOutlet UIButton *cancel;
@end
