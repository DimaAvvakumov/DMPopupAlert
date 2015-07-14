//
//  DMPopupItem.h
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DMPopupType) {
    DMPopupTypeInfo = 0,
    DMPopupTypeWarning,
    DMPopupTypeError
};


@interface DMPopupItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *body;

@property (assign, nonatomic) DMPopupType type;

+ (DMPopupItem *) popupItemWithTitle:(NSString *)title andBody:(NSString *)body;

@end
