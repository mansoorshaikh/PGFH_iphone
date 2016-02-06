//
//  PickLocationViewController.m
//  PGFH
//
//  Created by arvind on 9/5/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "PickLocationViewController.h"

#import "NewPostViewController.h"
@interface PickLocationViewController ()
@property(nonatomic) double longitudeLabelS;
@property(nonatomic) double latitudeLabelS;

@end

@implementation PickLocationViewController

@synthesize mapView,locationManager,currentLocation,annotation,appDelegate,fromView,longitudeLabelS,latitudeLabelS;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)popviewController{
        NewPostViewController *newpost=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController" bundle:nil]
        ;
    appDelegate.latitudeStrs=[NSString stringWithFormat:@"%f", latitudeLabelS];
    appDelegate.longitudeStrs=[NSString stringWithFormat:@"%f", longitudeLabelS];

        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newpost];
        navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
        [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
        [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    [manager stopUpdatingLocation];
    locationManager.delegate = nil;
    locationManager = nil;
    
    if (![appDelegate.latitudeStrs isEqualToString:@""] || ![appDelegate.longitudeStrs isEqualToString:@""]) {
        longitudeLabelS=[appDelegate.longitudeStrs doubleValue];
        latitudeLabelS=[appDelegate.latitudeStrs doubleValue];
        CLLocationCoordinate2D currentLocations = {(latitudeLabelS),(longitudeLabelS)};
        MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(currentLocations, 100000, 100000);
        [mapView setRegion:region];
        self.annotation = [[MKPointAnnotation alloc] init];
        [self.annotation setCoordinate:currentLocations];

    }else{
        longitudeLabelS=newLocation.coordinate.longitude;
        latitudeLabelS=newLocation.coordinate.latitude;
        appDelegate.latitudeStrs=[NSString stringWithFormat:@"%f", latitudeLabelS];
        appDelegate.longitudeStrs=[NSString stringWithFormat:@"%f", longitudeLabelS];
        CLLocationCoordinate2D currentLocations = newLocation.coordinate;
        MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(currentLocations, 100000, 100000);
        [mapView setRegion:region];
        self.annotation = [[MKPointAnnotation alloc] init];
        [self.annotation setCoordinate:currentLocations];

    }
    [self.annotation setTitle:@"Current Location"];
    [self.mapView addAnnotation:annotation];
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:latitudeLabelS longitude:longitudeLabelS] completionHandler:^(NSArray *placemarks, NSError *error)  {
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
        latitudeLabelS=droppedAt.latitude;
        longitudeLabelS=droppedAt.longitude;
        appDelegate.latitudeStrs=[NSString stringWithFormat:@"%f", latitudeLabelS];
        appDelegate.longitudeStrs=[NSString stringWithFormat:@"%f", longitudeLabelS];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=NO;
    appDelegate=[[UIApplication sharedApplication] delegate];
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(30, 0, 110, 35)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [titleLabel setText:@"Map Location"];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font =[UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
    //appDelegate.latitudeStrs=[[NSString alloc]init];
    //appDelegate.longitudeStrs=[[NSString alloc]init];
    UIImage* image3 = [UIImage imageNamed:@"donebtn.png"];
    CGRect frameimg;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        frameimg= CGRectMake(0, 0, 50, 30);
    else
        frameimg= CGRectMake(0, 0, 80, 48);
    
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(donepicklocation)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *anotherButton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=anotherButton;
    
    UIButton *backButton = [[UIButton alloc]init];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        [backButton setFrame:CGRectMake(-20,-10,90,60)];
    else
        [backButton setFrame:CGRectMake(0,0,70,48)];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.userInteractionEnabled = YES;
    [backButton addTarget:self
                   action:@selector(popviewController)
         forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"backarrow(2).png"] forState:UIControlStateNormal];
    
    // ASSIGNING THE BUTTON WITH IMAGE TO BACK BAR BUTTON
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backBarButton;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar.png"]];
    self.navigationController.navigationBar.translucent = NO;
    appDelegate=[[UIApplication sharedApplication] delegate];
    mapView.delegate=self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate =self;
    [locationManager startUpdatingLocation];
    
    UILongPressGestureRecognizer* lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5;
    lpgr.delegate = self;
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
}

- (void) handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CLLocationCoordinate2D coordinate = [mapView convertPoint:[gestureRecognizer locationInView:mapView] toCoordinateFromView:mapView];
        [mapView setCenterCoordinate:coordinate animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
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
