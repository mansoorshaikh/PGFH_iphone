//
//  CommentViewController.m
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "CommentViewController.h"
#import "AsyncImageView.h"
#import "UIColor+Expanded.h"
#import "NewPostViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Reachability.h"
#import "CategoryAlertView.h"
#import "ImageExtract.h"

@interface CommentViewController ()
@property(nonatomic) double longitudeLabelS;
@property(nonatomic) double latitudeLabelS;
@end

@implementation CommentViewController
@synthesize searchBtn,pasteBtn,fileBtn,userSearchBar,mainFeedsTableView,scrollview,postImagesScrollview,tasteRateView,priceRateView,hygiennseRateView,serviceRateView,navBarImage,mapView,locationManager,currentLocation,annotation,appDelegate,fromView,descriptionView,commentBtn,alertView1,alertview_post,commentTextView,demoView,ratingLbl,imghorLine,imghorLine1,imghorLine2,imghorLine3,menuBtn,restaurantLbl,addLbl,priceLbl,priceCostLbl,tasteLbl,pirceRateLbl,hygieneLbl,serviceLbl,photoLbl,descriptionLbl,commentLbl,latitudeLabelS,longitudeLabelS,img1,img2,img3,nVO,restaNameLbl,pVO,cVO,desricLblTxt,hvc,activityIndicator,characters,alert,commentStr,mvc,alertCmt,rmLbl,virticalimg,oldHeight,contactno,contNodis,operatingmainLbl,operaFrmLbl,operaTolbl,OperaHrsLbl,commenStroperatingHr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];

    [activityIndicator stopAnimating];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    /*if(yzheight>=568){
        scrollview.contentSize=CGSizeMake(width, yzheight+1350);
    }else{
        scrollview.contentSize=CGSizeMake(width, yzheight+900);
    }*/
   //scroll view size
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];

    int yHeight=10;
    scrollview.scrollEnabled=YES;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CommentViewController *comvc;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        int imageXValue=10;
        
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:nVO.descriptions];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
        
        int height_msgTextView;
        
        height_msgTextView =[self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+30;
        
        [desricLblTxt removeFromSuperview];
        desricLblTxt.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
        desricLblTxt.backgroundColor=[UIColor clearColor];
        desricLblTxt.lineBreakMode = NSLineBreakByWordWrapping;
        desricLblTxt.numberOfLines = 0;
        desricLblTxt.layer.borderColor = [UIColor blackColor].CGColor;
        desricLblTxt.layer.borderWidth = 0;
        desricLblTxt.layer.cornerRadius = 5.0f;
        [desricLblTxt setClipsToBounds:YES];
        [self.scrollview addSubview:desricLblTxt];

    }else{
    if(height>=480 && height<568){
        userSearchBar.layer.frame=CGRectMake(50,25,150, 30);
        [userSearchBar removeFromSuperview];
        UIToolbar* searchToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        searchToolbar.barStyle = UIBarStyleBlackTranslucent;
        searchToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [searchToolbar sizeToFit];
        userSearchBar.inputAccessoryView = searchToolbar;
        [self.view addSubview:userSearchBar];
        
        [searchBtn removeFromSuperview];
        searchBtn.layer.frame=CGRectMake(200,25, 30, 30);
        [searchBtn setBackgroundImage:[UIImage imageNamed:@"1439833044_search.png"] forState:UIControlStateNormal];
        [self.view addSubview:searchBtn];
        
        [pasteBtn removeFromSuperview];
        [pasteBtn.layer setFrame:CGRectMake(235,25, 30, 30)];
        [pasteBtn setBackgroundImage:[UIImage imageNamed:@"1439833094_paste.png"] forState:UIControlStateNormal];
        [self.view addSubview:pasteBtn];
        
        [fileBtn removeFromSuperview];
        [fileBtn.layer setFrame:CGRectMake(275,25, 30, 30)];
        [fileBtn setBackgroundImage:[UIImage imageNamed:@"1439833096_file.png"] forState:UIControlStateNormal];
        [self.view addSubview:fileBtn];
        
        mapView.layer.frame=CGRectMake(0,0,self.scrollview.bounds.size.width,150);
        [mapView removeFromSuperview];
        [self.scrollview addSubview:mapView];
        
        yHeight=160;
        restaurantLbl.layer.frame=CGRectMake(10,yHeight,100,25);
        [restaurantLbl removeFromSuperview];
        [restaurantLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:restaurantLbl];
        yHeight=yHeight+20;
        restaNameLbl.layer.frame=CGRectMake(10,yHeight,200,40);
        [restaNameLbl removeFromSuperview];
        restaNameLbl.lineBreakMode = NSLineBreakByWordWrapping;
        restaNameLbl.numberOfLines = 0;
        [restaNameLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        [self.scrollview addSubview:restaNameLbl];
        
        yHeight=yHeight+30;
        
        addLbl.layer.frame=CGRectMake(10,yHeight,180,80);
        [addLbl removeFromSuperview];
        [addLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        addLbl.lineBreakMode = NSLineBreakByWordWrapping;
        addLbl.numberOfLines = 0;
        //addLbl.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:addLbl];
        yHeight=yHeight+70;
        
        
        virticalimg.layer.frame=CGRectMake(200,163,1,110);
        [virticalimg removeFromSuperview];
        [self.scrollview addSubview:virticalimg];
        
        priceLbl.layer.frame=CGRectMake(220,180,280,30);
        [priceLbl removeFromSuperview];
        [priceLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:priceLbl];
        
        rmLbl.layer.frame=CGRectMake(220,115,30,30);
        [rmLbl removeFromSuperview];
        [rmLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:rmLbl];

        priceCostLbl.layer.frame=CGRectMake(250,115,50,30);
        [priceCostLbl removeFromSuperview];
        [priceCostLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
        [self.scrollview addSubview:priceCostLbl];
        
        
        imghorLine.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine removeFromSuperview];
        [self.scrollview addSubview:imghorLine];
        yHeight=yHeight+10;
        ratingLbl.layer.frame=CGRectMake(15,yHeight,280,30);
        [ratingLbl removeFromSuperview];
        [ratingLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:ratingLbl];
        yHeight=yHeight+30;
        tasteLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [tasteLbl removeFromSuperview];
        [tasteLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:tasteLbl];
        
        [tasteRateView removeFromSuperview];
        tasteRateView=[[RateView alloc] init];
        tasteRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:tasteRateView];
        [self.scrollview bringSubviewToFront:tasteRateView];
        tasteRateView.delegate=self;
        yHeight=yHeight+60;
        pirceRateLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [pirceRateLbl removeFromSuperview];
        [pirceRateLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:pirceRateLbl];
        
        [priceRateView removeFromSuperview];
        priceRateView=[[RateView alloc] init];
        priceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:priceRateView];
        [self.scrollview bringSubviewToFront:priceRateView];
        priceRateView.delegate=self;
        yHeight=yHeight+60;
        hygieneLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [hygieneLbl removeFromSuperview];
        [hygieneLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:hygieneLbl];
        
        [hygiennseRateView removeFromSuperview];
        hygiennseRateView=[[RateView alloc] init];
        hygiennseRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:hygiennseRateView];
        [self.scrollview bringSubviewToFront:hygiennseRateView];
        hygiennseRateView.delegate=self;
        yHeight=yHeight+60;
        
        serviceLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [serviceLbl removeFromSuperview];
        [serviceLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:serviceLbl];
        
        [serviceRateView removeFromSuperview];
        serviceRateView=[[RateView alloc] init];
        serviceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:serviceRateView];
        [self.scrollview bringSubviewToFront:serviceRateView];
        serviceRateView.delegate=self;
        yHeight=yHeight+60;
        
        imghorLine1.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine1 removeFromSuperview];
        [self.scrollview addSubview:imghorLine1];
        yHeight=yHeight+10;
        
        photoLbl.layer.frame=CGRectMake(20,yHeight,100,30);
        [photoLbl removeFromSuperview];
        [photoLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:photoLbl];
        yHeight=yHeight+35;
        img1.layer.frame=CGRectMake(5,yHeight,100,100);
        [img1 removeFromSuperview];
        [self.scrollview addSubview:img1];
        
        img2.layer.frame=CGRectMake(110,yHeight,100,100);
        [img2 removeFromSuperview];
        [self.scrollview addSubview:img2];
        
        img3.layer.frame=CGRectMake(210,yHeight,100,100);
        [img3 removeFromSuperview];
        [self.scrollview addSubview:img3];
        yHeight=yHeight+110;
        imghorLine2.layer.frame=CGRectMake(10,yHeight,290,1);
        [imghorLine2 removeFromSuperview];
        [self.scrollview addSubview:imghorLine2];
        yHeight=yHeight+10;
        descriptionLbl.layer.frame=CGRectMake(20,yHeight,150,30);
        [descriptionLbl removeFromSuperview];
        [descriptionLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:descriptionLbl];
        yHeight=yHeight+40;
        
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:nVO.descriptions];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
        
        int height_msgTextView;
        
        height_msgTextView =[self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+30;
        
        [desricLblTxt removeFromSuperview];
        desricLblTxt = [[UILabel alloc] initWithFrame:CGRectMake(20,yHeight,280,height_msgTextView)];
        desricLblTxt.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
        desricLblTxt.backgroundColor=[UIColor clearColor];
        desricLblTxt.lineBreakMode = NSLineBreakByWordWrapping;
        desricLblTxt.numberOfLines = 0;
        desricLblTxt.layer.borderColor = [UIColor blackColor].CGColor;
        desricLblTxt.layer.borderWidth = 0;
        desricLblTxt.layer.cornerRadius = 5.0f;
        [desricLblTxt setClipsToBounds:YES];
        [self.scrollview addSubview:desricLblTxt];
        
        yHeight=yHeight+height_msgTextView+10;
        imghorLine3.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine3 removeFromSuperview];
        [self.scrollview addSubview:imghorLine3];
        yHeight=yHeight+10;
        if (![nVO.lattitude isEqualToString:@""] && ![nVO.longitude isEqualToString:@""]) {
            UIButton *wazenavigation=[[UIButton alloc] initWithFrame:CGRectMake(0,yHeight,310,50)];
            wazenavigation.backgroundColor=[UIColor clearColor];
            [wazenavigation setTitle:@"Take Me There!" forState:UIControlStateNormal];
            [wazenavigation setBackgroundImage:[UIImage imageNamed:@"submitbtnpost.png"] forState:UIControlStateNormal];
            [wazenavigation addTarget:self action:@selector(WazaMap) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:wazenavigation];
            yHeight=yHeight+65;
        }
        commentLbl.layer.frame=CGRectMake(20,yHeight,150,30);
        [commentLbl removeFromSuperview];
        [commentLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:commentLbl];
        
        [commentBtn removeFromSuperview];
        [commentBtn.layer setFrame:CGRectMake(255,yHeight-10, 40, 40)];
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"1439838536_sign-add.png"] forState:UIControlStateNormal];
        [self.scrollview addSubview:commentBtn];
        
        yHeight=yHeight+50;
        oldHeight=yHeight;
        float tableviewHeight=0;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        for (int count=0; count<[nVO.commentsArray count]; count++) {
            commentVO * CommentFeed=[nVO.commentsArray objectAtIndex:count];
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
            UIFont *font = [UIFont systemFontOfSize:14];
            [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
            tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+80;
        }
        
        scrollview.contentSize = CGSizeMake(width,1000+tableviewHeight+50);
        scrollview.scrollEnabled=YES;
        mainFeedsTableView.layer.cornerRadius=5;
        if ([nVO.commentsArray count]<=7) {
            mainFeedsTableView.frame=CGRectMake(0,yHeight,self.view.bounds.size.width,tableviewHeight+50);
        }else{
            mainFeedsTableView.frame=CGRectMake(0,yHeight,self.view.bounds.size.width,tableviewHeight+15);
        }
        self.mainFeedsTableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
        [mainFeedsTableView removeFromSuperview];
        [self.scrollview addSubview:mainFeedsTableView];
        
        [mainFeedsTableView reloadData];

    }else if(height>=568 && height<600){
        
        [menuBtn removeFromSuperview];
        menuBtn.layer.frame=CGRectMake(5,20,40,40);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"backarrow(1).png"] forState:UIControlStateNormal];
        [self.view addSubview:menuBtn];
        
        userSearchBar.layer.frame=CGRectMake(35,25,170, 30);
        [userSearchBar removeFromSuperview];
        UIToolbar* searchToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        searchToolbar.barStyle = UIBarStyleBlackTranslucent;
        searchToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [searchToolbar sizeToFit];
        userSearchBar.inputAccessoryView = searchToolbar;
        [self.view addSubview:userSearchBar];
        
        [searchBtn removeFromSuperview];
        searchBtn.layer.frame=CGRectMake(200,25, 30, 30);
        [searchBtn setBackgroundImage:[UIImage imageNamed:@"1439833044_search.png"] forState:UIControlStateNormal];
        [self.view addSubview:searchBtn];
        
        [pasteBtn removeFromSuperview];
        [pasteBtn.layer setFrame:CGRectMake(235,25, 30, 30)];
        [pasteBtn setBackgroundImage:[UIImage imageNamed:@"1439833094_paste.png"] forState:UIControlStateNormal];
        [self.view addSubview:pasteBtn];
        
        [fileBtn removeFromSuperview];
        [fileBtn.layer setFrame:CGRectMake(275,25, 30, 30)];
        [fileBtn setBackgroundImage:[UIImage imageNamed:@"1439833096_file.png"] forState:UIControlStateNormal];
        [self.view addSubview:fileBtn];
        yHeight=10;
        photoLbl.layer.frame=CGRectMake(20,yHeight,100,30);
        [photoLbl removeFromSuperview];
        [photoLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:photoLbl];
        yHeight=yHeight+35;
        img1.layer.frame=CGRectMake(5,yHeight,100,100);
        [img1 removeFromSuperview];
        [self.scrollview addSubview:img1];
        
        img2.layer.frame=CGRectMake(110,yHeight,100,100);
        [img2 removeFromSuperview];
        [self.scrollview addSubview:img2];
        
        img3.layer.frame=CGRectMake(210,yHeight,100,100);
        [img3 removeFromSuperview];
        [self.scrollview addSubview:img3];
        
        yHeight=120;
        restaurantLbl.layer.frame=CGRectMake(10,yHeight,100,25);
        [restaurantLbl removeFromSuperview];
        [restaurantLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:restaurantLbl];
        yHeight=yHeight+20;
        restaNameLbl.layer.frame=CGRectMake(10,yHeight,200,40);
        [restaNameLbl removeFromSuperview];
        restaNameLbl.lineBreakMode = NSLineBreakByWordWrapping;
        restaNameLbl.numberOfLines = 0;
        [restaNameLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        [self.scrollview addSubview:restaNameLbl];

        yHeight=yHeight+30;

        addLbl.layer.frame=CGRectMake(10,yHeight,180,80);
        [addLbl removeFromSuperview];
        [addLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        addLbl.lineBreakMode = NSLineBreakByWordWrapping;
        addLbl.numberOfLines = 0;
        //addLbl.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:addLbl];
        yHeight=yHeight+55;
        contactno.layer.frame=CGRectMake(10,yHeight,100,40);
        [contactno removeFromSuperview];
        [contactno setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        //contactno.lineBreakMode = NSLineBreakByWordWrapping;
        //addLbl.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:contactno];
        
        contNodis.layer.frame=CGRectMake(100,yHeight,100,40);
        [contNodis removeFromSuperview];
        [contNodis setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        //contNodis.lineBreakMode = NSLineBreakByWordWrapping;
        //addLbl.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:contNodis];
        yHeight=yHeight+20;
        
        operatingmainLbl.layer.frame=CGRectMake(10,yHeight,180,30);
        [operatingmainLbl removeFromSuperview];
        [operatingmainLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        operatingmainLbl.lineBreakMode = NSLineBreakByWordWrapping;
        //addLbl.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:operatingmainLbl];
        yHeight=yHeight+20;

        operaFrmLbl.layer.frame=CGRectMake(10,yHeight,200,40);
        [operaFrmLbl removeFromSuperview];
        operaFrmLbl.lineBreakMode = NSLineBreakByWordWrapping;
        operaFrmLbl.numberOfLines = 0;
        [operaFrmLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        [self.scrollview addSubview:operaFrmLbl];
        
        rmLbl.layer.frame=CGRectMake(240,175,30,30);
        [rmLbl removeFromSuperview];
        [rmLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:rmLbl];
        
        yHeight=yHeight+30;

        virticalimg.layer.frame=CGRectMake(220,140,1,150);
        [virticalimg removeFromSuperview];
        [self.scrollview addSubview:virticalimg];
        
        priceLbl.layer.frame=CGRectMake(240,140,280,30);
        [priceLbl removeFromSuperview];
        [priceLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:priceLbl];
        
        priceCostLbl.layer.frame=CGRectMake(270,175,50,30);
        [priceCostLbl removeFromSuperview];
        [priceCostLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
        [self.scrollview addSubview:priceCostLbl];

        imghorLine.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine removeFromSuperview];
        [self.scrollview addSubview:imghorLine];
        yHeight=yHeight+10;
        ratingLbl.layer.frame=CGRectMake(15,yHeight,280,30);
        [ratingLbl removeFromSuperview];
        [ratingLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:ratingLbl];
        yHeight=yHeight+30;
        tasteLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [tasteLbl removeFromSuperview];
        [tasteLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:tasteLbl];
        
        [tasteRateView removeFromSuperview];
        tasteRateView=[[RateView alloc] init];
        tasteRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:tasteRateView];
        [self.scrollview bringSubviewToFront:tasteRateView];
        tasteRateView.delegate=self;
        yHeight=yHeight+60;
        pirceRateLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [pirceRateLbl removeFromSuperview];
        [pirceRateLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:pirceRateLbl];
        
        [priceRateView removeFromSuperview];
        priceRateView=[[RateView alloc] init];
        priceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:priceRateView];
        [self.scrollview bringSubviewToFront:priceRateView];
        priceRateView.delegate=self;
        yHeight=yHeight+60;
        hygieneLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [hygieneLbl removeFromSuperview];
        [hygieneLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:hygieneLbl];
        
        [hygiennseRateView removeFromSuperview];
        hygiennseRateView=[[RateView alloc] init];
        hygiennseRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:hygiennseRateView];
        [self.scrollview bringSubviewToFront:hygiennseRateView];
        hygiennseRateView.delegate=self;
        yHeight=yHeight+60;

        serviceLbl.layer.frame=CGRectMake(20,yHeight,70,30);
        [serviceLbl removeFromSuperview];
        [serviceLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:serviceLbl];

        [serviceRateView removeFromSuperview];
        serviceRateView=[[RateView alloc] init];
        serviceRateView.frame=CGRectMake(95,yHeight,209,53);
        [self.scrollview addSubview:serviceRateView];
        [self.scrollview bringSubviewToFront:serviceRateView];
        serviceRateView.delegate=self;
        yHeight=yHeight+60;

        imghorLine1.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine1 removeFromSuperview];
        [self.scrollview addSubview:imghorLine1];
        yHeight=yHeight+10;

        mapView.layer.frame=CGRectMake(0,yHeight,self.scrollview.bounds.size.width,140);
        [mapView removeFromSuperview];
        [self.scrollview addSubview:mapView];
        
              yHeight=yHeight+140;
        imghorLine2.layer.frame=CGRectMake(10,yHeight,290,1);
        [imghorLine2 removeFromSuperview];
        [self.scrollview addSubview:imghorLine2];
        yHeight=yHeight+10;
        descriptionLbl.layer.frame=CGRectMake(20,yHeight,150,30);
        [descriptionLbl removeFromSuperview];
        [descriptionLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:descriptionLbl];
        yHeight=yHeight+40;
        
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:nVO.descriptions];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];

        int height_msgTextView;

       height_msgTextView =[self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+30;
        
        [desricLblTxt removeFromSuperview];
        desricLblTxt = [[UILabel alloc] initWithFrame:CGRectMake(20,yHeight,280,height_msgTextView)];
        desricLblTxt.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
        desricLblTxt.backgroundColor=[UIColor clearColor];
        desricLblTxt.lineBreakMode = NSLineBreakByWordWrapping;
        desricLblTxt.numberOfLines = 0;
        desricLblTxt.layer.borderColor = [UIColor blackColor].CGColor;
        desricLblTxt.layer.borderWidth = 0;
        desricLblTxt.layer.cornerRadius = 5.0f;
        [desricLblTxt setClipsToBounds:YES];
        [self.scrollview addSubview:desricLblTxt];
        
        yHeight=yHeight+height_msgTextView+10;
        imghorLine3.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine3 removeFromSuperview];
        [self.scrollview addSubview:imghorLine3];
        yHeight=yHeight+10;
        if (![nVO.lattitude isEqualToString:@""] && ![nVO.longitude isEqualToString:@""]) {
            UIButton *wazenavigation=[[UIButton alloc] initWithFrame:CGRectMake(0,yHeight,310,50)];
            wazenavigation.backgroundColor=[UIColor clearColor];
            [wazenavigation setTitle:@"Take Me There!" forState:UIControlStateNormal];
            [wazenavigation setBackgroundImage:[UIImage imageNamed:@"submitbtnpost.png"] forState:UIControlStateNormal];
            [wazenavigation addTarget:self action:@selector(WazaMap) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:wazenavigation];
            yHeight=yHeight+65;
        }
        commentLbl.layer.frame=CGRectMake(20,yHeight,150,30);
        [commentLbl removeFromSuperview];
        [commentLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:commentLbl];

        [commentBtn removeFromSuperview];
        [commentBtn.layer setFrame:CGRectMake(255,yHeight-10, 40, 40)];
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"1439838536_sign-add.png"] forState:UIControlStateNormal];
        [self.scrollview addSubview:commentBtn];

        yHeight=yHeight+50;
        oldHeight=yHeight;
        float tableviewHeight=0;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;

        for (int count=0; count<[nVO.commentsArray count]; count++) {
            commentVO * CommentFeed=[nVO.commentsArray objectAtIndex:count];
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
            UIFont *font = [UIFont systemFontOfSize:14];
            [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
            tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+80;
        }
        
        scrollview.contentSize = CGSizeMake(width,1050+tableviewHeight+150);
        scrollview.scrollEnabled=YES;
        mainFeedsTableView.layer.cornerRadius=5;
        if ([nVO.commentsArray count]<=7) {
            mainFeedsTableView.frame=CGRectMake(0,yHeight,self.view.bounds.size.width,tableviewHeight+50);
        }else{
            mainFeedsTableView.frame=CGRectMake(0,yHeight,self.view.bounds.size.width,tableviewHeight+15);
        }
        self.mainFeedsTableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
        [mainFeedsTableView removeFromSuperview];
        [self.scrollview addSubview:mainFeedsTableView];
        
        [mainFeedsTableView reloadData];

    }
    else{
        float tableviewHeight=0;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        for (int count=0; count<[nVO.commentsArray count]; count++) {
            commentVO * CommentFeed=[nVO.commentsArray objectAtIndex:count];
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
            UIFont *font = [UIFont systemFontOfSize:14];
            [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
            tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+80;
        }

        scrollview.contentSize = CGSizeMake(width,1000+tableviewHeight+50);
        scrollview.scrollEnabled=YES;
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:nVO.descriptions];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];

        int height_msgTextView;
        
        height_msgTextView =[self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+30;
        
        [desricLblTxt removeFromSuperview];
        desricLblTxt = [[UILabel alloc] initWithFrame:CGRectMake(20,650,280,height_msgTextView)];
        desricLblTxt.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
        desricLblTxt.backgroundColor=[UIColor clearColor];
        desricLblTxt.lineBreakMode = NSLineBreakByWordWrapping;
        desricLblTxt.numberOfLines = 0;
        desricLblTxt.layer.borderColor = [UIColor blackColor].CGColor;
        desricLblTxt.layer.borderWidth = 0;
        desricLblTxt.layer.cornerRadius = 5.0f;
        [desricLblTxt setClipsToBounds:YES];
        [self.scrollview addSubview:desricLblTxt];
        yHeight=650;
        yHeight=yHeight+height_msgTextView+10;
        imghorLine3.layer.frame=CGRectMake(10,yHeight,300,1);
        [imghorLine3 removeFromSuperview];
        [self.scrollview addSubview:imghorLine3];
        yHeight=yHeight+10;
        if (![nVO.lattitude isEqualToString:@""] && ![nVO.longitude isEqualToString:@""]) {
            UIButton *wazenavigation=[[UIButton alloc] initWithFrame:CGRectMake(0,yHeight,310,50)];
            wazenavigation.backgroundColor=[UIColor clearColor];
            [wazenavigation setTitle:@"Take Me There!" forState:UIControlStateNormal];
            [wazenavigation setBackgroundImage:[UIImage imageNamed:@"submitbtnpost.png"] forState:UIControlStateNormal];
            [wazenavigation addTarget:self action:@selector(WazaMap) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:wazenavigation];
            yHeight=yHeight+65;
        }
        commentLbl.layer.frame=CGRectMake(20,yHeight,150,30);
        [commentLbl removeFromSuperview];
        [commentLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
        [self.scrollview addSubview:commentLbl];
        
        [commentBtn removeFromSuperview];
        [commentBtn.layer setFrame:CGRectMake(255,yHeight-10, 40, 40)];
        [commentBtn setBackgroundImage:[UIImage imageNamed:@"1439838536_sign-add.png"] forState:UIControlStateNormal];
        [self.scrollview addSubview:commentBtn];
        
        yHeight=yHeight+50;
        oldHeight=yHeight;
        
        for (int count=0; count<[nVO.commentsArray count]; count++) {
            commentVO * CommentFeed=[nVO.commentsArray objectAtIndex:count];
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
            UIFont *font = [UIFont systemFontOfSize:14];
            [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
            tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+80;
        }
        
        scrollview.contentSize = CGSizeMake(width,1050+tableviewHeight+50);
        scrollview.scrollEnabled=YES;
        mainFeedsTableView.layer.cornerRadius=5;
        if ([nVO.commentsArray count]<=7) {
            mainFeedsTableView.frame=CGRectMake(0,yHeight,self.view.bounds.size.width,tableviewHeight+50);
        }else{
            mainFeedsTableView.frame=CGRectMake(0,yHeight,self.view.bounds.size.width,tableviewHeight+15);
        }
        self.mainFeedsTableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
        [mainFeedsTableView removeFromSuperview];
        [self.scrollview addSubview:mainFeedsTableView];
        
        [mainFeedsTableView reloadData];

       /* [mainFeedsTableView removeFromSuperview];
        [mainFeedsTableView setFrame:CGRectMake(0,640, self.view.bounds.size.width, self.view.bounds.size.height)];
        //self.mainFeedsTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
        [self.scrollview addSubview:mainFeedsTableView];*/
    }
}
    self.tasteRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.tasteRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.tasteRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.tasteRateView.rating = 0;
    self.tasteRateView.editable = NO;
    self.tasteRateView.maxRating = 5;
    self.tasteRateView.delegate = self;
    //Hygiennse rate view
    self.hygiennseRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.hygiennseRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.hygiennseRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.hygiennseRateView.rating = 0;
    self.hygiennseRateView.editable = NO;
    self.hygiennseRateView.maxRating = 5;
    self.hygiennseRateView.delegate = self;
    //price rate view
    self.priceRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.priceRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.priceRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.priceRateView.rating = 0;
    self.priceRateView.editable = NO;
    self.priceRateView.maxRating = 5;
    self.priceRateView.delegate = self;
    //service rate view
    self.serviceRateView.notSelectedImage = [UIImage imageNamed:@"1439837979_star_grey.png"];
    self.serviceRateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.serviceRateView.fullSelectedImage = [UIImage imageNamed:@"1439837979_star.png"];
    self.serviceRateView.rating = 0;
    self.serviceRateView.editable = NO;
    self.serviceRateView.maxRating = 5;
    self.serviceRateView.delegate = self;

    mainFeedsTableView.scrollEnabled=false;
    descriptionView.editable=NO;
     
    [restaNameLbl setText:nVO.restaurantname];
    [addLbl setText:nVO.address];
    [contNodis setText:nVO.contactno];
    NSMutableArray *myStrings = [[NSMutableArray alloc]init];
    commenStroperatingHr=[[NSString alloc]init];
    if ([nVO.breakfast isEqualToString:@"true"]) {
        [myStrings addObject:@"Breakfast"];
    }
    if ([nVO.lunch isEqualToString:@"true"]) {
        [myStrings addObject:@"Lunch"];
    }
    if ([nVO.dinner isEqualToString:@"true"]) {
        [myStrings addObject:@"Dinner"];
    }
    if ([nVO.fullyday isEqualToString:@"true"]) {
        [myStrings addObject:@"Fullday"];
    }
    commenStroperatingHr = [myStrings componentsJoinedByString:@","];

    [operaFrmLbl setText:commenStroperatingHr];
    [operaTolbl setText:nVO.operatingTo];
    [priceCostLbl setText:nVO.price];
    [desricLblTxt setText:nVO.descriptions];
    tasteRateView.rating=([nVO.tasterating floatValue]);
    priceRateView.rating =([nVO.pricerating floatValue]);
    hygiennseRateView.rating =([nVO.hygienerating floatValue]);
    serviceRateView.rating = ([nVO.servicerating floatValue]);
    
             // ASSIGNING THE BUTTON WITH IMAGE TO BACK BAR BUTTON
   
        latitudeLabelS=([nVO.lattitude doubleValue]);
        longitudeLabelS=([nVO.longitude doubleValue]);
        locationManager = [[CLLocationManager alloc] init];
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        if([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
            NSUInteger code = [CLLocationManager authorizationStatus];
            if (code == kCLAuthorizationStatusNotDetermined && ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
                // choose one request according to your business.
                if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                    [locationManager requestAlwaysAuthorization];
                } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                    [locationManager  requestWhenInUseAuthorization];
                } else {
                    NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
                }
            }
        }
        [locationManager startUpdatingLocation];
        
        self.navigationController.navigationBar.translucent = NO;
        appDelegate=[[UIApplication sharedApplication] delegate];
        
        mapView.delegate=self;
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate =self;
        [locationManager startUpdatingLocation];
    
  
    
    UILongPressGestureRecognizer* lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5;
    lpgr.delegate = self;
    
    [self getAllComments];
    [activityIndicator stopAnimating];

    // Do any additional setup after loading the view from its nib.
}
-(IBAction)WazaMap{
    [self navigateToLatitude:latitudeLabelS longitude:longitudeLabelS];
}
- (void) navigateToLatitude:(double)latitude longitude:(double)longitude
{
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:@"waze://"]]) {
        
        // Waze is installed. Launch Waze and start navigation
        NSString *urlStr =
        [NSString stringWithFormat:@"waze://?ll=%f,%f&navigate=yes&z=10",
         latitude, longitude];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        
    } else {
        
        // Waze is not installed. Launch AppStore to install Waze app
        [[UIApplication sharedApplication] openURL:[NSURL
                                                    URLWithString:@"http://itunes.apple.com/us/app/id323229106"]];
    }
}
-(void)doneWithNumberPad{
    [self.userSearchBar resignFirstResponder];
}
-(void)viewDidLayoutSubviews{
   //postImagesScrollview.layer.frame=CGRectMake(10,0,800,100);
    int imageXValue=10;
    
    if ([nVO.pictureArray count]<=4) {
        postImagesScrollview.contentSize= CGSizeMake(350,70);

    }else if ([nVO.pictureArray count]<=9){
        postImagesScrollview.contentSize= CGSizeMake(750,70);

    }
    for (int count=0; count<[nVO.pictureArray count]; count++) {
        pictureVO *pVOs=[nVO.pictureArray objectAtIndex:count];
        AsyncImageView *imgview = [[AsyncImageView alloc]initWithFrame:CGRectMake(imageXValue,10,70,70)];
        UIButton *transperentBtn=[[UIButton alloc] initWithFrame:CGRectMake(imageXValue,10, 72, 72)];
        [imgview removeFromSuperview];
        [imgview loadImageFromURL:[NSURL URLWithString:pVOs.imgae]];
        
        imgview.backgroundColor=[UIColor clearColor];

        [postImagesScrollview addSubview:imgview];
        imageXValue=imageXValue+75;
        //[scrollviewImages addObject:imgview];
        transperentBtn.backgroundColor=[UIColor clearColor];
        transperentBtn.tag=count;
        [transperentBtn addTarget:self action:@selector(pictureZoom:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.postImagesScrollview bringSubviewToFront:imgview];
        [self.postImagesScrollview addSubview:imgview];
        [self.postImagesScrollview addSubview:transperentBtn];
        [self.postImagesScrollview bringSubviewToFront:transperentBtn];
        [self.scrollview addSubview:postImagesScrollview];
        [self.scrollview bringSubviewToFront:postImagesScrollview];
    }

}
-(void)viewDidAppear:(BOOL)animated{
   
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if(scrollView == postImagesScrollview)
        scrollview.scrollEnabled = NO;
    else
        scrollview.scrollEnabled = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView == postImagesScrollview)
    {
        if(postImagesScrollview.contentOffset.x + postImagesScrollview.frame.size.width == postImagesScrollview.contentSize.width)
        {
            scrollview.scrollEnabled = NO;
        }
        else
        {
            scrollview.scrollEnabled = YES;
        }
    }
}
-(IBAction)categorylistAction{
    CategoryAlertView *cav=[[CategoryAlertView alloc] init];
    [cav show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //filterFeedArray=[[NSMutableArray alloc]init];
    if (alert.visible)
    {
        mvc.searchString=@"";
    mvc.categoryString=[[NSString alloc]init];
    mvc.categoryString=[alert buttonTitleAtIndex:buttonIndex];
 
       [alert dismissWithClickedButtonIndex:buttonIndex animated:YES];
        if (![mvc.categoryString isEqualToString:@"Cancel"]) {
            [self popViewController];
        }else{
            mvc.categoryString=@"";
        }

    }
    if (alertCmt.visible)
    {
    commentStr=[[NSString alloc]init];
    commentStr=[alertCmt textFieldAtIndex:0].text;
    [alertCmt dismissWithClickedButtonIndex:buttonIndex animated:YES];
    [self postcomnt];
    }
}

-(IBAction)newPostAction{
    NewPostViewController *npvc;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        
        npvc=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController" bundle:nil];
    }else{
        npvc=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController~ipad" bundle:nil];
        
    }
    [self.navigationController pushViewController:npvc animated:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
       [descriptionView resignFirstResponder];
}
-(IBAction)popViewController{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // The user clicked the [X] button or otherwise cleared the text.
    if([searchText length] == 0) {
        [searchBar performSelector: @selector(resignFirstResponder)
                        withObject: nil
                        afterDelay: 0.1];
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if(![userSearchBar.text isEqualToString:@""])
    {
        mvc.categoryString=@"";
        mvc.searchString=[[NSString alloc]init];
        mvc.searchString=userSearchBar.text;
        [self popViewController];
    }
    
    [self.userSearchBar resignFirstResponder];
    
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    userSearchBar.showsCancelButton = NO;
    [self.userSearchBar resignFirstResponder];
}
-(IBAction)SearchBtnAction{
    mvc.searchString=userSearchBar.text;
    if (![mvc.searchString isEqualToString:@""]) {
        [self popViewController];
    }
}
-(IBAction)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    [manager stopUpdatingLocation];
    locationManager.delegate = nil;
    locationManager = nil;
     if (![nVO.lattitude isEqualToString:@""] && ![nVO.longitude isEqualToString:@""]) {
        
         CLLocationCoordinate2D currentLocations = {(latitudeLabelS),(longitudeLabelS)};
         MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(currentLocations, 100000, 100000);
         [mapView setRegion:region];
         
         self.annotation = [[MKPointAnnotation alloc] init];
         [self.annotation setCoordinate:currentLocations];
         [self.annotation setTitle:@"Current Location"];
         [self.mapView addAnnotation:annotation];
         CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
         [geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:latitudeLabelS longitude:longitudeLabelS] completionHandler:^(NSArray *placemarks, NSError *error) {
             for (CLPlacemark * placemark in placemarks) {
                 NSString *locality = [placemark name];
                 NSLog(@"locality %@",locality);
                 if([placemark locality]!=nil)
                     appDelegate.currentlocation=[NSString stringWithFormat:@"%@,%@,%@",[placemark locality],[placemark name],[placemark country]];
                 else
                     appDelegate.currentlocation=[NSString stringWithFormat:@"%@,%@",[placemark name],[placemark country]];
             }
             [self.mapView removeAnnotation:self.annotation];
             [self.annotation setTitle:appDelegate.currentlocation];
             [self.mapView addAnnotation:self.annotation];
         }];

     }else{
         latitudeLabelS=[appDelegate.latitudeStrs doubleValue];
         longitudeLabelS=[appDelegate.longitudeStrs doubleValue];
     
    CLLocationCoordinate2D currentLocations = {(latitudeLabelS),(longitudeLabelS)};
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(currentLocations, 100000, 100000);
    [mapView setRegion:region];
    
    self.annotation = [[MKPointAnnotation alloc] init];
    [self.annotation setCoordinate:currentLocations];
    [self.annotation setTitle:@"Current Location"];
         CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
         [geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:latitudeLabelS longitude:longitudeLabelS] completionHandler:^(NSArray *placemarks, NSError *error) {
             for (CLPlacemark * placemark in placemarks) {
                 NSString *locality = [placemark name];
                 NSLog(@"locality %@",locality);
                 if([placemark locality]!=nil)
                     appDelegate.currentlocation=[NSString stringWithFormat:@"%@,%@,%@",[placemark locality],[placemark name],[placemark country]];
                 else
                     appDelegate.currentlocation=[NSString stringWithFormat:@"%@,%@",[placemark name],[placemark country]];
             }
             [self.mapView removeAnnotation:self.annotation];
             [self.annotation setTitle:appDelegate.currentlocation];
             //[self.mapView addAnnotation:self.annotation];
         }];
     }
  }

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([self.annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *reuseId = @"pin";
    MKPinAnnotationView *pav = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (pav == nil)
    {
        pav = [[MKPinAnnotationView alloc] initWithAnnotation:self.annotation reuseIdentifier:reuseId];
        pav.draggable = YES; // Right here baby!
        pav.canShowCallout = YES;
    }
    else
    {
        pav.annotation = self.annotation;
    }
    return pav;
}

- (void)mapView:(MKMapView *)mapView
 annotationView:(MKAnnotationView *)annotationView
didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState
{
    if (newState == MKAnnotationViewDragStateEnding) // you can check out some more states by looking at the docs
    {
        CLLocationCoordinate2D droppedAt = annotationView.annotation.coordinate;
        NSLog(@"dropped at %f,%f", droppedAt.latitude, droppedAt.longitude);
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        [geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:droppedAt.latitude longitude:droppedAt.longitude] completionHandler:^(NSArray *placemarks, NSError *error) {
            for (CLPlacemark * placemark in placemarks) {
                NSString *locality = [placemark name];
                NSLog(@"locality %@",locality);
                if([placemark locality]!=nil)
                    appDelegate.currentlocation=[NSString stringWithFormat:@"%@,%@,%@",[placemark locality],[placemark name],[placemark country]];
                else
                    appDelegate.currentlocation=[NSString stringWithFormat:@"%@,%@",[placemark name],[placemark country]];
            }
            [self.mapView removeAnnotation:self.annotation];
            [self.annotation setTitle:appDelegate.currentlocation];
            [self.mapView addAnnotation:self.annotation];
        }];
    }
}

