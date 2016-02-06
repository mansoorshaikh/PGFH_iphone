//
//  MerchantListViewController.h
//  PGFH
//
//  Created by mansoor shaikh on 28/02/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "AppDelegate.h"
#import "MerchantVO.h"
@interface MerchantListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate, UISearchBarDelegate,NSXMLParserDelegate>{
    BOOL isSearching;
}
@property(nonatomic,retain) IBOutlet UITableView *merchantTableview;
@property(nonatomic,retain) NSMutableArray *merchantsArray,*filteredContentList;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain)IBOutlet UIButton   *backBtn,*searchBtn,*categoriesBtn,*postBtn;
@property(nonatomic,retain)IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain) MainViewController *mvc;
@property(nonatomic,retain)IBOutlet UIImageView *logoimg;
@property(nonatomic,retain) MerchantVO *merchant;
@property(nonatomic,retain) NSString *characters,*searchString,*currentElement;
@property(nonatomic,retain)UILabel *merchantNameTextview,*merchantDescriptionTextview;
@property (nonatomic, retain) NSMutableString *currentElementData;

@end
