//
//  NewPostViewController.m
//  PGFH
//
//  Created by arvind on 8/19/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "NewPostViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "HomeViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "PickLocationViewController.h"
#import "Reachability.h"
#import "CategoryAlertView.h"
#import "UIColor+Expanded.h"

#define kOFFSET_FOR_KEYBOARD 80.0
#define k_KEYBOARD_OFFSET 80.0

@interface NewPostViewController ()

@end

@implementation NewPostViewController
@synthesize scrollview,postImagesScrollview,tasteRateView,priceRateView,hygiennseRateView,serviceRateView,navBarImage,userSearchBar,mainFeedsTableView,descriptionView,alertView1,alertview_post,commentTextView,demoView,tasteLbl,priceLbl,hygieneLbl,serviceLbl,pictureLbl,setimgBtn,submitBtn,navigationLbl,backBtn,imghorLine,imghorLine1,ratingLbl,restaurentLbl,pricesLbl,categoryLbl,addressLbl,descriptionLbl,mvc,image_,activityIndicator,imageXValue,scrollviewImages,imageFood1,imageFood2,imageFood3,imageFood4,restaurantTxt,priceTxt,categoryTxt,addressTxt,latitudeTxt,longitudeTxt,appDelegate,categoryStr,alert,categoryListArray,comVO,restNameTxt,imgview,cancelBtn,imgview1,imgview2,imgview3,cancelBtn1,cancelBtn2,cancelBtn3,foodpostIdStr,uploadAlert,cav,alertView,imagHeg,canimgheg,contactnoLbl,operatingHourLbl,contactNoTxt,operatinghourTxtfrm,operatinghourTxtTo,operatingHourLblFrm,operatingHourLblTo,cancelBtn4,cancelBtn5,cancelBtn6,cancelBtn7,cancelBtn8,cancelBtn9,imgview4,imgview5,imgview6,imgview7,imgview8,imgview9,datepicker,toolbar,toolbarstarttm,toolbarendTm,starttime,endtime,mapBtn,breakfastBtn,lunchBtn,dinnerBtn,fulldayBtn,breakfastLbl,lunchLbl,dinnerLbl,fulldayLbl,breakfastStr,lunchStr,dinerStr,fulldayStr;
- (void)viewDidLoad {
    [super viewDidLoad];
    [activityIndicator stopAnimating];
    appDelegate=[[UIApplication sharedApplication] delegate];
    [restNameTxt setDelegate:self];
    [latitudeTxt setDelegate:self];
    [longitudeTxt setDelegate:self];
    
    scrollviewImages=[[NSMutableArray alloc]init];
    categoryListArray=[[NSMutableArray alloc]init];
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    imageXValue=10;

    
    NSDate *nowTime = [[NSDate alloc] init];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"hh:mm a"];
    NSString *theTime = [timeFormat stringFromDate:nowTime];
    operatinghourTxtfrm.text=theTime;
    operatinghourTxtTo.text=theTime;
    datepicker.hidden=YES;
    datepicker.backgroundColor = [UIColor whiteColor];
    datepicker.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];

    foodpostIdStr=[[NSString alloc]init];
    self.navigationController.navigationBarHidden=YES;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    if(yzheight>=568){
        scrollview.contentSize=CGSizeMake(width, yzheight+750);
    }else{
        scrollview.contentSize=CGSizeMake(width, yzheight+900);
    }
    //scroll view size
    int height_msgTextView=150;
    
    int yHeight=height_msgTextView+10;
    scrollview.scrollEnabled=YES;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    NewPostViewController *npvc;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        npvc=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController~ipad" bundle:nil];
    }else{
    if(height>=480 && height<568){
        navBarImage.layer.frame=CGRectMake(0,0,self.view.bounds.size.width,60);
        [navBarImage removeFromSuperview];
        [self.view addSubview:navBarImage];
        
        backBtn.layer.frame=CGRectMake(8,14,35,35);
        [backBtn removeFromSuperview];
        [self.view addSubview:backBtn];
        
        navigationLbl.layer.frame=CGRectMake(100,14,150,40);
        [navigationLbl removeFromSuperview];
        [self.view addSubview:navigationLbl];
        yHeight=0;
        pictureLbl.layer.frame=CGRectMake(20,yHeight,180,30);
        [pictureLbl removeFromSuperview];
        [self.scrollview addSubview:pictureLbl];
        yHeight=yHeight+10;
        setimgBtn.layer.frame=CGRectMake(260,yHeight,40,40);
        [setimgBtn removeFromSuperview];
        [self.scrollview addSubview:setimgBtn];
        yHeight=yHeight+100;

        restaurentLbl.layer.frame=CGRectMake(20,yHeight,200,30);
        [restaurentLbl removeFromSuperview];
        [restaurentLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:restaurentLbl];
        yHeight=yHeight+40;

        restNameTxt.layer.frame=CGRectMake(20,yHeight,280,30);
        [restNameTxt removeFromSuperview];
        [restNameTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:restNameTxt];
        yHeight=yHeight+40;

        pricesLbl.layer.frame=CGRectMake(20,yHeight,130,30);
        [pricesLbl removeFromSuperview];
        [pricesLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:pricesLbl];
        
        categoryLbl.layer.frame=CGRectMake(165,yHeight,290,30);
        [categoryLbl removeFromSuperview];
        [categoryLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:categoryLbl];

        yHeight=yHeight+40;

        priceTxt.layer.frame=CGRectMake(20,yHeight,130,30);
        [priceTxt removeFromSuperview];
        [priceTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:priceTxt];
        
        categoryTxt.layer.frame=CGRectMake(165,yHeight,130,30);
        [categoryTxt removeFromSuperview];
        [categoryTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:categoryTxt];

        yHeight=yHeight+40;

        [priceTxt setKeyboardType:UIKeyboardTypeDecimalPad];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [numberToolbar sizeToFit];
        priceTxt.inputAccessoryView = numberToolbar;
        
        
        
        
        contactnoLbl.layer.frame=CGRectMake(20,yHeight,200,30);
        [contactnoLbl removeFromSuperview];
        [contactnoLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:contactnoLbl];
        yHeight=yHeight+40;

        contactNoTxt.layer.frame=CGRectMake(20,yHeight,150,30);
        [contactNoTxt removeFromSuperview];
        [contactNoTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:contactNoTxt];
        yHeight=yHeight+40;

        breakfastBtn.layer.frame=CGRectMake(20,yHeight,21,21);
        [breakfastBtn setTag:0];
        [breakfastBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [breakfastBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [breakfastBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[breakfastBtn removeFromSuperview];
        [self.scrollview addSubview:breakfastBtn];
        
        
        breakfastLbl.layer.frame=CGRectMake(55,yHeight,120,30);
        [breakfastLbl removeFromSuperview];
        [breakfastLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:breakfastLbl];
        
        lunchBtn.layer.frame=CGRectMake(170,yHeight,21,21);
        [lunchBtn setTag:1];
        [lunchBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [lunchBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [lunchBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [lunchBtn removeFromSuperview];
        [self.scrollview addSubview:lunchBtn];
        lunchLbl.layer.frame=CGRectMake(220,yHeight,120,30);
        //[lunchLbl removeFromSuperview];
        [lunchLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:lunchLbl];
        
        yHeight=yHeight+40;
        
        dinnerBtn.layer.frame=CGRectMake(20,yHeight,21,21);
        [dinnerBtn setTag:2];
        [dinnerBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [dinnerBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [dinnerBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[dinnerBtn removeFromSuperview];
        [self.scrollview addSubview:dinnerBtn];
        
        dinnerLbl.layer.frame=CGRectMake(55,yHeight,120,30);
        [dinnerLbl removeFromSuperview];
        [dinnerLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:dinnerLbl];
        
        fulldayBtn.layer.frame=CGRectMake(170,yHeight,21,21);
        [fulldayBtn setTag:3];
        [fulldayBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [fulldayBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [fulldayBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[fulldayBtn removeFromSuperview];
        [self.scrollview addSubview:fulldayBtn];
        
        fulldayLbl.layer.frame=CGRectMake(220,yHeight,120,30);
        [fulldayLbl removeFromSuperview];
        [fulldayLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:fulldayLbl];
        
        yHeight=yHeight+40;

        addressLbl.layer.frame=CGRectMake(20,yHeight,260,30);
        [addressLbl removeFromSuperview];
        [addressLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:addressLbl];
        yHeight=yHeight+40;

        addressTxt.layer.frame=CGRectMake(20,yHeight,240,30);
        [addressTxt removeFromSuperview];
        [addressTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:addressTxt];
        yHeight=yHeight+40;

        latitudeTxt.layer.frame=CGRectMake(20,yHeight,130,30);
        [latitudeTxt removeFromSuperview];
        [latitudeTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:latitudeTxt];
        
        longitudeTxt.layer.frame=CGRectMake(165,yHeight,130,30);
        [longitudeTxt removeFromSuperview];
        [longitudeTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:longitudeTxt];
        yHeight=yHeight+40;

        descriptionLbl.layer.frame=CGRectMake(20,yHeight,290,30);
        [descriptionLbl removeFromSuperview];
        [descriptionLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:descriptionLbl];
        yHeight=yHeight+40;

        [descriptionView removeFromSuperview];
        descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(20,yHeight,280,height_msgTextView)];
        descriptionView.layer.borderColor=[[UIColor grayColor]CGColor];
        descriptionView.layer.borderWidth=0.5;
        descriptionView.layer.cornerRadius=8;
        descriptionView.scrollEnabled = YES;
        self.descriptionView.delegate = self;
        descriptionView.text=@"Comment....";
        descriptionView.font = [UIFont systemFontOfSize:18.0f];
        descriptionView.backgroundColor=[UIColor clearColor];
        [self.scrollview addSubview:descriptionView];
        yHeight=yHeight+height_msgTextView+10;
        
        imghorLine.layer.frame=CGRectMake(10,yHeight,290,2);
        [imghorLine removeFromSuperview];
        [self.scrollview addSubview:imghorLine];
        yHeight=yHeight+10;
        ratingLbl.layer.frame=CGRectMake(20,yHeight,290,30);
        [ratingLbl removeFromSuperview];
        [ratingLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:ratingLbl];
        yHeight=yHeight+30;
        tasteLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [tasteLbl removeFromSuperview];
        [self.scrollview addSubview:tasteLbl];
        yHeight=yHeight-10;
        
        [tasteRateView removeFromSuperview];
        tasteRateView=[[RateView alloc] init];
        tasteRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:tasteRateView];
        [self.scrollview bringSubviewToFront:tasteRateView];
        tasteRateView.delegate=self;
        
        yHeight=yHeight+60;
        priceLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [priceLbl removeFromSuperview];
        [priceLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:priceLbl];
        yHeight=yHeight-10;
        [priceRateView removeFromSuperview];
        priceRateView=[[RateView alloc] init];
        priceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:priceRateView];
        [self.scrollview bringSubviewToFront:priceRateView];
        priceRateView.delegate=self;
        yHeight=yHeight+60;
        hygieneLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [hygieneLbl removeFromSuperview];
        [self.scrollview addSubview:hygieneLbl];
        yHeight=yHeight-10;
        [hygiennseRateView removeFromSuperview];
        hygiennseRateView=[[RateView alloc] init];
        hygiennseRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:hygiennseRateView];
        [self.scrollview bringSubviewToFront:hygiennseRateView];
        hygiennseRateView.delegate=self;
        yHeight=yHeight+60;
        serviceLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [serviceLbl removeFromSuperview];
        [self.scrollview addSubview:serviceLbl];
        yHeight=yHeight-10;
        [serviceRateView removeFromSuperview];
        serviceRateView=[[RateView alloc] init];
        serviceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:serviceRateView];
        [self.scrollview bringSubviewToFront:serviceRateView];
        serviceRateView.delegate=self;
        yHeight=yHeight+60;
        imghorLine1.layer.frame=CGRectMake(10,yHeight,290,2);
        [imghorLine1 removeFromSuperview];
        [self.scrollview addSubview:imghorLine1];
        
        imageFood1.layer.frame=CGRectMake(10,yHeight,50,50);
        [imageFood1 removeFromSuperview];
        [self.scrollview addSubview:imageFood1];
        
        imageFood2.layer.frame=CGRectMake(90,yHeight,50,50);
        [imageFood2 removeFromSuperview];
        [self.scrollview addSubview:imageFood2];
        
        imageFood3.layer.frame=CGRectMake(170,yHeight,50,50);
        [imageFood3 removeFromSuperview];
        [self.scrollview addSubview:imageFood3];
        
        imageFood4.layer.frame=CGRectMake(250,yHeight,50,50);
        [imageFood4 removeFromSuperview];
        [self.scrollview addSubview:imageFood4];
        
        yHeight=yHeight+80;
        submitBtn.layer.frame=CGRectMake(40,yHeight,220,50);
        [submitBtn removeFromSuperview];
        [self.scrollview addSubview:submitBtn];
        yHeight=yHeight+20;
        
        [mainFeedsTableView removeFromSuperview];
        [mainFeedsTableView setFrame:CGRectMake(0,yHeight, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.mainFeedsTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
        [self.scrollview addSubview:mainFeedsTableView];
        
    }else if(height>=568 && height<600){
        navBarImage.layer.frame=CGRectMake(0,0,self.view.bounds.size.width,60);
        [navBarImage removeFromSuperview];
        [self.view addSubview:navBarImage];
        
        backBtn.layer.frame=CGRectMake(8,14,35,35);
        [backBtn removeFromSuperview];
        [self.view addSubview:backBtn];
        
        navigationLbl.layer.frame=CGRectMake(100,14,150,40);
        [navigationLbl removeFromSuperview];
        [self.view addSubview:navigationLbl];
        yHeight=0;
        pictureLbl.layer.frame=CGRectMake(20,yHeight,180,30);
        [pictureLbl removeFromSuperview];
        [self.scrollview addSubview:pictureLbl];
        setimgBtn.layer.frame=CGRectMake(260,yHeight,40,40);
        [setimgBtn removeFromSuperview];
        [self.scrollview addSubview:setimgBtn];
        
        yHeight=yHeight+130;

        restaurentLbl.layer.frame=CGRectMake(20,yHeight,200,30);
        [restaurentLbl removeFromSuperview];
        [restaurentLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:restaurentLbl];
        yHeight=yHeight+40;
        restNameTxt.layer.frame=CGRectMake(20,yHeight,280,30);
        [restNameTxt removeFromSuperview];
        [restNameTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:restNameTxt];
        yHeight=yHeight+40;
        pricesLbl.layer.frame=CGRectMake(20,yHeight,130,30);
        [pricesLbl removeFromSuperview];
        [pricesLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:pricesLbl];
        
        categoryLbl.layer.frame=CGRectMake(165,yHeight,290,30);
        [categoryLbl removeFromSuperview];
        [categoryLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:categoryLbl];

        yHeight=yHeight+40;

        priceTxt.layer.frame=CGRectMake(20,yHeight,130,30);
        [priceTxt removeFromSuperview];
        [priceTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:priceTxt];
        
        categoryTxt.layer.frame=CGRectMake(165,yHeight,130,30);
        [categoryTxt removeFromSuperview];
        [categoryTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:categoryTxt];

        yHeight=yHeight+40;

        [priceTxt setKeyboardType:UIKeyboardTypeDecimalPad];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [numberToolbar sizeToFit];
        priceTxt.inputAccessoryView = numberToolbar;
        
        contactnoLbl.layer.frame=CGRectMake(20,yHeight,180,30);
        [contactnoLbl removeFromSuperview];
        [contactnoLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:contactnoLbl];
        yHeight=yHeight+40;

        contactNoTxt.layer.frame=CGRectMake(20,yHeight,160,30);
        [contactNoTxt removeFromSuperview];
        [contactNoTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [contactNoTxt setKeyboardType:UIKeyboardTypeDecimalPad];
        UIToolbar* numberToolbars = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbars.barStyle = UIBarStyleBlackTranslucent;
        numberToolbars.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [numberToolbars sizeToFit];
        contactNoTxt.inputAccessoryView = numberToolbars;

        [self.scrollview addSubview:contactNoTxt];
        yHeight=yHeight+40;

        operatingHourLbl.layer.frame=CGRectMake(20,yHeight,290,30);
        [operatingHourLbl removeFromSuperview];
        [operatingHourLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:operatingHourLbl];
        yHeight=yHeight+40;

        /*operatingHourLblFrm.layer.frame=CGRectMake(20,yHeight,60,30);
        [operatingHourLblFrm removeFromSuperview];
        [operatingHourLblFrm setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:operatingHourLblFrm];

        operatinghourTxtfrm.layer.frame=CGRectMake(65,yHeight,90,30);
        [operatinghourTxtfrm removeFromSuperview];
        [operatinghourTxtfrm setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        
        [self.scrollview addSubview:operatinghourTxtfrm];

        operatingHourLblTo.layer.frame=CGRectMake(165,yHeight,30,30);
        [operatingHourLblTo removeFromSuperview];
        [operatingHourLblTo setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:operatingHourLblTo];
        
        operatinghourTxtTo.layer.frame=CGRectMake(190,yHeight,100,30);
        [operatinghourTxtTo removeFromSuperview];
        [operatinghourTxtTo setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:operatinghourTxtTo];
        yHeight=yHeight+40;

        yHeight=yHeight+40;*/
        breakfastBtn.layer.frame=CGRectMake(20,yHeight,21,21);
        [breakfastBtn setTag:0];
        [breakfastBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [breakfastBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [breakfastBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[breakfastBtn removeFromSuperview];
        [self.scrollview addSubview:breakfastBtn];

        
        breakfastLbl.layer.frame=CGRectMake(55,yHeight,120,30);
        [breakfastLbl removeFromSuperview];
        [breakfastLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:breakfastLbl];

        lunchBtn.layer.frame=CGRectMake(170,yHeight,21,21);
        [lunchBtn setTag:1];
        [lunchBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [lunchBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [lunchBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [lunchBtn removeFromSuperview];
        [self.scrollview addSubview:lunchBtn];
        lunchLbl.layer.frame=CGRectMake(220,yHeight,120,30);
        //[lunchLbl removeFromSuperview];
        [lunchLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:lunchLbl];

        yHeight=yHeight+40;

        dinnerBtn.layer.frame=CGRectMake(20,yHeight,21,21);
        [dinnerBtn setTag:2];
        [dinnerBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [dinnerBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [dinnerBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[dinnerBtn removeFromSuperview];
        [self.scrollview addSubview:dinnerBtn];
        
        dinnerLbl.layer.frame=CGRectMake(55,yHeight,120,30);
        [dinnerLbl removeFromSuperview];
        [dinnerLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:dinnerLbl];

        fulldayBtn.layer.frame=CGRectMake(170,yHeight,21,21);
        [fulldayBtn setTag:3];
        [fulldayBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [fulldayBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
        [fulldayBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        //[fulldayBtn removeFromSuperview];
        [self.scrollview addSubview:fulldayBtn];
        
        fulldayLbl.layer.frame=CGRectMake(220,yHeight,120,30);
        [fulldayLbl removeFromSuperview];
        [fulldayLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:fulldayLbl];

        yHeight=yHeight+40;
        
        addressLbl.layer.frame=CGRectMake(20,yHeight,260,30);
        [addressLbl removeFromSuperview];
        [addressLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:addressLbl];
        yHeight=yHeight+40;

        
        addressTxt.layer.frame=CGRectMake(20,yHeight,240,30);
        [addressTxt removeFromSuperview];
        [addressTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:addressTxt];
        
        mapBtn.layer.frame=CGRectMake(265,yHeight,30,30);
        [mapBtn removeFromSuperview];
        [self.scrollview addSubview:mapBtn];

        yHeight=yHeight+40;

        latitudeTxt.layer.frame=CGRectMake(20,yHeight,130,30);
        [latitudeTxt removeFromSuperview];
        [latitudeTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:latitudeTxt];
        
        longitudeTxt.layer.frame=CGRectMake(165,yHeight,130,30);
        [longitudeTxt removeFromSuperview];
        [longitudeTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:longitudeTxt];
        yHeight=yHeight+40;

        descriptionLbl.layer.frame=CGRectMake(20,yHeight,290,30);
        [descriptionLbl removeFromSuperview];
        [descriptionLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:descriptionLbl];
        yHeight=yHeight+45;

        [descriptionView removeFromSuperview];
        descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(20,yHeight,280,height_msgTextView)];
        descriptionView.layer.borderColor=[[UIColor grayColor]CGColor];
        descriptionView.layer.borderWidth=0.5;
        descriptionView.layer.cornerRadius=8;
        descriptionView.scrollEnabled = YES;
        self.descriptionView.delegate = self;
        descriptionView.text=@"Comment....";
        descriptionView.font = [UIFont systemFontOfSize:18.0f];
        descriptionView.backgroundColor=[UIColor clearColor];
        [self.scrollview addSubview:descriptionView];
        yHeight=yHeight+height_msgTextView+10;
        
        imghorLine.layer.frame=CGRectMake(10,yHeight,290,2);
        [imghorLine removeFromSuperview];
        [self.scrollview addSubview:imghorLine];
         yHeight=yHeight+10;
        ratingLbl.layer.frame=CGRectMake(20,yHeight,290,30);
        [ratingLbl removeFromSuperview];
        [ratingLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:ratingLbl];
        yHeight=yHeight+30;
        tasteLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [tasteLbl removeFromSuperview];
        [self.scrollview addSubview:tasteLbl];
        yHeight=yHeight-10;

        [tasteRateView removeFromSuperview];
        tasteRateView=[[RateView alloc] init];
        tasteRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:tasteRateView];
        [self.scrollview bringSubviewToFront:tasteRateView];
        tasteRateView.delegate=self;
        
        yHeight=yHeight+60;
        priceLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [priceLbl removeFromSuperview];
        [priceLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:priceLbl];
        yHeight=yHeight-10;
        [priceRateView removeFromSuperview];
        priceRateView=[[RateView alloc] init];
        priceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:priceRateView];
        [self.scrollview bringSubviewToFront:priceRateView];
        priceRateView.delegate=self;
        yHeight=yHeight+60;
        hygieneLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [hygieneLbl removeFromSuperview];
        [self.scrollview addSubview:hygieneLbl];
        yHeight=yHeight-10;
        [hygiennseRateView removeFromSuperview];
        hygiennseRateView=[[RateView alloc] init];
        hygiennseRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:hygiennseRateView];
        [self.scrollview bringSubviewToFront:hygiennseRateView];
        hygiennseRateView.delegate=self;
        yHeight=yHeight+60;
        serviceLbl.layer.frame=CGRectMake(20,yHeight,80, 30);
        [serviceLbl removeFromSuperview];
        [self.scrollview addSubview:serviceLbl];
        yHeight=yHeight-10;
        [serviceRateView removeFromSuperview];
        serviceRateView=[[RateView alloc] init];
        serviceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:serviceRateView];
        [self.scrollview bringSubviewToFront:serviceRateView];
        serviceRateView.delegate=self;
        yHeight=yHeight+60;
        imghorLine1.layer.frame=CGRectMake(10,yHeight,290,2);
        [imghorLine1 removeFromSuperview];
        [self.scrollview addSubview:imghorLine1];
        yHeight=yHeight+10;
        submitBtn.layer.frame=CGRectMake(40,yHeight,220,50);
        [submitBtn removeFromSuperview];
        [self.scrollview addSubview:submitBtn];
        yHeight=yHeight+20;
        
        [mainFeedsTableView removeFromSuperview];
        [mainFeedsTableView setFrame:CGRectMake(0,yHeight, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.mainFeedsTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
        [self.scrollview addSubview:mainFeedsTableView];
        
    }
}
    self.tasteRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.tasteRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.tasteRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.tasteRateView.rating = 0;
    self.tasteRateView.editable = YES;
    self.tasteRateView.maxRating = 5;
    self.tasteRateView.delegate = self;
    
    //Hygiennse rate view
    self.hygiennseRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.hygiennseRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.hygiennseRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.hygiennseRateView.rating = 0;
    self.hygiennseRateView.editable = YES;
    self.hygiennseRateView.maxRating = 5;
    self.hygiennseRateView.delegate = self;
    
    //price rate view
    self.priceRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.priceRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.priceRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.priceRateView.rating = 0;
    self.priceRateView.editable = YES;
    self.priceRateView.maxRating = 5;
    self.priceRateView.delegate = self;
    
    //service rate view
    self.serviceRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.serviceRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.serviceRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.serviceRateView.rating = 0;
    self.serviceRateView.editable = YES;
    self.serviceRateView.maxRating = 5;
    self.serviceRateView.delegate = self;

    [breakfastBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [breakfastBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
    [breakfastBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lunchBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [lunchBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
    [lunchBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [dinnerBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [dinnerBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
    [dinnerBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [fulldayBtn setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [fulldayBtn setBackgroundImage:[UIImage imageNamed:@"OnbxCheck.png"] forState:UIControlStateSelected];
    [fulldayBtn addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [breakfastBtn setTag:0];
    [lunchBtn setTag:1];
    [dinnerBtn setTag:2];
    [fulldayBtn setTag:3];

    [priceTxt setKeyboardType:UIKeyboardTypeDecimalPad];
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    priceTxt.inputAccessoryView = numberToolbar;
    UIToolbar* numberToolbars = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbars.barStyle = UIBarStyleBlackTranslucent;
    numberToolbars.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                             [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbars sizeToFit];
    contactNoTxt.inputAccessoryView = numberToolbars;

    
    mainFeedsTableView.scrollEnabled=false;
    addressTxt.text=appDelegate.currentlocation;
    latitudeTxt.text=appDelegate.latitudeStrs;
    longitudeTxt.text=appDelegate.longitudeStrs;
    
    [self categoryList];
    datepicker.frame=CGRectMake(0, 350,self.scrollview.bounds.size.width, 200);
    [datepicker removeFromSuperview];
    datepicker.backgroundColor = [UIColor whiteColor];
    //datepicker.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    [self.view addSubview:datepicker];
    postImagesScrollview.contentSize= CGSizeMake(800,70);
}
-(void)radiobuttonSelected:(id)sender{
    
    switch ([sender tag]) {
        case 0:
            if([breakfastBtn isSelected]==YES)
            {
                [breakfastBtn setSelected:NO];
                breakfastStr=@"false";
                
            }
            else{
                [breakfastBtn setSelected:YES];
                breakfastStr=@"true";
            }
            
            break;
        case 1:
            if([lunchBtn isSelected]==YES)
            {
                [lunchBtn setSelected:NO];
                lunchStr=@"false";           }
            else{
                [lunchBtn setSelected:YES];
                lunchStr=@"true";
            }
            
            break;
        case 2:
            if([dinnerBtn isSelected]==YES)
            {
                [dinnerBtn setSelected:NO];
                dinerStr=@"false";
                
            }
            else{
                [dinnerBtn setSelected:YES];
                dinerStr=@"true";
            }
            
            break;
            
        case 3:
            if([fulldayBtn isSelected]==YES)
            {
                [fulldayBtn setSelected:NO];
                fulldayStr=@"false";
            }
            else{
                [fulldayBtn setSelected:YES];
                fulldayStr=@"true";
            }
            break;
            
            
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==contactNoTxt){
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        int length = [currentString length];
        if (length > 10) {
            return NO;
        }
        
    }
    int length = [self getLength:contactNoTxt.text];
    if(length == 12) {
        if(range.length == 0)
            return NO;
    }
    
    
    return YES;
}
-(NSString*)formatNumber:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = [mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
    }
    return mobileNumber;
}
-(int)getLength:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = [mobileNumber length];
    
    return length;
}

-(void)doneWithNumberPad{
    [priceTxt resignFirstResponder];
    [contactNoTxt resignFirstResponder];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    descriptionView.text = @"";
    descriptionView.textColor = [UIColor blackColor];
    return YES;
}
-(void)viewDidAppear:(BOOL)animated{
  
}
-(void) textViewDidChange:(UITextView *)textView
{
    if(descriptionView.text.length == 0){
        descriptionView.textColor = [UIColor lightGrayColor];
        descriptionView.text = @"Comment....";
        [descriptionView resignFirstResponder];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([descriptionView.text isEqualToString:@""]) {
        descriptionView.text = @"Comment....";
        descriptionView.textColor = [UIColor lightGrayColor]; //optional
    }
    [descriptionView resignFirstResponder];
}

-(IBAction)postAllData{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        /*int postimagescount=(int)[scrollviewImages count];
       UIImageView *img1=[scrollviewImages objectAtIndex:0];
        UIImageView *img2=[scrollviewImages objectAtIndex:1];
        UIImageView *img3=[scrollviewImages objectAtIndex:2];
        UIImageView *img4=[scrollviewImages objectAtIndex:3];
        z
        */
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    if ([restNameTxt.text isEqualToString:@""] || [categoryTxt.text isEqualToString:@""]){
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"All fields are mandatory.!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [activityIndicator stopAnimating];
    }else{
        if ([descriptionView.text isEqualToString:@"Comment...."]) {
            descriptionView.text=@"";
        }
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/newfoodpost.php?userid=%@&restaurantname=%@&price=%@&category=%@&contact=%@&breakfast=%@&lunch=%@&dinner=%@&fullday=%@&address=%@&lattitude=%@&longitude=%@&description=%@&tasterating=%f&pricerating=%f&hygienerating=%f&servicerating=%f",[prefs objectForKey:@"loggedin"],restNameTxt.text,priceTxt.text,categoryTxt.text,contactNoTxt.text,breakfastStr,lunchStr,dinerStr,fulldayStr,addressTxt.text,latitudeTxt.text,longitudeTxt.text,descriptionView.text,tasteRateView.rating,priceRateView.rating,hygiennseRateView.rating,serviceRateView.rating];
        NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                      length:[mydata length] encoding: NSUTF8StringEncoding];
        foodpostIdStr=content;
        NSUserDefaults *preffoodID = [NSUserDefaults standardUserDefaults];
        [preffoodID setObject:content forKey:@"foodId"];
        [preffoodID synchronize];

        if ([scrollviewImages count]==0) {
            UIAlertView *altView = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"Data uploaded successfully..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [altView show];
        }else{
        [self uploadImage];
        }
        
        [activityIndicator stopAnimating];
    }
        [activityIndicator stopAnimating];
}
   }
- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    NSLog(@"%f",rating);

}
-(void)popViewController{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}
-(IBAction)setLocationMap{
    PickLocationViewController *pvc=[[PickLocationViewController alloc]initWithNibName:@"PickLocationViewController" bundle:nil];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:pvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
    
}

-(IBAction)backAction{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
-(IBAction)pickImages:(id)sender{
           cav=[[CameraAlertView alloc] init];
        
        UIButton *galleryOption=[[UIButton alloc] initWithFrame:CGRectMake(0,50, 300,48)];
        [galleryOption setTitle:@"Gallery" forState:UIControlStateNormal];
        [galleryOption addTarget:self
                          action:@selector(galleryOption)
                forControlEvents:UIControlEventTouchUpInside];
        [galleryOption setBackgroundColor:[UIColor blackColor]];
        galleryOption.tag=1;
        [cav.demoView addSubview:galleryOption];
        
        UIButton *cameraOption=[[UIButton alloc] initWithFrame:CGRectMake(0,102, 300,50)];
        [cameraOption setTitle:@"Camera" forState:UIControlStateNormal];
        [cameraOption addTarget:self
                         action:@selector(cameraOption)
               forControlEvents:UIControlEventTouchUpInside];
        [cameraOption setBackgroundColor:[UIColor blackColor]];
        cameraOption.tag=1;
        [cav.demoView addSubview:cameraOption];
        
        UIButton *cancel=[[UIButton alloc] initWithFrame:CGRectMake(265,10,30,30)];
        [cancel setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
        [cancel addTarget:self action:@selector(closeAlert:)
         forControlEvents:UIControlEventTouchUpInside];
        [cav.demoView addSubview:cancel];
        [cav.demoView bringSubviewToFront:cancel];
        
        [cav show];
}
-(void)closeAlert:(id)sender{
    [cav close];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self galleryOption];
    } else if (buttonIndex == 1) {
        [self cameraOption];
    }
}
-(void)galleryOption{
    [cav close];

    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
    
}
-(void)cameraOption{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIAlertView *altView = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"Sorry, you do not have a camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [altView show];
        return;
    }
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
    [cav close];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        [controller setMediaTypes:[NSArray arrayWithObject:(NSString *)kUTTypeImage]];
        [controller setDelegate:self];
        
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:controller];
        [popover setDelegate:self];
        [popover presentPopoverFromRect:CGRectMake(455, 665, 30, 30) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
        popover.popoverContentSize = CGSizeMake(315, 500);
        // [controller release];
    }
    else
    {
        NSArray *mediaTypes = [UIImagePickerController
                               availableMediaTypesForSourceType:sourceType];
        UIImagePickerController *picker =
        [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [self presentModalViewController:picker animated:YES];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (uploadAlert.visible)
    {
        [self popViewController];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    [self dismissModalViewControllerAnimated:YES];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        CGSize newSize;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            newSize = CGSizeMake(768, 1024);
            imagHeg=635;
            canimgheg=630;
        }
        else {
            newSize  = CGSizeMake(320, 480);
            imagHeg=915;//whaterver size
            canimgheg=913;
        }
        

        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        image_=[[UIImage alloc] init];
        image_ = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
            imgview = [[UIImageView alloc]initWithFrame:CGRectMake(imageXValue,5,70,70)];
            [imgview removeFromSuperview];
            [imgview setImage:image_];
            [scrollviewImages addObject:image_];
            imgview.tag=scrollviewImages.count-1+100;
            
            cancelBtn=[[UIButton alloc] initWithFrame:CGRectMake(imageXValue+50, 5, 20, 20)];
            cancelBtn.tag=scrollviewImages.count-1+100;
            [cancelBtn setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
            cancelBtn.backgroundColor=[UIColor clearColor];
            [cancelBtn addTarget:self action:@selector(deleteImg:) forControlEvents:UIControlEventTouchUpInside];
            [self.postImagesScrollview addSubview:imgview];
            [self.postImagesScrollview addSubview:cancelBtn];
            [self.postImagesScrollview bringSubviewToFront:cancelBtn];
            
            if(scrollviewImages.count==10){
            UIAlertView *altView = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"You Can't add more than 10 Images!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [altView show];
        }else{
            imageXValue=imageXValue+75;
        }
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
    
    datepicker.frame=CGRectMake(0, 350,self.scrollview.bounds.size.width, 162);
    [datepicker removeFromSuperview];
    datepicker.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:datepicker];
    //[self performSelector:@selector(pushView) withObject:nil afterDelay:0.2];
}

-(void)deleteImg:(UIButton*)btn{
    int tags=btn.tag;
    UIImageView *imgView=[self.postImagesScrollview viewWithTag:tags-1+100];
    UIButton *cancelBtn_=[self.postImagesScrollview viewWithTag:tags-1+100];
    [imgView removeFromSuperview];
    
    [cancelBtn_ removeFromSuperview];
    [scrollviewImages removeObjectAtIndex:btn.tag-100];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        imagHeg=635;
        canimgheg=630;
    }
    else {
        imagHeg=915;//whaterver size
        canimgheg=913;
    }
    imageXValue=10;
    
    
    NSArray *viewsToRemove = [self.postImagesScrollview subviews];
    for (UIView *v in viewsToRemove) [v removeFromSuperview];
    
    postImagesScrollview.contentSize= CGSizeMake(800,70);
    int tagss=0;
    for (int count=0; count<scrollviewImages.count; count++) {
       
        imgview = [[UIImageView alloc]initWithFrame:CGRectMake(imageXValue,5,70,70)];
        [imgview removeFromSuperview];
        [imgview setImage:[scrollviewImages objectAtIndex:count]];
        imgview.tag=tagss+100;
        
        cancelBtn=[[UIButton alloc] initWithFrame:CGRectMake(imageXValue+50, 0, 20, 20)];
        cancelBtn.tag=tagss+100;
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
        cancelBtn.backgroundColor=[UIColor clearColor];
        [cancelBtn addTarget:self action:@selector(deleteImg:) forControlEvents:UIControlEventTouchUpInside];
        [self.postImagesScrollview addSubview:imgview];
        [self.postImagesScrollview addSubview:cancelBtn];
        [self.postImagesScrollview bringSubviewToFront:cancelBtn];
        imageXValue=imageXValue+75;
        tagss=tagss+1;
    }
}


-(void)uploadImage{
    NSUserDefaults *prefuserID = [NSUserDefaults standardUserDefaults];
    NSString *serverString=[[NSString alloc] initWithFormat:@"%@",[prefuserID objectForKey:@"userid"]];
    for (int count=0; count<[scrollviewImages count]; count++)
    {
        NSData *imageData = UIImageJPEGRepresentation([scrollviewImages objectAtIndex:count], 1.0);
        NSString *encodedString = [imageData base64Encoding];
        
    [self uploadImage:UIImageJPEGRepresentation([scrollviewImages objectAtIndex:count], 1.0) filename:foodpostIdStr];
        [activityIndicator stopAnimating];

    }
    
    uploadAlert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"Data uploaded successfully...!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [uploadAlert show];
}
- (BOOL)uploadImage:(NSData *)imageData filename:(NSString *)filename{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    
    NSString *urlString = @"http://www.pfh.com.my/pgfh/uploadimage_foodpost_iphone.php";
    NSLog(@"urlstring is %@",urlString);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //image filename
    [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n",filename]] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"return string %@",returnString);
    //[self clearAllData];
    [activityIndicator stopAnimating];
    
    
    //[self PostMessage:returnString];
    return true;
}
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
}

-(void)categoryList{
    categoryListArray=[[NSMutableArray alloc] init];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
    NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/getcategorylist.php"];
    
    NSLog(@"merchant list url %@",urlString);
    
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                  length:[mydata length] encoding: NSUTF8StringEncoding];
    NSLog(@"content %@",content);
    NSError *jsonError;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:mydata
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    categoryListArray = [[content componentsSeparatedByString:@"a1b2c3"] mutableCopy];
    [activityIndicator stopAnimating];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField==categoryTxt){
        [categoryTxt resignFirstResponder];
        [self.view endEditing:YES]; // added this in for case when keyboard was already on screen
        [self launchDialog];
    }
    else if (textField==operatinghourTxtfrm){
        toolbarstarttm.hidden=YES;
        datepicker.hidden=YES;
        toolbarendTm.hidden=YES;
        toolbar.hidden=YES;
        toolbarstarttm= [[UIToolbar alloc] initWithFrame:CGRectMake(0,320,self.view.bounds.size.width,44)];
        [toolbarstarttm setBarStyle:UIBarStyleBlackOpaque];
        UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                          style:UIBarButtonItemStyleBordered target:self action:@selector(doneButtonPressed)];
        toolbarstarttm.items = @[barButtonDone];
        barButtonDone.tintColor=[UIColor whiteColor];
        [self.view addSubview:toolbarstarttm];
        
        toolbarstarttm.hidden=NO;
        datepicker.hidden=NO;
        [operatinghourTxtfrm resignFirstResponder];
        
        return NO;
        
    }else if (textField==operatinghourTxtTo){
        
        toolbarendTm.hidden=YES;
        toolbar.hidden=YES;
        toolbarstarttm.hidden=YES;
        datepicker.hidden=YES;
        toolbarendTm= [[UIToolbar alloc] initWithFrame:CGRectMake(0,320,self.view.bounds.size.width,44)];
        [toolbarendTm setBarStyle:UIBarStyleBlackOpaque];
        UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                          style:UIBarButtonItemStyleBordered target:self action:@selector(donebtnpress)];
        toolbarendTm.items = @[barButtonDone];
        barButtonDone.tintColor=[UIColor whiteColor];
        [self.view addSubview:toolbarendTm];
        
        toolbarendTm.hidden=NO;
        datepicker.hidden=NO;
        [operatinghourTxtTo resignFirstResponder];
        
        return NO;
        
    }
    toolbarendTm.hidden=YES;
    toolbar.hidden=YES;
    toolbarstarttm.hidden=YES;
    datepicker.hidden=YES;

    return YES;
}
-(IBAction)doneButtonPressed{
    
    starttime= [[NSDateFormatter alloc] init];
    [starttime setDateFormat:@"hh:mm a"];
    NSString *st = [starttime stringFromDate:datepicker.date];
    operatinghourTxtfrm.text=[[NSString alloc]initWithFormat:@"%@",st];
    
    toolbar.hidden=YES;
    toolbarendTm.hidden=YES;
    toolbarstarttm.hidden=YES;
    datepicker.hidden=YES;
    datepicker.hidden=YES;
}
-(IBAction)donebtnpress{
    endtime= [[NSDateFormatter alloc] init];
    [endtime setDateFormat:@"hh:mm a"];
    NSString *et = [endtime stringFromDate:datepicker.date];
    operatinghourTxtTo.text=[[NSString alloc]initWithFormat:@"%@",et];
    toolbar.hidden=YES;
    toolbarendTm.hidden=YES;
    toolbarstarttm.hidden=YES;
    datepicker.hidden=YES;
    datepicker.hidden=YES;
}
- (void)launchDialog
{
    [categoryTxt resignFirstResponder];
    // Here we need to pass a full frame
    alertView = [[CustomIOS7AlertView alloc] init];
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    // Modify the parameters
    [alertView setDelegate:self];
    // You may use a Block, rather than a delegate.
    [alertView setUseMotionEffects:true];
    // And launch the dialog
    [alertView show];
}
- (UIView *)createDemoView
{
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 310)];
    [demoView setBackgroundColor:[UIColor blackColor]];
    demoView.layer.cornerRadius=5;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
    demoView.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    UIImageView *selectcategory=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [selectcategory setImage:[UIImage imageNamed:@"navigationbar.png"]];
    [demoView addSubview:selectcategory];
    
    UILabel *selectCategoryLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 2,150, 50)];
    selectCategoryLabel.textColor=[UIColor colorWithHexString:@"ffffff"];
    selectCategoryLabel.text=@"Choose Category";
    [selectCategoryLabel setFont:[UIFont boldSystemFontOfSize:17]];
    selectCategoryLabel.textAlignment=UITextAlignmentCenter;
    [demoView addSubview:selectCategoryLabel];
    
    UIButton *cancel=[[UIButton alloc] initWithFrame:CGRectMake(163,10,30,30)];
    [cancel setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(closeAlerts:)
     forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:cancel];
    [demoView bringSubviewToFront:cancel];
    
    
    UIScrollView *categoryScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 200, 260)];
    categoryScrollView.contentSize=CGSizeMake(200, [appDelegate.categoryListArray count]*45);
    int yValue=0;
    [appDelegate.categoryListArray removeObject:0];
    for (int count=0; count<[appDelegate.categoryListArray count]; count++) {
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, yValue, 200, 38)];
        if (count==0) {
            
        }else{
        [btn setTitle:[appDelegate.categoryListArray objectAtIndex:count] forState:UIControlStateNormal];
        btn.tag=count;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn addTarget:self action:@selector(buttonAction:)
      forControlEvents:UIControlEventTouchUpInside];
        [categoryScrollView addSubview:btn];
        yValue=yValue+4;
        UIImageView *lineLbl=[[UIImageView alloc] initWithFrame:CGRectMake(0, yValue,200,2)];
        lineLbl.backgroundColor = [UIColor whiteColor];
        [categoryScrollView addSubview:lineLbl];
        
        yValue=yValue+44;
        }
    }
    [demoView addSubview:categoryScrollView];
    
    return demoView;
}
-(void)closeAlerts:(id)sender{
    [alertView close];
}

-(void)buttonAction:(UIButton*)btn{
    categoryTxt.text=[appDelegate.categoryListArray objectAtIndex:btn.tag];
    [alertView close];

  }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
