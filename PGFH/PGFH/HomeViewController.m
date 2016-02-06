   //
//  HomeViewController.m
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "HomeViewController.h"
#import "AsyncImageView.h"
#import "UIColor+Expanded.h"
#import "CommentViewController.h"
#import "NewPostViewController.h"
#import "SWRevealViewController.h"
#import "CategoryAlertView.h"
#import "MainVo.h"
#import "Reachability.h"
#import "NewPostVO.h"
#import "AdvtPostVO.h"
#import "AnnouncementVO.h"
#import "commentVO.h"
#import "pictureVO.h"
#import "AdvtPostViewController.h"
#import "pictureVO.h"
#import "commentVO.h"
#import "UITableView+DragLoad.h"

@protocol FrameObservingViewDelegate <NSObject>

@property (nonatomic,assign) id<FrameObservingViewDelegate>delegate;
@end

@interface HomeViewController ()<UITableViewDragLoadDelegate,UITableViewDataSource,FrameObservingViewDelegate>
@property(nonatomic) double longitudeLabelS;
@property(nonatomic) double latitudeLabelS;

@end

@implementation HomeViewController
@synthesize searchBtn,pasteBtn,fileBtn,userSearchBar,mainFeedsTableView,menuBtn,navigationImg,appDelegate,mainFeedtypeArray,feedPostArray,advtPostArray,annonPostArray,activityIndicator,mainFeedVO,newpostVO,advtpostVO,annouFeedVO,characters,commentStr,comVO,picVO,filterFeedArray,searchDisplayController,isFiltered,searchcount,feedcount,currentFeedArray,categoryListArray,categoryStr,alert,searchString,counst,locationManager,mapView,currentLocation,annotation,fromView,latitudeLabelS,longitudeLabelS,currentElement,currentElementData;
- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationController.navigationBarHidden=YES;
    [activityIndicator stopAnimating];
    appDelegate=[[UIApplication sharedApplication] delegate]; 
    mainFeedtypeArray=[[NSMutableArray alloc]init];
    //categoryStr=[[NSString alloc]init];
    feedPostArray=[[NSMutableArray alloc]init];
    advtPostArray=[[NSMutableArray alloc]init];
    annonPostArray=[[NSMutableArray alloc]init];
    commentStr=[[NSString alloc]init];
    currentFeedArray=[[NSMutableArray alloc]init];
    [mainFeedsTableView setDragDelegate:self refreshDatePermanentKey:@"FriendList"];
    mainFeedsTableView.showLoadMoreView = YES;
    mainFeedtypeArray=[[NSMutableArray alloc]init];

    commentStr=@"comments";
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];

    counst=0;
    HomeViewController *homevc;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        homevc=[[HomeViewController alloc] initWithNibName:@"HomeViewController~ipad" bundle:nil];
        
        
    }else
    {

    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(height>=480 && height<568){
        [menuBtn removeFromSuperview];
        menuBtn.layer.frame=CGRectMake(10,25,35,35);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuBtn];

        userSearchBar.layer.frame=CGRectMake(50, 27,150, 30);
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
        [mainFeedsTableView setFrame:CGRectMake(0, 70, self.view.bounds.size.width, self.view.bounds.size.height-65)];
        [self.view addSubview:mainFeedsTableView];
    }else if(height>=568 && height<600){
        
        
        [navigationImg removeFromSuperview];
        navigationImg.layer.frame=CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        [navigationImg setImage:[UIImage imageNamed: @"navigationbar.png"]];
        [self.view addSubview:navigationImg];
        
        [menuBtn removeFromSuperview];
        menuBtn.layer.frame=CGRectMake(5,25,35,35);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view bringSubviewToFront:menuBtn];
        [self.view addSubview:menuBtn];
        
        userSearchBar.layer.frame=CGRectMake(40, 27,160, 30);
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
        [mainFeedsTableView setFrame:CGRectMake(0, 70, self.view.bounds.size.width, self.view.bounds.size.height-65)];
        [self.view addSubview:mainFeedsTableView];
    }
    }
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        NSUInteger code = [CLLocationManager authorizationStatus];
        if (code == kCLAuthorizationStatusNotDetermined && ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                [self.locationManager requestAlwaysAuthorization];
            } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationManager  requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
    }
    [self.locationManager startUpdatingLocation];