-(void)donepicklocation{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CLLocationCoordinate2D coordinate = [mapView convertPoint:[gestureRecognizer locationInView:mapView] toCoordinateFromView:mapView];
        [mapView setCenterCoordinate:coordinate animated:YES];
    }
}
-(void)clearAllData{
    tasteRateView.rating=0;
    priceRateView.rating=0;
    hygiennseRateView.rating=0;
    serviceRateView.rating=0;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    NSLog(@"%f",rating);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postcomnt{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerts show];
    }

else{
    if (![commentTextView.text isEqualToString:@""]){
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        NSURL *url;
        NSMutableString *httpBodyString;
        httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"userid=%@&foodpostcomment=%@&foodpostid=%@",[prefs objectForKey:@"loggedin"],commentTextView.text,nVO.feedid]];
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/addcomment_foodpost.php"];
        url=[[NSURL alloc] initWithString:urlString];
        NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
        
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSISOLatin1StringEncoding]];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            // your data or an error will be ready here
            if (error)
            {
                NSLog(@"Failed to submit request");
                [activityIndicator stopAnimating];
            }
            else
            {
                NSString *content = [[NSString alloc]  initWithBytes:[data bytes]
                                                              length:[data length] encoding: NSUTF8StringEncoding];
                [alertview_post close];
                
                UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"Comment added successfully.!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alerts show];
                float tableviewHeight=0;
                CGFloat width = [UIScreen mainScreen].bounds.size.width;
                NSMutableArray *commentresponse=[[NSMutableArray alloc]init];
                commentresponse = [[content componentsSeparatedByString:@"a1b2c3"] mutableCopy];
                commentVO *cVos=[[commentVO alloc]init];
                cVos.commentId=[commentresponse objectAtIndex:0];
                cVos.username=[commentresponse objectAtIndex:1];
                cVos.datecmt=[commentresponse objectAtIndex:2];
                cVos.comment=[commentresponse objectAtIndex:3];
                [nVO.commentsArray addObject:cVos];
                
                for (int count=0; count<[nVO.commentsArray count]; count++) {
                    commentVO * CommentFeed=[nVO.commentsArray objectAtIndex:count];
                    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
                    UIFont *font = [UIFont systemFontOfSize:14];
                    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
                    tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+100;
                }
                
                scrollview.contentSize = CGSizeMake(width,950+tableviewHeight+50);
                scrollview.scrollEnabled=YES;
                mainFeedsTableView.layer.cornerRadius=5;
                if ([nVO.commentsArray count]<=7) {
                    mainFeedsTableView.frame=CGRectMake(0,oldHeight,self.view.bounds.size.width,tableviewHeight+50);
                }else{
                    mainFeedsTableView.frame=CGRectMake(0,oldHeight,self.view.bounds.size.width,tableviewHeight+15);
                }
                self.mainFeedsTableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
                [mainFeedsTableView removeFromSuperview];
                [self.scrollview addSubview:mainFeedsTableView];
                
                [mainFeedsTableView reloadData];
                
                [activityIndicator stopAnimating];
            }
        }];
    }else{
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"Please enter comment!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerts show];
    }
}
[activityIndicator stopAnimating];
}
-(void)pictureZoom:(UIButton*)btn{
    ImageExtract *pav=[[ImageExtract alloc] init];
     pictureVO *pVOs=[nVO.pictureArray objectAtIndex:btn.tag];
    [pav.serverImage loadImageFromURL:[NSURL URLWithString:pVOs.imgae]];
    [pav show];
}   
-(void)closeAlert_postcomment:(id)sender{
    [alertview_post close];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = [nVO.commentsArray count]+1;

    return count;    //count number of row from counting array hear cataGorry is An Array
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:MyIdentifier];
    NSUInteger row = [indexPath row];
    NSUInteger count = [nVO.commentsArray count];
    int heightsize;
    tableView.backgroundColor=[UIColor clearColor];
    if (indexPath.row==[nVO.commentsArray count]) {
        UIButton *clickMoreBtn=[[UIButton alloc] initWithFrame:CGRectMake(10,10,300,40)];
        [clickMoreBtn addTarget:self action:@selector(getAllComments) forControlEvents:UIControlEventTouchUpInside];
        [clickMoreBtn setTitle:@"Click Here for more comments" forState:UIControlStateNormal];
        [clickMoreBtn setBackgroundColor:[UIColor darkGrayColor]];
        clickMoreBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [clickMoreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clickMoreBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [cell.contentView addSubview:clickMoreBtn];

    }else{
    commentVO *cVOs=[nVO.commentsArray objectAtIndex:indexPath.row];

   
    UILabel *userLblName=[[UILabel alloc] initWithFrame:CGRectMake(20,5,140,20)];
    [userLblName setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
    userLblName.textColor=[UIColor colorWithHexString:@"1acfe4"];
    userLblName.text=cVOs.username;
    [cell.contentView addSubview:userLblName];
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:cVOs.comment];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    
    UILabel *cmtTextView=[[UILabel alloc] initWithFrame:CGRectMake(20,10,230,[self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString :cVOs.comment] andWidth:self.view.bounds.size.width-100]+80)];
    CGSize textViewSize = [cmtTextView sizeThatFits:CGSizeMake(cmtTextView.frame.size.width, cell.bounds.size.height)];
    //cmtTextView.contentSize = textViewSize;
    //cmtTextView.scrollEnabled=false;
    cmtTextView.backgroundColor=[UIColor clearColor];
    //[cmtTextView setEditable:false];
    cell.backgroundColor=[UIColor clearColor];
    cmtTextView.lineBreakMode = NSLineBreakByWordWrapping;
    cmtTextView.numberOfLines = 0;
    if(![cVOs.comment isEqualToString:@""] && cVOs.comment!=nil)
    {
        [cmtTextView setAttributedText:title];
    }else {
        [cmtTextView setText:@"N/A"];
    }
    [cell.contentView addSubview:cmtTextView];
    
    UILabel *dateTimeLblName;
    dateTimeLblName=[[UILabel alloc] init];
    dateTimeLblName.frame=CGRectMake(cell.bounds.size.width-120,5,150,20);
    dateTimeLblName.textAlignment=UITextAlignmentCenter;
    NSDateFormatter *fbdateFormat = [[NSDateFormatter alloc] init];
    NSString *fbdate=[NSString stringWithFormat:@"%@",[[cVOs.datecmt componentsSeparatedByString:@""] objectAtIndex:0]];
    [fbdateFormat setDateFormat:@"dd-MM-yyyy"];
    NSDate *facebookdate = [fbdateFormat dateFromString:fbdate];
    //[fbdateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    fbdateFormat.timeZone = [NSTimeZone systemTimeZone];
    NSDate *today=[fbdateFormat dateFromString:[fbdateFormat stringFromDate:[NSDate date]]];
    long seconds= [self timeDifference:today ToDate:facebookdate];
    long diffinsec=seconds%60;
    diffinsec=seconds/60;
    long minutes=seconds/60;
    diffinsec=diffinsec/60;
    long hours=minutes/60;
    diffinsec=diffinsec/24;
    long days=hours/24;
    long month=days/30;
    long year=month/12;
    if(hours<=1){
        dateTimeLblName.text=@"Recently";
    }else if(hours<=24){
        dateTimeLblName.text=[NSString stringWithFormat:@"%ld hrs",hours];
    }else if(hours<=48){
        dateTimeLblName.text=[NSString stringWithFormat:@"Yesterday"];
    }else if(days<=30){
        dateTimeLblName.text=[NSString stringWithFormat:@"%ld Days Ago",days];
    }else if(month<=12){
        dateTimeLblName.text=[NSString stringWithFormat:@"%ld Days Ago",month];
    }else if(year>=0){
        dateTimeLblName.text=[NSString stringWithFormat:@"%ld Days Ago",year];
    }
    [dateTimeLblName setFont:[UIFont fontWithName:@"Roboto-Regular" size:12]];
    dateTimeLblName.textColor=[UIColor colorWithHexString:@"060000"];
    [cell.contentView addSubview:dateTimeLblName];
    
   
    heightsize=[self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+25;
        
    } 
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSUInteger count = [nVO.commentsArray count];

     if (indexPath.row==[nVO.commentsArray count]) {
          return 100;
     }else{
    commentVO *cVOs=[nVO.commentsArray objectAtIndex:indexPath.row];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:cVOs.comment];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    return [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+80;
     }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
- (int)timeDifference:(NSDate *)fromDate ToDate:(NSDate *)toDate{
    NSTimeInterval distanceBetweenDates = [fromDate timeIntervalSinceDate:toDate];
    return distanceBetweenDates;
}
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
}

