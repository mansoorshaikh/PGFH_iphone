//
//  NewPostVO.h
//  PGFH
//
//  Created by arvind on 9/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewPostVO : NSObject
@property(nonatomic,retain) NSString *restaurantname,*price,*category,*address,*contactno,*operatingFrm,*operatingTo,*lattitude,*longitude,*descriptions,*tasterating,*pricerating,*hygienerating,*servicerating,*feedType,*pictures,*comment,*feedid,*feedpostdate,*pictureId,*breakfast,*dinner,*lunch,*fullyday;
@property(nonatomic,retain) NSMutableArray *commentsArray,*pictureArray;
@end
