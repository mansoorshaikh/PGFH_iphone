//
//  PickLocationViewController.h
//  PGFH
//
//  Created by arvind on 9/5/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AppDelegate.h"


@interface PickLocationViewController :UIViewController<MKMapViewDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,retain) IBOutlet MKMapView *mapView;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,readwrite) CLLocationCoordinate2D currentLocation;
@property(nonatomic,retain) MKPointAnnotation *annotation;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) NSString *fromView;


@end
