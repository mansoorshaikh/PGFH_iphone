//
//  NewFeedViewController.m
//  PGFH
//
//  Created by arvind on 9/2/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "NewFeedViewController.h"
#import "menuControllers/MainViewController.h"
#import "NewPostViewController.h"
#import "SWRevealViewController.h"

@interface NewFeedViewController ()
@property(nonatomic) double longitudeLabelS;
@property(nonatomic) double latitudeLabelS;
@property (strong, nonatomic) CMMotionManager *motionManager;
@end

@implementation NewFeedViewController{
    CLLocationManager *locationManager;
}

@synthesize searchBtn,pasteBtn,fileBtn,backBtn,userSearchBar,longitudeLabelS,latitudeLabelS,currentLocation,mvc,activityIndicator;
- (void)viewDidLoad {
    [super viewDidLoad];
    [activityIndicator stopAnimating];
    self.navigationController.navigationBarHidden=YES;
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    

    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(height>=480 && height<568){
        [backBtn removeFromSuperview];
        backBtn.layer.frame=CGRectMake(5,20,40,40);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"backarrow(2).png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
        


        userSearchBar.layer.frame=CGRectMake(50,25,180, 30);
        [userSearchBar removeFromSuperview];
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
        
        
    }else if(height>=568 && height<600){
        
        [backBtn removeFromSuperview];
        backBtn.layer.frame=CGRectMake(5,20,40,40);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"backarrow(2).png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
        
        userSearchBar.layer.frame=CGRectMake(35,25,170, 30);
        [userSearchBar removeFromSuperview];
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
    [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

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
    
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    self.motionManager.accelerometerUpdateInterval = 1;
    
    if ([self.motionManager isAccelerometerAvailable])// & [self.motionManager isAccelerometerActive])
    {
        NSLog(@"Accelerometer is active and available");
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
         
         {
             NSLog(@"X = %0.4f, Y = %.04f, Z = %.04f",
                   accelerometerData.acceleration.x,
                   accelerometerData.acceleration.y,
                   accelerometerData.acceleration.z);
             
             dispatch_async(dispatch_get_main_queue(), ^{
                
             });
         }];
    }
    else
        NSLog(@"not active");

    // Do any additional setup after loading the view from its nib.
}
-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self showAlert];
    } 
}
-(IBAction)showAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello World" message:@"This is my first app!" delegate:nil cancelButtonTitle:@"Awesome" otherButtonTitles:nil];
    
    [alertView show];
}
-(IBAction)popViewController{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}
-(IBAction)newPostAction{
    NewPostViewController *npvc=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController" bundle:nil];
    [self.navigationController pushViewController:npvc animated:YES];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *newLocation=[locations lastObject];
    latitudeLabelS=newLocation.coordinate.latitude;
    longitudeLabelS=newLocation.coordinate.longitude;
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:latitudeLabelS longitude:longitudeLabelS] completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark * placemark in placemarks) {
            NSString *locality = [placemark name];
            NSLog(@"locality %@",locality);
            if([placemark locality]!=nil)
                currentLocation=[NSString stringWithFormat:@"%@",[placemark country]];
            else
                currentLocation=[NSString stringWithFormat:@"%@",[placemark country]];
            
            
            NSLog(@"appDelegate.currentlocation = %@",currentLocation);
            [locationManager stopUpdatingLocation];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
