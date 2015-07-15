//
//  DMPopupItem.h
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DMPopupType) {
    DMPopupTypeInfo,
    DMPopupTypeWarning,
    DMPopupTypeError
};

#define DMPopupCell_BackgroundColor @"BackgroundColor"

#define DMPopupCell_TitleFont    @"TitleFont"
#define DMPopupCell_TitleColor   @"TitleColor"

#define DMPopupCell_BodyFont     @"BodyFont"
#define DMPopupCell_BodyColor    @"BodyColor"


@interface DMPopupItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *body;

@property (assign, nonatomic) NSTimeInterval duration;

@property (assign, nonatomic) DMPopupType type;

+ (DMPopupItem *) popupItemWithTitle:(NSString *)title andBody:(NSString *)body;

@end
