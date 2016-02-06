//
//  CommentViewController.h
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RateView.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomIOS7AlertView.h"
#import "NewPostVO.h"
#import "pictureVO.h"
#import "commentVO.h"
#import "HomeViewController.h"
#import "MainViewController.h"
@interface CommentViewController : UIViewController<RateViewDelegate,UISearchDisplayDelegate, UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,MKMapViewDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate,UITextViewDelegate,CustomIOS7AlertViewDelegate,NSXMLParserDelegate>
@property(nonatomic,retain)IBOutlet UIButton *searchBtn,*pasteBtn,*fileBtn,*commentBtn;
@property(nonatomic,retain) IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain) IBOutlet UITableView *mainFeedsTableView;
@property(nonatomic,retain) IBOutlet UIScrollView *scrollview,*postImagesScrollview;
@property (nonatomic,retain) IBOutlet RateView *tasteRateView,*priceRateView,*hygiennseRateView,*serviceRateView;
@property (nonatomic,retain) IBOutlet UIImageView *navBarImage,*imghorLine,*imghorLine1,*imghorLine2,*imghorLine3,*virticalimg;
@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,readwrite) CLLocationCoordinate2D currentLocation;
@property(nonatomic,retain) MKPointAnnotation *annotation;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) IBOutlet UIButton *menuBtn;
@property(nonatomic,retain) NSString *fromView;
@property(nonatomic,retain) IBOutlet UITextView *descriptionView;
@property(nonatomic,retain) CustomIOS7AlertView *alertView1,*alertview_post;
@property(nonatomic,retain) IBOutlet UITextView *commentTextView;
@property (nonatomic, retain) IBOutlet UIView *demoView;
@property (nonatomic, retain) IBOutlet UILabel *ratingLbl,*restaurantLbl,*addLbl,*priceLbl,*priceCostLbl,*tasteLbl,*pirceRateLbl,*hygieneLbl,*serviceLbl,*photoLbl,*descriptionLbl,*commentLbl,*restaNameLbl,*desricLblTxt,*rmLbl,*contactno,*contNodis,*operatingmainLbl,*operaFrmLbl,*operaTolbl,*OperaHrsLbl;
@property (nonatomic,retain) IBOutlet UIImageView *img1,*img2,*img3;
@property(nonatomic,retain) NewPostVO *nVO;
@property(nonatomic,retain)pictureVO *pVO;
@property(nonatomic,retain) commentVO *cVO;
@property(nonatomic,retain) HomeViewController *hvc;
@property(nonatomic,retain) MainViewController *mvc;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) NSString *characters,*commentStr,*commenStroperatingHr;
@property(nonatomic,retain)  UIAlertView *alert,*alertCmt;
@property(nonatomic,readwrite) int oldHeight;

@end
