//
//  HomeViewController.h
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MainVo.h"
#import "NewPostVO.h"
#import "AdvtPostVO.h"
#import "AnnouncementVO.h"
#import "commentVO.h"
#import "pictureVO.h"
#import <MapKit/MapKit.h>

@interface HomeViewController : UIViewController<UISearchDisplayDelegate, UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,NSXMLParserDelegate,CLLocationManagerDelegate>{
    BOOL isSearching;

}
@property(nonatomic,retain)IBOutlet UIButton *searchBtn,*pasteBtn,*fileBtn;
@property(nonatomic,retain) IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain) IBOutlet UITableView *mainFeedsTableView;
@property(nonatomic,retain) IBOutlet UIButton *menuBtn;
@property(nonatomic,retain) IBOutlet UIButton *categoriesBtn,*backBtn;
@property(nonatomic,retain) IBOutlet UIImageView *navigationImg;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) NSMutableArray *mainFeedtypeArray,*feedPostArray,*advtPostArray,*annonPostArray,*categoryListArray;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) MainVo *mainFeedVO;
@property(nonatomic,retain) NewPostVO *newpostVO;
@property(nonatomic,retain) AdvtPostVO *advtpostVO;
@property(nonatomic,retain) AnnouncementVO *annouFeedVO;
@property(nonatomic,retain) commentVO *comVO;
@property(nonatomic,retain) pictureVO *picVO;
@property(nonatomic,retain) NSString *characters,*commentStr,*categoryStr,*searchString;
@property (strong, nonatomic) NSMutableArray* filterFeedArray,*currentFeedArray;
@property (strong, nonatomic) UISearchDisplayController *searchDisplayController;
@property(nonatomic,readwrite) BOOL isFiltered;
@property(nonatomic,readwrite) int searchcount,feedcount;
@property(nonatomic,retain)  UIAlertView *alert;
@property(nonatomic,readwrite)  int counst;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,readwrite) CLLocationCoordinate2D currentLocation;
@property(nonatomic,retain) MKPointAnnotation *annotation;
@property(nonatomic,retain) NSString *fromView,*currentElement;
@property (nonatomic, retain) NSMutableString *currentElementData;

@end

