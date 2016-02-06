//
//  ImageExtract.h
//  PGFH
//
//  Created by mansoor shaikh on 16/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
#import "AsyncImageView.h"
#import "AppDelegate.h"



@interface ImageExtract : CustomIOS7AlertView
@property(nonatomic,retain) AsyncImageView *serverImage;
@property(nonatomic,retain) AppDelegate *appDelegate;
-(UIView *)imageExtractView
;
@end
