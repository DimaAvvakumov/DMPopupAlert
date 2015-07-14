//
//  DMPopupItem.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "DMPopupItem.h"

@implementation DMPopupItem

- (id)init{
    self = [super init];
    if (!self) return nil;
    
    self.title = nil;
    self.body = nil;
    
    self.duration = 3.0;
    
    self.type = DMPopupTypeInfo;
    
    return self;
}

+ (DMPopupItem *) popupItemWithTitle:(NSString *)title andBody:(NSString *)body {
    DMPopupItem *item = [[DMPopupItem alloc] init];
    item.title = title;
    item.body = body;
    
    return item;
}

@end