-(void)getAllComments{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
        
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/getallfoodpostcomments.php?foodpostid=%@",nVO.feedid];
        
        NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        NSXMLParser *timetableParser = [[NSXMLParser alloc] initWithData:mydata];
        [timetableParser setDelegate:self];
        [timetableParser setShouldProcessNamespaces:NO];
        [timetableParser setShouldReportNamespacePrefixes:NO];
        [timetableParser setShouldResolveExternalEntities:NO];
        
        [timetableParser parse];
        [self.mainFeedsTableView reloadData];
        [activityIndicator stopAnimating];
        NSLog(@"user >>> %@", urlString);
        
    }
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"comments"]){
        nVO.commentsArray=[[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"comment"]){
        cVO=[[commentVO alloc] init];
    }
    else if([elementName isEqualToString:@"commentid"]){
        cVO.commentId=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"commenttext"]){
        cVO.comment=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"commentusername"]){
        cVO.username=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"commentdate"]){
        cVO.datecmt=[[NSString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSString* sItemNameDecorated = [string stringByReplacingOccurrencesOfString:@"â€“" withString:@"-"];
    characters=[[NSString alloc] initWithString:sItemNameDecorated];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"commentid"]){
        cVO.commentId=characters;
    }else if([elementName isEqualToString:@"commentusername"]){
        cVO.username=characters;
    }else if([elementName isEqualToString:@"commenttext"]){
        cVO.comment=characters;
    }else if([elementName isEqualToString:@"commentdate"]){
        cVO.datecmt=characters;
        [nVO.commentsArray addObject:cVO];
    }
}
- (UIView *)createDemoView
{
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 165)];
    [demoView setBackgroundColor:[UIColor whiteColor]];
    demoView.layer.cornerRadius=11;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
    demoView.layer.borderColor=[[UIColor whiteColor]CGColor];
    UIButton *topButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    [topButton setTitle:@"Comments" forState:UIControlStateNormal];
    [topButton setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forState:UIControlStateNormal];
    topButton.layer.cornerRadius=15;
    [topButton setFont:[UIFont boldSystemFontOfSize:20]];
    [demoView addSubview:topButton];
    
    UIButton *cancel=[[UIButton alloc] initWithFrame:CGRectMake(260,10,30, 30)];
    [cancel setBackgroundImage:[UIImage imageNamed:@"cancel1.png"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(closeAlert_postcomment:)
     forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:cancel];
    [demoView bringSubviewToFront:cancel];
    
    
    commentTextView=[[UITextView alloc] initWithFrame:CGRectMake(25,50, 250,60)];
    //commentTextView.text =@"Comment";
    commentTextView.layer.cornerRadius=5;
    
    [demoView addSubview:commentTextView];
    
    
    UIButton *register_ok_Button=[[UIButton alloc] initWithFrame:CGRectMake(0,125,300,40)];
    [register_ok_Button setTitle:@"Ok" forState:UIControlStateNormal];
    [register_ok_Button addTarget:self
                           action:@selector(closeAlertComment:)
                 forControlEvents:UIControlEventTouchUpInside];
    [register_ok_Button setBackgroundColor:[UIColor blackColor]];
    register_ok_Button.tag=1;
    [demoView addSubview:register_ok_Button];
    
    return demoView;
}
-(void)closeAlertComment:(id)sender{
    
    if([commentTextView.text isEqualToString:@""]){
        [alertview_post close];
        [self postCommentWithoutCmt];
    }else{
        [self postcomnt];
    }
}

