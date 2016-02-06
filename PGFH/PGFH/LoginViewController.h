//
//  LoginViewController.h
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
//#import "AppDelegate.h"
@class AppDelegate;
@interface LoginViewController : UIViewController<UITextFieldDelegate,CustomIOS7AlertViewDelegate>
@property(nonatomic,retain)IBOutlet UIButton *signUpButton,*loginBtn,*facebookloginBtn,*forgtBtn;
@property(nonatomic,retain)IBOutlet UITextField *usernameTxt,*passwordTxt;
@property(nonatomic,retain)IBOutlet UIImageView *mainImg,*subImg,*iconImg,*contactImg;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) IBOutlet UITextField *ChangePass;
@property(nonatomic,retain) NSString *changePassStr;
@property(nonatomic,retain) IBOutlet UIButton *upDateBtn,*cancelBtn;
@property(nonatomic,retain) CustomIOS7AlertView *alertView;
@property(nonatomic,retain) NSString *firstname,*emailStr,*usernameStr;
@property(nonatomic,retain) IBOutlet UILabel *iconBackLbl;
@property(nonatomic,retain)  UIAlertView *alert,*alerts;
@property(nonatomic,retain) AppDelegate *appDelegate;

@end
