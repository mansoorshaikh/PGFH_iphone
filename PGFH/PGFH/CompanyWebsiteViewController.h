//
//  CompanyWebsiteViewController.h
//  PGFH
//
//  Created by mansoor shaikh on 28/02/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "AppDelegate.h"
@interface CompanyWebsiteViewController : UIViewController<UISearchDisplayDelegate, UISearchBarDelegate>
@property(nonatomic,retain)IBOutlet UIButton   *backBtn,*searchBtn,*categoriesBtn,*postBtn;
@property(nonatomic,retain)IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain)IBOutlet UIWebView *webView;
@property(nonatomic,retain) MainViewController *mvc;
@property(nonatomic,retain)IBOutlet UIImageView *logoimg;

@end