- (UIView *)createViewWithoutCmtPost
{
    demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 140)];
    [demoView setBackgroundColor:[UIColor whiteColor]];
    demoView.layer.cornerRadius=11;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
    demoView.layer.borderColor=[[UIColor whiteColor]CGColor];
    UIButton *topButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    [topButton setTitle:@"PGFH" forState:UIControlStateNormal];
    [topButton setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forState:UIControlStateNormal];
    topButton.layer.cornerRadius=15;
    [topButton setFont:[UIFont boldSystemFontOfSize:20]];
    [demoView addSubview:topButton];
    
    UITextView *cmtMessage=[[UITextView alloc] initWithFrame:CGRectMake(0, 50,300,40)];
    cmtMessage.text=@"Please enter comment to proceed !!!";
    cmtMessage.editable=false;
    cmtMessage.font=[UIFont systemFontOfSize:20];
    cmtMessage.backgroundColor=[UIColor blackColor];
    cmtMessage.textColor=[UIColor whiteColor];
    [demoView addSubview:cmtMessage];
    
    
    UIButton *register_ok_Button=[[UIButton alloc] initWithFrame:CGRectMake(0,95,300,40)];
    [register_ok_Button setTitle:@"OK" forState:UIControlStateNormal];
    [register_ok_Button addTarget:self
                           action:@selector(closeAlert:)
                 forControlEvents:UIControlEventTouchUpInside];
    [register_ok_Button setBackgroundColor:[UIColor blackColor]];
    register_ok_Button.tag=1;
    [demoView addSubview:register_ok_Button];
    
    
    
    return demoView;
}
-(void)closeAlert:(id)sender{
    [alertView1 close];
}

-(void)postCommentWithoutCmt
{
    alertView1 = [[CustomIOS7AlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView1 setContainerView:[self createViewWithoutCmtPost]];
    
    // Modify the parameters
    
    [alertView1 setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertView1 setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView_, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView_ tag]);
        [alertView_ close];
    }];
    
    [alertView1 setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView1 show];
}



-(IBAction)NewcommentPost{
    alertview_post = [[CustomIOS7AlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertview_post setContainerView:[self createDemoView]];
    
    // Modify the parameters
    
    [alertview_post setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertview_post setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView_, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView_ tag]);
        [alertView_ close];
    }];
    
    [alertview_post setUseMotionEffects:true];
    
    // And launch the dialog
    [alertview_post show];
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
