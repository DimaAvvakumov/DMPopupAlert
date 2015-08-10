//
//  NSString+TextSize.m
//  DMProject
//
//  Created by Dima Avvakumov on 24.09.13.
//  Copyright (c) 2013 Dima Avvakumov. All rights reserved.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)

- (CGSize) textSizeWithFont: (UIFont *) font size: (CGSize) size options: (NSStringDrawingOptions) options {
    NSDictionary *attr = @{NSFontAttributeName: font};
    
    CGRect rect = [self boundingRectWithSize:size options:options attributes:attr context:nil];
    return CGSizeMake(ceilf(rect.size.width), ceilf(rect.size.height));
}

@end