//userSearchBar.showsCancelButton = YES;
    [userSearchBar setDelegate:self];

        [menuBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([appDelegate.pushStr isEqualToString:@"yes"]) {
        appDelegate.pushStr=@"no";
        [self getAllData];
    }
    [self categoryList];
    // Do any additional setup after loading the view from its nib.
}

-(void)doneWithNumberPad{
    [self.userSearchBar resignFirstResponder];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    [manager stopUpdatingLocation];
    locationManager.delegate = nil;
    locationManager = nil;
    longitudeLabelS=newLocation.coordinate.longitude;
    latitudeLabelS=newLocation.coordinate.latitude;
    appDelegate.latitudeStrs=[NSString stringWithFormat:@"%f", latitudeLabelS];
    appDelegate.longitudeStrs=[NSString stringWithFormat:@"%f", longitudeLabelS];
    CLLocationCoordinate2D currentLocations = newLocation.coordinate;
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(currentLocations, 100000, 100000);
    [mapView setRegion:region];
    
    self.annotation = [[MKPointAnnotation alloc] init];
    [self.annotation setCoordinate:currentLocations];
    [self.annotation setTitle:@"Current Location"];
    
    [self.mapView addAnnotation:annotation];
    
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:currentLocations.latitude longitude:currentLocations.longitude] completionHandler:^(NSArray *placemarks, NSError *error) {
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

-(void)viewDidAppear:(BOOL)animated{
    if (![searchString isEqualToString:@""]) {
        userSearchBar.text=searchString;
        counst=0;
        //[self getAllData];
        
    }else{
        //counst=[mainFeedtypeArray count];
        counst=0;

    }
    if (![categoryStr isEqualToString:@""]) {
        counst=0;
        //[self getAllData];

    }else{
        //counst=[mainFeedtypeArray count];
        counst=0;

    }
    [self getAllData];
    [mainFeedsTableView reloadData];
    counst=0;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)filterCategories{
    CategoryAlertView *cav=[[CategoryAlertView alloc] init];
    [cav show];
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

#pragma mark - Search Implementation

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearching = YES;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
   

    if (![searchBar isFirstResponder]) {
         mainFeedtypeArray=[[NSMutableArray alloc]init];
        [self getAllData];
            [mainFeedsTableView reloadData];
    }
    else if ([searchText length] == 0) {
        mainFeedtypeArray=[[NSMutableArray alloc]init];
        [self getAllData];
        [mainFeedsTableView reloadData];

    }

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.userSearchBar resignFirstResponder];
    NSLog(@"Cancel clicked");
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar {
    [self.userSearchBar resignFirstResponder];
    if([userSearchBar.text isEqualToString:@""])
    {
        filterFeedArray=[[NSMutableArray alloc]init];
        filterFeedArray=mainFeedtypeArray;
    }
    
    [mainFeedsTableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar {
    NSLog(@"Search Clicked");
    [self.userSearchBar resignFirstResponder];

    if(userSearchBar.text  !=nil || ![userSearchBar.text isEqualToString:@""]) {
        categoryStr=@"";
        mainFeedtypeArray=[[NSMutableArray alloc]init];
        [self getAllData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
}

-(IBAction)SearchBtnAction{
    [self.userSearchBar resignFirstResponder];
    if(userSearchBar.text!=nil || ![userSearchBar.text isEqualToString:@""]){
        [self getAllData];
    }
    
}
-(void)getAllData{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSString *urlString;

    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [activityIndicator stopAnimating];
    }else{
        if (![userSearchBar.text isEqualToString:@""]) {
            [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
            urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/feedsearch.php?currentcount=%d&searchstring=%@",[mainFeedtypeArray count],userSearchBar.text];
            
        }else if (![categoryStr isEqualToString:@""] && ![categoryStr isEqualToString:@"All"]){
            
            [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
            urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/feedsearch_category.php?currentcount=%d&category=%@",[mainFeedtypeArray count],categoryStr];
        }else
        {
            urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/feedlist.php?currentcount=%d",[mainFeedtypeArray count]];
        }
        NSURL *url      = [NSURL URLWithString:urlString];
        NSError *error;
        NSString * dataString = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"]] encoding:NSUTF8StringEncoding error:&error];
        [dataString stringByReplacingOccurrencesOfString:@"&" withString:@"and"];
        NSData *mydata = [dataString dataUsingEncoding:NSUTF8StringEncoding];
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
    characters=[[NSString alloc]init];
    self.currentElement=[[NSString alloc] initWithString:elementName];
    if([elementName isEqualToString:@"feeddetails"]){

    }
    else if([elementName isEqualToString:@"feed"]){
        mainFeedVO=[[MainVo alloc] init];
        newpostVO=[[NewPostVO alloc] init];
        advtpostVO=[[AdvtPostVO alloc] init];
        annouFeedVO=[[AnnouncementVO alloc] init];
        picVO=[[pictureVO alloc]init];
        comVO=[[commentVO alloc ]init];
    }
    else if([elementName isEqualToString:@"feedtype"]){
        mainFeedVO.feedType=[[NSString alloc] init];
    }
    else if([elementName isEqualToString:@"feedtype"]){
        newpostVO.feedType=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"foodpostid"]){
        newpostVO.feedid=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"restaurantname"]){
        newpostVO.restaurantname=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"price"]){
        newpostVO.price=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"category"]){
        newpostVO.category=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"address"]){
        newpostVO.address=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"lattitude"]){
        newpostVO.lattitude=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"longitude"]){
        newpostVO.longitude=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"description"]){
        newpostVO.descriptions=[[NSString alloc] init];
        currentElementData=[[NSMutableString alloc] init];
    }else if([elementName isEqualToString:@"tasterating"]){
        newpostVO.tasterating=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"pricerating"]){
        newpostVO.pricerating=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"hygienerating"]){
        newpostVO.hygienerating=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"servicerating"]){
        newpostVO.servicerating=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"contact"]){
        newpostVO.contactno=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"from_operatinghrs"]){
        newpostVO.operatingFrm=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"to_operatinghrs"]){
        newpostVO.operatingTo=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"feedpostdate"]){
        newpostVO.feedpostdate=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"breakfast"]){
        newpostVO.breakfast=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"lunch"]){
        newpostVO.lunch=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"dinner"]){
        newpostVO.dinner=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"fullday"]){
        newpostVO.fullyday=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"pictures"]){
        newpostVO.pictureArray=[[NSMutableArray alloc] init];
    }else if([elementName isEqualToString:@"comments"]){
        newpostVO.commentsArray=[[NSMutableArray alloc] init];
    }
    
     if([elementName isEqualToString:@"feedtype"]){
        advtpostVO.feedtype=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"advtpostid"]){
        advtpostVO.feedid=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"outlet"]){
        advtpostVO.outlet=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"location"]){
        advtpostVO.location=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"lattitude"]){
        advtpostVO.lattitude=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"longitude"]){
        advtpostVO.longitude=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"contact"]){
        advtpostVO.contact=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"description"]){
        advtpostVO.descriptions=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"feedpostdate"]){
        advtpostVO.feedpostdate=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"pictures"]){
        advtpostVO.pictureArray=[[NSMutableArray alloc] init];
    }else if([elementName isEqualToString:@"comments"]){
        advtpostVO.commentsArray=[[NSMutableArray alloc] init];
    }
    
    if([elementName isEqualToString:@"feedtype"]){
        annouFeedVO.feedtype=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"announcementpostid"]){
        annouFeedVO.feedid=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"title"]){
        annouFeedVO.title=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"description"]){
        annouFeedVO.descriptionS=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"feedpostdate"]){
        annouFeedVO.feedpostdate=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"pictures"]){
        annouFeedVO.pictureArray=[[NSMutableArray alloc] init];
    }
    }

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
            characters=[[NSString alloc] initWithString:string];
    if([currentElement isEqualToString:@"description"] || [currentElement isEqualToString:@"restaurantname"]){
        if (!currentElementData) {
            currentElementData = [[NSMutableString alloc] init];
        }
        [currentElementData appendString:string];
        
    }

}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
   if([elementName isEqualToString:@"feedtype"]){
        mainFeedVO.feedType=characters;
   }
        if ([mainFeedVO.feedType isEqualToString:@"foodpost"]) {
            if([elementName isEqualToString:@"feedtype"]){
                newpostVO.feedType=characters;
            }else if([elementName isEqualToString:@"foodpostid"]){
                newpostVO.feedid=characters;
            }else if([elementName isEqualToString:@"restaurantname"]){
                
                newpostVO.restaurantname=[NSString stringWithString:currentElementData];
                currentElementData=nil;

            }else if([elementName isEqualToString:@"price"]){
                newpostVO.price=characters;
            }else if([elementName isEqualToString:@"category"]){
                newpostVO.category=characters;
            }else if([elementName isEqualToString:@"address"]){
                newpostVO.address=characters;
            }else if([elementName isEqualToString:@"lattitude"]){
                newpostVO.lattitude=characters;
            }else if([elementName isEqualToString:@"longitude"]){
                newpostVO.longitude=characters;
            }else if([elementName isEqualToString:@"description"]){
                newpostVO.descriptions=[NSString stringWithString:currentElementData];
                currentElementData=nil;

                [currentElementData setString:@""];
            }else if([elementName isEqualToString:@"tasterating"]){
                newpostVO.tasterating=characters;
            }else if([elementName isEqualToString:@"pricerating"]){
                newpostVO.pricerating=characters;
            }else if([elementName isEqualToString:@"hygienerating"]){
                newpostVO.hygienerating=characters;
            }else if([elementName isEqualToString:@"servicerating"]){
                newpostVO.servicerating=characters;
            }else if([elementName isEqualToString:@"contact"]){
                newpostVO.contactno=characters;
            }else if([elementName isEqualToString:@"from_operatinghrs"]){
                newpostVO.operatingFrm=characters;
            }else if([elementName isEqualToString:@"to_operatinghrs"]){
                newpostVO.operatingTo=characters;
            }else if([elementName isEqualToString:@"feedpostdate"]){
                newpostVO.feedpostdate=characters;
            }else if([elementName isEqualToString:@"breakfast"]){
                newpostVO.breakfast=characters;
            }else if([elementName isEqualToString:@"lunch"]){
                newpostVO.lunch=characters;
            }else if([elementName isEqualToString:@"dinner"]){
                newpostVO.dinner=characters;
            }else if([elementName isEqualToString:@"fullday"]){
                newpostVO.fullyday=characters;
            }else if([elementName isEqualToString:@"pictureid"]){
                picVO=[[pictureVO alloc]init];
                picVO.imageId=characters;
            }else if([elementName isEqualToString:@"picturename"]){
                picVO.imgae=characters;
            }else if([elementName isEqualToString:@"commentid"]){
                comVO=[[commentVO alloc]init];
                comVO.commentId=characters;
            }else if([elementName isEqualToString:@"commentusername"]){
                comVO.username=characters;
            }else if([elementName isEqualToString:@"commenttext"]){
                    comVO.comment=characters;
            }else if([elementName isEqualToString:@"commentdate"]){
                comVO.datecmt=characters;
            }else if([elementName isEqualToString:@"commentpicture"]){
                comVO.profileImg=characters;
            }
           else if([elementName isEqualToString:@"picture"]){
                [newpostVO.pictureArray addObject:picVO];
                
            }else if([elementName isEqualToString:@"comment"]){
                [newpostVO.commentsArray addObject:comVO];
            }
        }else if([mainFeedVO.feedType isEqualToString:@"advtpost"]){
            if([elementName isEqualToString:@"feedtype"]){
                advtpostVO.feedtype=characters;
            }else if([elementName isEqualToString:@"advtpostid"]){
                advtpostVO.feedid=characters;
            }else if([elementName isEqualToString:@"outlet"]){
                advtpostVO.outlet=characters;
            }else if([elementName isEqualToString:@"location"]){
                advtpostVO.location=characters;
            }else if([elementName isEqualToString:@"lattitude"]){
                advtpostVO.lattitude=characters;
            }else if([elementName isEqualToString:@"longitude"]){
                advtpostVO.longitude=characters;
            }else if([elementName isEqualToString:@"contact"]){
                advtpostVO.contact=characters;
            }else if([elementName isEqualToString:@"description"]){
                advtpostVO.descriptions=characters;
            }else if([elementName isEqualToString:@"feedpostdate"]){
                advtpostVO.feedpostdate=characters;
            }else if([elementName isEqualToString:@"pictureid"]){
                picVO=[[pictureVO alloc]init];
                picVO.imageId=characters;
            }else if([elementName isEqualToString:@"picturename"]){
                picVO.imgae=characters;
            }else if([elementName isEqualToString:@"commentid"]){
                comVO=[[commentVO alloc]init];
                comVO.commentId=characters;
            }else if([elementName isEqualToString:@"commentusername"]){
                comVO.username=characters;
            }else if([elementName isEqualToString:@"commenttext"]){
                comVO.comment=characters;
            }else if([elementName isEqualToString:@"commentdate"]){
                comVO.datecmt=characters;
            }else if([elementName isEqualToString:@"commentpicture"]){
                comVO.profileImg=characters;
            }
            if([elementName isEqualToString:@"picture"]){
               [advtpostVO.pictureArray addObject:picVO];
            }
            if([elementName isEqualToString:@"comment"]){
                [advtpostVO.commentsArray addObject:comVO];
            }

        }else{
            
            if([elementName isEqualToString:@"feedtype"]){
                annouFeedVO.feedtype=characters;
            }else if([elementName isEqualToString:@"announcementpostid"]){
                annouFeedVO.feedid=characters;
            }else if([elementName isEqualToString:@"title"]){
                annouFeedVO.title=characters;
            }
            else if([elementName isEqualToString:@"description"]){
                annouFeedVO.descriptionS=characters;
            }
            else if([elementName isEqualToString:@"feedpostdate"]){
                annouFeedVO.feedpostdate=characters;
            }else if([elementName isEqualToString:@"pictureid"]){
                picVO=[[pictureVO alloc]init];
                picVO.imageId=characters;
            }else if([elementName isEqualToString:@"picturename"]){
                picVO.imgae=characters;
            }
            
               if([elementName isEqualToString:@"picture"]){
                [annouFeedVO.pictureArray addObject:picVO];
                
                }
            }
    if([elementName isEqualToString:@"feed"]){
        
    if ([mainFeedVO.feedType isEqualToString:@"foodpost"]) {
        mainFeedVO.newpostVO=newpostVO;
        
    }else if ([mainFeedVO.feedType isEqualToString:@"advtpost"]){
        mainFeedVO.advtpostVO=advtpostVO;
    }else{
        mainFeedVO.annouFeedVO=annouFeedVO;
    }
        [mainFeedtypeArray addObject:mainFeedVO];
          }
    }
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mainFeedtypeArray count];
       //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section,(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];        
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier] ;

    AsyncImageView *feedImageView;
    UILabel *userLblName,*dateTimeLblName;
    UILabel *msgTextView;
    UILabel *userName;
    UIButton *moreButton;
    msgTextView=[[UILabel alloc] init];
    dateTimeLblName=[[UILabel alloc] init];
    moreButton=[[UIButton alloc] init];

    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        userLblName=[[UILabel alloc] initWithFrame:CGRectMake(115,4,180,20)];
        dateTimeLblName.frame=CGRectMake(300,4,150,20);
        msgTextView.frame=CGRectMake(115,32,self.mainFeedsTableView.bounds.size.width-120,60);
        //moreButton.frame=CGRectMake(400,90,35,35);
        
    }else
    {
        if(height>=480 && height<568){
            userLblName=[[UILabel alloc] initWithFrame:CGRectMake(115,4,180,20)];
            dateTimeLblName.frame=CGRectMake(cell.bounds.size.width-170,125,150,20);
            msgTextView.frame=CGRectMake(115,32,self.mainFeedsTableView.bounds.size.width-120,60);
            moreButton.frame=CGRectMake(cell.bounds.size.width-40,90,40, 30);
            
        }else if(height>=568 && height<600){
            userLblName=[[UILabel alloc] initWithFrame:CGRectMake(115,4,180,20)];
            dateTimeLblName.frame=CGRectMake(cell.bounds.size.width-110,120,150,20);
            msgTextView.frame=CGRectMake(115,32,self.mainFeedsTableView.bounds.size.width-120,60);
            //moreButton.frame=CGRectMake(cell.bounds.size.width-50,100,35,35);
        }else {
            userLblName=[[UILabel alloc] initWithFrame:CGRectMake(115,4,230,20)];
            dateTimeLblName.frame=CGRectMake(cell.bounds.size.width-100,125,150,20);
            msgTextView.frame=CGRectMake(115,32,self.mainFeedsTableView.bounds.size.width-140,70);
            moreButton.frame=CGRectMake(cell.bounds.size.width,80,20, 20);
        }
    }

    feedImageView=[[AsyncImageView alloc] initWithFrame:CGRectMake(5,10,100,100)];
    [feedImageView setBackgroundColor:[UIColor clearColor]];
    [feedImageView.layer setMasksToBounds:YES];
    feedImageView.clipsToBounds=YES;
    feedImageView.tag=1;
    [cell.contentView addSubview:feedImageView];

    userLblName.tag=2;
    [userLblName setFont:[UIFont fontWithName:@"Roboto-Regular" size:17]];
    userLblName.textColor=[UIColor colorWithHexString:@"1acfe4"];
    [cell.contentView addSubview:userLblName];
    
    msgTextView.tag=3;
    msgTextView.backgroundColor=[UIColor clearColor ];
    msgTextView.textColor=[UIColor blackColor];
    [msgTextView setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    msgTextView.lineBreakMode = NSLineBreakByWordWrapping;
    msgTextView.numberOfLines = 0;
    msgTextView.enabled=YES;
    
    msgTextView.textAlignment =NSTextAlignmentLeft;
    [cell.contentView addSubview:msgTextView];

 
    dateTimeLblName.tag=5000;
    moreButton.tag=5;
    
    dateTimeLblName.textAlignment=UITextAlignmentCenter;
    [dateTimeLblName setFont:[UIFont fontWithName:@"Roboto-Regular" size:10]];
    dateTimeLblName.textColor=[UIColor colorWithHexString:@"060000"];
    [cell.contentView addSubview:dateTimeLblName];
    
    //[moreButton addTarget:self action:@selector(feedDetails:) forControlEvents:UIControlEventTouchUpInside];
    [moreButton setBackgroundImage:[UIImage imageNamed:@"1439882468_Food-Dome.png"] forState:UIControlStateNormal];
    MainVo *mVO=[mainFeedtypeArray objectAtIndex:indexPath.row];
    
    if ([mVO.feedType isEqualToString:@"foodpost"]) {
        NewPostVO *nVO=mVO.newpostVO;
        if (![nVO.pictureArray count]==0) {
        pictureVO *pvo=[nVO.pictureArray objectAtIndex:0];
        [feedImageView loadImageFromURL:[NSURL URLWithString:pvo.imgae]];
        }else{
            feedImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pgfhicon.png"]];

        }
        msgTextView.textColor=[UIColor blackColor];
        userLblName.text=nVO.restaurantname;
        msgTextView.text=nVO.descriptions;

             NSDateFormatter *fbdateFormat = [[NSDateFormatter alloc] init];
        NSString *fbdate=[NSString stringWithFormat:@"%@",[[nVO.feedpostdate componentsSeparatedByString:@""] objectAtIndex:0]];
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
        moreButton.frame=CGRectMake(cell.bounds.size.width-50,100,25,25);
        [cell.contentView addSubview:moreButton];

    }else if ([mVO.feedType isEqualToString:@"advtpost"]){
        AdvtPostVO *aVO=mVO.advtpostVO;
         if (![aVO.pictureArray count]==0) {
        pictureVO *pvo=[aVO.pictureArray objectAtIndex:0];
        [feedImageView loadImageFromURL:[NSURL URLWithString:pvo.imgae]];
         }else{
             feedImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pgfhicon.png"]];
             
         }
        userLblName.textColor=[UIColor blackColor];
        msgTextView.textColor=[UIColor blackColor];

        userLblName.text=aVO.outlet;
        msgTextView.text=aVO.descriptions;
        [cell.contentView addSubview:msgTextView];

        NSDateFormatter *fbdateFormat = [[NSDateFormatter alloc] init];
        NSString *fbdate=[NSString stringWithFormat:@"%@",[[aVO.feedpostdate componentsSeparatedByString:@""] objectAtIndex:0]];
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
        moreButton.frame=CGRectMake(cell.bounds.size.width-50,100,20,20);
        [cell.contentView addSubview:moreButton];
       cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar.png"]];
    
    }else if ([mVO.feedType isEqualToString:@"announcementpost"]){
        AnnouncementVO *annVO=mVO.annouFeedVO;
        if (![annVO.pictureArray count]==0) {
            pictureVO *pvo=[annVO.pictureArray objectAtIndex:0];
            [feedImageView loadImageFromURL:[NSURL URLWithString:pvo.imgae]];
        }else{
            feedImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pgfhicon.png"]];
            
        }
        userLblName.text=annVO.title;
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:annVO.descriptionS];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
        int value;
        value=[self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString :annVO.descriptionS] andWidth:self.view.bounds.size.width-100]+80;
        UILabel *cmtTextView=[[UILabel alloc] initWithFrame:CGRectMake(115,30,210,[self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString :annVO.descriptionS] andWidth:self.view.bounds.size.width-100]+80)];
        CGSize textViewSize = [cmtTextView sizeThatFits:CGSizeMake(cmtTextView.frame.size.width, cell.bounds.size.height)];
        //cmtTextView.contentSize = textViewSize;
        //cmtTextView.scrollEnabled=false;
        cmtTextView.backgroundColor=[UIColor clearColor];
        cmtTextView.lineBreakMode = NSLineBreakByWordWrapping;
        cmtTextView.numberOfLines = 0;
        cmtTextView.textColor=[UIColor blackColor];
        //[cmtTextView setEditable:false];
        cell.backgroundColor=[UIColor whiteColor];
        if(![annVO.descriptionS isEqualToString:@""] && annVO.descriptionS!=nil)
        {
            [cmtTextView setAttributedText:title];
        }else {
            [cmtTextView setText:@"N/A"];
        }
        [cell.contentView addSubview:cmtTextView];

        NSDateFormatter *fbdateFormat = [[NSDateFormatter alloc] init];
        NSString *fbdate=[NSString stringWithFormat:@"%@",[[annVO.feedpostdate componentsSeparatedByString:@""] objectAtIndex:0]];
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
        moreButton.frame=CGRectMake(cell.bounds.size.width-50,value,20,20);
        [cell.contentView addSubview:moreButton];
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MainVo *mVO=[mainFeedtypeArray objectAtIndex:indexPath.row];
    if ([mVO.feedType isEqualToString:@"foodpost"]) {
        CommentViewController *comVc;
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {

        comVc=[[CommentViewController alloc] initWithNibName:@"CommentViewController"bundle:nil];
        }else{
            comVc=[[CommentViewController alloc] initWithNibName:@"CommentViewController~ipad"bundle:nil];
 
        }
        
        comVc.nVO=[[NewPostVO alloc] init];
        comVc.nVO=mVO.newpostVO;
        [self.navigationController pushViewController:comVc animated:YES];
    }else if ([mVO.feedType isEqualToString:@"advtpost"]){
        AdvtPostViewController *apVc;
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {

        apVc=[[AdvtPostViewController alloc] initWithNibName:@"AdvtPostViewController"bundle:nil];
        }else{
            apVc=[[AdvtPostViewController alloc] initWithNibName:@"AdvtPostViewController~ipad"bundle:nil];

        }
        
        apVc.aVO=[[AdvtPostVO alloc] init];
        apVc.aVO=mVO.advtpostVO;
        [self.navigationController pushViewController:apVc animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainVo *mVO=[mainFeedtypeArray objectAtIndex:indexPath.row];
    if ([mVO.feedType isEqualToString:@"foodpost"]) {
        return 140;

    }else if ([mVO.feedType isEqualToString:@"advtpost"]){
        return 140;
    }else{
        AnnouncementVO *annVO=mVO.annouFeedVO;
          NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:annVO.descriptionS];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    return [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-70]+100;
    }
          //return 140;
}
- (int)timeDifference:(NSDate *)fromDate ToDate:(NSDate *)toDate{
    NSTimeInterval distanceBetweenDates = [fromDate timeIntervalSinceDate:toDate];
    return distanceBetweenDates;
}
- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}
-(void)categoryList{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
    appDelegate.categoryListArray=[[NSMutableArray alloc] init];
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
    appDelegate.categoryListArray = [[content componentsSeparatedByString:@"a1b2c3"] mutableCopy];
    [activityIndicator stopAnimating];
    
   }
}
-(IBAction)categorylistAction{
        CategoryAlertView *cav=[[CategoryAlertView alloc] init];
        [cav show];

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    categoryStr=[[NSString alloc]init];
    categoryStr=[alert buttonTitleAtIndex:buttonIndex];
    if (![categoryStr isEqualToString:@"Cancel"]) {
    searchString=@"";
    [alert dismissWithClickedButtonIndex:buttonIndex animated:YES];
    mainFeedtypeArray=[[NSMutableArray alloc]init];
        [self getAllData];
    }
    else{
       categoryStr=[[NSString alloc]init];
    }
}
#pragma mark - Control datasource

