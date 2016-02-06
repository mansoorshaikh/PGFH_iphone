//
//  RegisterViewController.h
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppDelegate;
@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain)IBOutlet UIButton *signUpButton,*backBtn;
@property(nonatomic,retain)IBOutlet UITextField *usernameTxt,*passwordTxt,*nameTxt,*phoneTxt,*emailTxt;
@property(nonatomic,retain)IBOutlet UIImageView *mainImg,*subImg;
@property(nonatomic,retain)IBOutlet UILabel *signUpLbl;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) AppDelegate *appDelegate;

@end
