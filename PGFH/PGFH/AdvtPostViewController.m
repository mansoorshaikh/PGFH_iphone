//
//  AdvtPostViewController.m
//  PGFH
//
//  Created by arvind on 9/7/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "AdvtPostViewController.h"
#import "AsyncImageView.h"
#import "UIColor+Expanded.h"
#import <QuartzCore/QuartzCore.h>
#import "NewPostViewController.h"
#import "Reachability.h"
#import "CategoryAlertView.h"
#import "ImageExtract.h"
@interface AdvtPostViewController ()
@property(nonatomic) double longitudeLabelS;
@property(nonatomic) double latitudeLabelS;

@end

@implementation AdvtPostViewController
@synthesize searchBtn,pasteBtn,fileBtn,commentBtn,userSearchBar,mainFeedsTableView,navBarImage,appDelegate,menuBtn,descriptionView,outletLbl,locationLbl,lattitudeLbl,longitudeLbl,contactLbl,photoLbl,descriptionLbl,outletTxt,locationTxt,lattideTxt,longitude,contactTxt,scrollview,mvc,aVO,pVO,cVO,mapView,locationManager,currentLocation,annotation,longitudeLabelS,latitudeLabelS,postImagesScrollview,commentLbl,imghorLine,imghorLine1,outletLblTxt,locationLblTxt,contactLblTxt,desricLblTxt,activityIndicator,characters,commentStr,alert,hvc,alertCmt,imghorLine2,oldHeight,alertView1,alertview_post,commentTextView,demoView,operatingHour,operatinghrdisplay;
- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate=[[UIApplication sharedApplication] delegate];

    self.navigationController.navigationBarHidden=YES;
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [activityIndicator stopAnimating];
    int height_msgTextView=150;
    
    int yHeight=height_msgTextView+10;
    scrollview.scrollEnabled=YES;
    AdvtPostViewController *advt;
       CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        advt=[[AdvtPostViewController alloc] initWithNibName:@"AdvtPostViewController~ipad" bundle:nil];
        
        [outletLblTxt setText:aVO.outlet];
        [locationLblTxt setText:aVO.location];
        [contactLblTxt setText:aVO.contact];
        [desricLblTxt setText:aVO.descriptions];
        latitudeLabelS=([aVO.lattitude doubleValue]);
        longitudeLabelS=([aVO.longitude doubleValue]);

        int imageXValue=30;
        
        for (int count=0; count<[aVO.pictureArray count]; count++) {
            pictureVO *pVOs=[aVO.pictureArray objectAtIndex:count];
            
            AsyncImageView *imgview = [[AsyncImageView alloc]initWithFrame:CGRectMake(imageXValue,40,70,70)];
            UIButton *transperentBtn=[[UIButton alloc] initWithFrame:CGRectMake(imageXValue, 45, 72, 72)];
            
            [imgview removeFromSuperview];
            [imgview loadImageFromURL:[NSURL URLWithString:pVOs.imgae]];
            if(imageXValue>=290){
                UIAlertView *altView = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"You Can't add more than 4 Images!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [altView show];
            }else{
                postImagesScrollview.contentSize=CGSizeMake(imageXValue+75,70);
                [postImagesScrollview addSubview:imgview];
                imageXValue=imageXValue+75;
                transperentBtn.backgroundColor=[UIColor clearColor];
                transperentBtn.tag=count;
                [transperentBtn addTarget:self action:@selector(pictureZoom:) forControlEvents:UIControlEventTouchUpInside];
                
                //[scrollviewImages addObject:imgview];
                [self.scrollview bringSubviewToFront:imgview];
                [self.scrollview addSubview:imgview];
                [self.scrollview addSubview:transperentBtn];
                [self.scrollview bringSubviewToFront:transperentBtn];
                
            }
        }

    }else
    {

    if(height>=480 && height<568){
        navBarImage.layer.frame=CGRectMake(0,0,self.view.bounds.size.width,60);
        [navBarImage removeFromSuperview];
        [navBarImage setImage:[UIImage imageNamed: @"navigationbar.png"]];
        [self.view addSubview:navBarImage];
        
        [menuBtn removeFromSuperview];
        menuBtn.layer.frame=CGRectMake(5,20,40,40);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"backarrow(1).png"] forState:UIControlStateNormal];
        [self.view addSubview:menuBtn];

    
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
        
        [mainFeedsTableView removeFromSuperview];
        [mainFeedsTableView setFrame:CGRectMake(0,640, self.view.bounds.size.width, self.view.bounds.size.height)];
        [self.scrollview addSubview:mainFeedsTableView];
        
        
    }else if(height>=568 && height<600){
        navBarImage.layer.frame=CGRectMake(0,0,self.view.bounds.size.width,60);
        [navBarImage removeFromSuperview];
        [navBarImage setImage:[UIImage imageNamed: @"navigationbar.png"]];
        [self.view addSubview:navBarImage];
        
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
        
        
    }
    
        [photoLbl removeFromSuperview];
        [photoLbl.layer setFrame:CGRectMake(20,10, 100,20)];
        [self.scrollview addSubview:photoLbl];
    
    outletLbl.layer.frame=CGRectMake(10,120,70,30);
    [outletLbl removeFromSuperview];
    [outletLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:outletLbl];
    
    outletLblTxt.layer.frame=CGRectMake(90,120,200,30);
    [outletLblTxt removeFromSuperview];
    [outletLblTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:outletLblTxt];
    
    locationLbl.layer.frame=CGRectMake(10,160,70,30);
    [locationLbl removeFromSuperview];
    [locationLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:locationLbl];
    
    locationLblTxt.layer.frame=CGRectMake(90,160,200,30);
    [locationLblTxt removeFromSuperview];
    [locationLblTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:locationLblTxt];
    
    contactLbl.layer.frame=CGRectMake(10,200,70,30);
    [contactLbl removeFromSuperview];
    [contactLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:contactLbl];
    
    contactLblTxt.layer.frame=CGRectMake(90,200,200,30);
    [contactLblTxt removeFromSuperview];
    [contactLblTxt setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:contactLblTxt];
        
        operatingHour.layer.frame=CGRectMake(10,240,150,30);
        [operatingHour removeFromSuperview];
        [operatingHour setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:operatingHour];
        
        operatinghrdisplay.layer.frame=CGRectMake(150,240,70,30);
        [operatinghrdisplay removeFromSuperview];
        [operatinghrdisplay setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
        [self.scrollview addSubview:operatinghrdisplay];

    
    descriptionLbl.layer.frame=CGRectMake(10,280,150,30);
    [descriptionLbl removeFromSuperview];
    [descriptionLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    [self.scrollview addSubview:descriptionLbl];
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:aVO.descriptions];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    int sizewidth;
    sizewidth=[self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+60;

    [desricLblTxt removeFromSuperview];
    [desricLblTxt.layer setFrame:CGRectMake(10,295, 270, sizewidth)];
    desricLblTxt.lineBreakMode = NSLineBreakByWordWrapping;
    desricLblTxt.numberOfLines = 0;
    desricLblTxt.layer.borderColor = [UIColor blackColor].CGColor;
    desricLblTxt.layer.borderWidth = 0;
    desricLblTxt.layer.cornerRadius = 5.0f;
    [desricLblTxt setClipsToBounds:YES];
    [self.scrollview addSubview:desricLblTxt];
  
    sizewidth=sizewidth+315;
    [imghorLine removeFromSuperview];
    [imghorLine.layer setFrame:CGRectMake(10,sizewidth, 300,1)];
    [self.scrollview addSubview:imghorLine];
    sizewidth=sizewidth+15;
   
    
        mapView.layer.frame=CGRectMake(0,sizewidth,self.scrollview.bounds.size.width,150);
        [mapView removeFromSuperview];
        [self.scrollview addSubview:mapView];

    int imagesize;
    sizewidth=sizewidth+90;
    imagesize=sizewidth;
    
    sizewidth=sizewidth+85;
    [imghorLine1 removeFromSuperview];
    [imghorLine1.layer setFrame:CGRectMake(10,sizewidth, 300,1)];
    [self.scrollview addSubview:imghorLine1];
    sizewidth=sizewidth+15;
    if (![aVO.lattitude isEqualToString:@""] && ![aVO.longitude isEqualToString:@""]) {
        UIButton *wazenavigation=[[UIButton alloc] initWithFrame:CGRectMake(0,sizewidth,310,50)];
        wazenavigation.backgroundColor=[UIColor clearColor];
        [wazenavigation setTitle:@"Take Me There!" forState:UIControlStateNormal];
        [wazenavigation setBackgroundImage:[UIImage imageNamed:@"submitbtnpost.png"] forState:UIControlStateNormal];
        [wazenavigation addTarget:self action:@selector(WazaMap) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:wazenavigation];
        sizewidth=sizewidth+65;

    }
    [commentLbl removeFromSuperview];
    [commentLbl.layer setFrame:CGRectMake(20,sizewidth, 100,20)];
    [self.scrollview addSubview:commentLbl];
    
    
    [commentBtn removeFromSuperview];
    [commentBtn.layer setFrame:CGRectMake(260,sizewidth-10,40,40)];
    [self.scrollview addSubview:commentBtn];
    sizewidth=sizewidth+30;

    [imghorLine2 removeFromSuperview];
    [imghorLine2.layer setFrame:CGRectMake(10,sizewidth, 300,1)];
    [self.scrollview addSubview:imghorLine2];
        
    sizewidth=sizewidth+15;
    oldHeight=sizewidth;
    float tableviewHeight=0;
    CGFloat widths = [UIScreen mainScreen].bounds.size.width;
    
    for (int count=0; count<[aVO.commentsArray count]; count++) {
        commentVO * CommentFeed=[aVO.commentsArray objectAtIndex:count];
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
        tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+80;
    }

    scrollview.contentSize = CGSizeMake(widths,720+tableviewHeight+50);
    scrollview.scrollEnabled=YES;
    mainFeedsTableView.layer.cornerRadius=5;
    if ([aVO.commentsArray count]<=7) {
        mainFeedsTableView.frame=CGRectMake(0,sizewidth,self.view.bounds.size.width,tableviewHeight+50);
    }else{
        mainFeedsTableView.frame=CGRectMake(0,sizewidth,self.view.bounds.size.width,tableviewHeight+15);
    }
    self.mainFeedsTableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
    [mainFeedsTableView removeFromSuperview];
    [self.scrollview addSubview:mainFeedsTableView];
    
    [mainFeedsTableView reloadData];
    

    locationLblTxt.lineBreakMode = NSLineBreakByWordWrapping;
    locationLblTxt.numberOfLines = 0;

    [outletLblTxt setText:aVO.outlet];
    [locationLblTxt setText:aVO.location];
    [contactLblTxt setText:aVO.contact];
    [desricLblTxt setText:aVO.descriptions];
    latitudeLabelS=([aVO.lattitude doubleValue]);
    longitudeLabelS=([aVO.longitude doubleValue]);
        
        int imageXValue=10;
        //postImagesScrollview.layer.frame=CGRectMake(10,0,650,85);

        if ([aVO.pictureArray count]<=4) {
            postImagesScrollview.contentSize= CGSizeMake(400,70);
            
        }else if ([aVO.pictureArray count]<=9){
            postImagesScrollview.contentSize= CGSizeMake(800,70);
            
        }

        for (int count=0; count<[aVO.pictureArray count]; count++) {
            pictureVO *pVOs=[aVO.pictureArray objectAtIndex:count];
            AsyncImageView *imgview = [[AsyncImageView alloc]initWithFrame:CGRectMake(imageXValue,45,70,70)];
            UIButton *transperentBtn=[[UIButton alloc] initWithFrame:CGRectMake(imageXValue,40, 72, 72)];
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

    mapView.delegate=self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate =self;
    [locationManager startUpdatingLocation];
    
    UILongPressGestureRecognizer* lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5;
    lpgr.delegate = self;
    [self getAllComments];
    
       }
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidLayoutSubviews{
    //postImagesScrollview.layer.frame=CGRectMake(10,0,650,85);
    
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

-(IBAction)categorylistAction{
    CategoryAlertView *cav=[[CategoryAlertView alloc] init];
    [cav show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //filterFeedArray=[[NSMutableArray alloc]init];
    if (alertCmt.visible)
    {
        mvc.searchString=@"";
        mvc.categoryString=[[NSString alloc]init];
        mvc.categoryString=[alertCmt buttonTitleAtIndex:buttonIndex];
        
        /*for (int count=0; count<[mainFeedtypeArray count]; count++){
         MainVo *mVO=[mainFeedtypeArray objectAtIndex:count];
         if ([mVO.feedType isEqualToString:@"foodpost"]) {
         NewPostVO*newvO=mVO.newpostVO;
         if([newvO.category isEqualToString:categoryStr]) {
         [filterFeedArray addObject:mVO];
         }
         }
         if ([categoryStr isEqualToString:@"All"]) {
         filterFeedArray=mainFeedtypeArray;
         }
         }*/
        [alertCmt dismissWithClickedButtonIndex:buttonIndex animated:YES];
        if (![mvc.categoryString isEqualToString:@"Cancel"]) {
            [self popViewController];
        }else{
            mvc.categoryString=@"";
        }
        
        //[mainFeedsTableView reloadData];
    }
    if (alert.visible)
    {
        commentStr=[[NSString alloc]init];
        commentStr=[alert textFieldAtIndex:0].text;
        [alert dismissWithClickedButtonIndex:buttonIndex animated:YES];
        [self postcomnt];
    }
}

-(void)postcomnt{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerts show];
    }else{
        if (![commentTextView.text isEqualToString:@""]){
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
            NSURL *url;
            NSMutableString *httpBodyString;
            httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"userid=%@&advtpostcomment=%@&advtpostid=%@",[prefs objectForKey:@"loggedin"],commentTextView.text,aVO.feedid]];
            NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/addcomment_advtpost.php"];
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
                    [aVO.commentsArray addObject:cVos];
        
                    for (int count=0; count<[aVO.commentsArray count]; count++) {
                        commentVO * CommentFeed=[aVO.commentsArray objectAtIndex:count];
                        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:CommentFeed.comment];
                        UIFont *font = [UIFont systemFontOfSize:14];
                        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
                        tableviewHeight=tableviewHeight+ [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-100]+100;
                    }
                    
                    scrollview.contentSize = CGSizeMake(width,650+tableviewHeight+50);
                    scrollview.scrollEnabled=YES;
                    mainFeedsTableView.layer.cornerRadius=5;
                    if ([aVO.commentsArray count]<=7) {
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
    pictureVO *pVOs=[aVO.pictureArray objectAtIndex:btn.tag];
    [pav.serverImage loadImageFromURL:[NSURL URLWithString:pVOs.imgae]];
    [pav show];

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
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    [manager stopUpdatingLocation];
    locationManager.delegate = nil;
    locationManager = nil;
    if (![aVO.lattitude isEqualToString:@""] && ![aVO.longitude isEqualToString:@""]) {
        
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
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return [aVO.commentsArray count]+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:MyIdentifier];
    NSUInteger row = [indexPath row];
    NSUInteger count = [aVO.commentsArray count];
    
    tableView.backgroundColor=[UIColor clearColor];
    if (indexPath.row==[aVO.commentsArray count]) {
        UIButton *clickMoreBtn=[[UIButton alloc] initWithFrame:CGRectMake(10,10,300,40)];
        [clickMoreBtn addTarget:self action:@selector(getAllComments) forControlEvents:UIControlEventTouchUpInside];
        [clickMoreBtn setTitle:@"Click Here for more comments" forState:UIControlStateNormal];
        [clickMoreBtn setBackgroundColor:[UIColor darkGrayColor]];
        clickMoreBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [clickMoreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clickMoreBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [cell.contentView addSubview:clickMoreBtn];
        
    }else{

    commentVO *cVOs=[aVO.commentsArray objectAtIndex:row];

    UILabel *userLblName=[[UILabel alloc] initWithFrame:CGRectMake(15,5,140,20)];
    [userLblName setFont:[UIFont fontWithName:@"Roboto-Regular" size:18]];
    userLblName.textColor=[UIColor colorWithHexString:@"1acfe4"];
    userLblName.text=cVOs.username;
    [cell.contentView addSubview:userLblName];
    
     NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:cVOs.comment];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    
    UILabel *cmtTextView=[[UILabel alloc] initWithFrame:CGRectMake(15,5,230,[self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString :cVOs.comment] andWidth:self.view.bounds.size.width-100]+80)];
    CGSize textViewSize = [cmtTextView sizeThatFits:CGSizeMake(cmtTextView.frame.size.width, cell.bounds.size.height)];
    //cmtTextView.contentSize = textViewSize;
    //cmtTextView.scrollEnabled=false;
    cmtTextView.backgroundColor=[UIColor clearColor];
    //[cmtTextView setEditable:false];
    cmtTextView.lineBreakMode = NSLineBreakByWordWrapping;
    cmtTextView.numberOfLines = 0;
    cell.backgroundColor=[UIColor clearColor];
    
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
    
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==[aVO.commentsArray count]) {
        return 100;
    }else{
    commentVO *cVOs=[aVO.commentsArray objectAtIndex:indexPath.row];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:cVOs.comment];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    return [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+60;
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
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/getalladvtpostcomments.php?advtpostid=%@",aVO.feedid];
        
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
        aVO.commentsArray=[[NSMutableArray alloc] init];
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
        [aVO.commentsArray addObject:cVO];
    }
}
-(void)closeAlert_postcomment:(id)sender{
    [alertview_post close];
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