- (void)finishRefresh
{
    [mainFeedsTableView finishRefresh];
    [mainFeedsTableView reloadData];
}

- (void)finishLoadMore
{
    [mainFeedsTableView finishLoadMore];
    [mainFeedsTableView reloadData];
}

#pragma mark - Drag delegate methods

- (void)dragTableDidTriggerRefresh:(UITableView *)tableView
{
    //send refresh request(generally network request) here
    if(![userSearchBar.text isEqualToString:@""]){
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
        [self.view addSubview: activityIndicator];
        
    }
    [self getAllData];
    [self performSelector:@selector(finishRefresh) withObject:nil afterDelay:2];
}

- (void)dragTableRefreshCanceled:(UITableView *)tableView
{
    //cancel refresh request(generally network request) here
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(finishRefresh) object:nil];
}

- (void)dragTableDidTriggerLoadMore:(UITableView *)tableView
{
    //send load more request(generally network request) here
    if(![userSearchBar.text isEqualToString:@""]){
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
        [self.view addSubview: activityIndicator];
        
    }
    [self getAllData];
    [self performSelector:@selector(finishLoadMore) withObject:nil afterDelay:2];
}

- (void)dragTableLoadMoreCanceled:(UITableView *)tableView
{
    //cancel load more request(generally network request) here
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(finishLoadMore) object:nil];
}
-(void)loadFeeds{
    
    if ([userSearchBar.text isEqualToString:@""])
        searchString=@"";
        counst=[mainFeedtypeArray count];
        [self getAllData];
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
