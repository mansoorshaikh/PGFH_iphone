//
//  AdvtPostViewController.h
//  PGFH
//
//  Created by arvind on 9/7/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
#import "AppDelegate.h"
#import "menuControllers/MainViewController.h"
#import "AdvtPostVO.h"
#import "pictureVO.h"
#import "commentVO.h"
#import <MapKit/MapKit.h>
#import "HomeViewController.h"
@interface AdvtPostViewController : UIViewController<UISearchDisplayDelegate, UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,MKMapViewDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate,UITextViewDelegate,CustomIOS7AlertViewDelegate,NSXMLParserDelegate>

@property(nonatomic,retain)IBOutlet UIButton *searchBtn,*pasteBtn,*fileBtn,*commentBtn;
@property(nonatomic,retain) IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain) IBOutlet UITableView *mainFeedsTableView;
@property (nonatomic,retain) IBOutlet UIImageView *navBarImage;

@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) IBOutlet UIButton *menuBtn;
@property(nonatomic,retain) IBOutlet UITextView *descriptionView;
@property (nonatomic, retain) IBOutlet UILabel *outletLbl,*locationLbl,*lattitudeLbl,*longitudeLbl,*contactLbl,*photoLbl,*descriptionLbl,*commentLbl,*outletLblTxt,*locationLblTxt,*contactLblTxt,*desricLblTxt,*operatingHour,*operatinghrdisplay;
@property (nonatomic, retain) IBOutlet UITextField *outletTxt,*locationTxt,*lattideTxt,*longitude,*contactTxt;
@property(nonatomic,retain) IBOutlet UIScrollView *scrollview,*postImagesScrollview;
@property(nonatomic,retain) MainViewController *mvc;
@property(nonatomic,retain) AdvtPostVO *aVO;
@property(nonatomic,retain)pictureVO *pVO;
@property(nonatomic,retain) commentVO *cVO;
@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,readwrite) CLLocationCoordinate2D currentLocation;
@property(nonatomic,retain) MKPointAnnotation *annotation;
@property (nonatomic,retain) IBOutlet UIImageView *imghorLine,*imghorLine1,*imghorLine2;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) NSString *characters,*commentStr;
@property(nonatomic,retain)  UIAlertView *alert,*alertCmt;
@property(nonatomic,retain) HomeViewController *hvc;
@property(nonatomic,readwrite) int oldHeight;
@property(nonatomic,retain) CustomIOS7AlertView *alertView1,*alertview_post;
@property(nonatomic,retain) IBOutlet UITextView *commentTextView;
@property (nonatomic, retain) IBOutlet UIView *demoView;

@end
