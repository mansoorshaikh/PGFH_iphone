//
//  MainVo.h
//  PGFH
//
//  Created by arvind on 9/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewPostVO.h"
#import "AdvtPostVO.h"
#import "AnnouncementVO.h"

@interface MainVo : NSObject
@property(nonatomic,retain) NSString *feedType;
@property(nonatomic,retain) NewPostVO *newpostVO;
@property(nonatomic,retain) AdvtPostVO *advtpostVO;
@property(nonatomic,retain) AnnouncementVO *annouFeedVO;

@end
