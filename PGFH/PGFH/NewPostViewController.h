//
//  NewPostViewController.h
//  PGFH
//
//  Created by arvind on 8/19/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"
#import "CustomIOS7AlertView.h"
#import <MapKit/MapKit.h>
#import "menuControllers/MainViewController.h"
#import "AppDelegate.h"
#import "commentVO.h"
#import "CameraAlertView.h"

@interface NewPostViewController : UIViewController<RateViewDelegate,UISearchDisplayDelegate, UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,MKMapViewDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate,UITextViewDelegate,CustomIOS7AlertViewDelegate,UIActionSheetDelegate>
@property(nonatomic,retain) IBOutlet UIScrollView *scrollview,*postImagesScrollview;
@property (nonatomic,retain) IBOutlet RateView *tasteRateView,*priceRateView,*hygiennseRateView,*serviceRateView;
@property (nonatomic,retain) IBOutlet UIImageView *navBarImage,*imghorLine,*imghorLine1;
@property(nonatomic,retain) IBOutlet UISearchBar *userSearchBar;
@property(nonatomic,retain) IBOutlet UITableView *mainFeedsTableView;
@property(nonatomic,retain) NSString *fromView;
@property(nonatomic,retain) IBOutlet UITextView *descriptionView;
@property(nonatomic,retain) CustomIOS7AlertView *alertView1,*alertview_post;
@property(nonatomic,retain) IBOutlet UITextView *commentTextView;
@property (nonatomic, retain) IBOutlet UIView *demoView;
@property (nonatomic, retain) IBOutlet UILabel *tasteLbl,*priceLbl,*hygieneLbl,*serviceLbl,*pictureLbl,*navigationLbl,*ratingLbl,*restaurentLbl,*pricesLbl,*categoryLbl,*addressLbl,*descriptionLbl,*contactnoLbl,*operatingHourLbl,*operatingHourLblFrm,*operatingHourLblTo,*breakfastLbl,*lunchLbl,*dinnerLbl,*fulldayLbl;
@property (nonatomic, retain) IBOutlet UIButton *setimgBtn,*submitBtn,*backBtn,*cancelBtn,*cancelBtn1,*cancelBtn2,*cancelBtn3,*cancelBtn4,*cancelBtn5,*cancelBtn6,*cancelBtn7,*cancelBtn8,*cancelBtn9,*mapBtn,*breakfastBtn,*lunchBtn,*dinnerBtn,*fulldayBtn;
@property(nonatomic,retain) MainViewController *mvc;
@property(nonatomic,retain) UIImage *image_;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,readwrite) int imageXValue,imagHeg,canimgheg;
@property(nonatomic,retain) NSMutableArray *scrollviewImages,*categoryListArray;
@property(nonatomic,retain) IBOutlet UIImageView *imageFood1,*imageFood2,*imageFood3,*imageFood4,*imgview,*imgview1,*imgview2,*imgview3,*imgview4,*imgview5,*imgview6,*imgview7,*imgview8,*imgview9;
@property(nonatomic,retain) IBOutlet UITextField *restaurantTxt,*priceTxt,*categoryTxt,*addressTxt,*latitudeTxt,*longitudeTxt,*restNameTxt,*contactNoTxt,*operatinghourTxtfrm,*operatinghourTxtTo;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) NSString *categoryStr,*foodpostIdStr,*breakfastStr,*lunchStr,*dinerStr,*fulldayStr;
@property(nonatomic,retain)  UIAlertView *alert,*uploadAlert;
@property(nonatomic,retain) commentVO *comVO;
@property(nonatomic,retain) CameraAlertView *cav;
@property(nonatomic,retain) CustomIOS7AlertView *alertView;
@property(nonatomic,retain) IBOutlet UIDatePicker *datepicker;
@property(nonatomic,retain) IBOutlet UIToolbar *toolbar,*toolbarstarttm,*toolbarendTm;
@property(nonatomic,retain) NSDateFormatter *starttime,*endtime;

@end
