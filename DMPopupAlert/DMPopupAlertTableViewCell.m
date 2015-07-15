//
//  DMPopupAlertTableViewCell.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "DMPopupAlertTableViewCell.h"

#import "DMPopupManager.h"

@interface DMPopupAlertTableViewCell()

@end

@implementation DMPopupAlertTableViewCell

- (void)awakeFromNib {
    // Apply appereance
    UIColor *backgroundColor = [DMPopupManager colorForParam:DMPopupCell_BackgroundColor];
    if (backgroundColor) {
        self.contentView.backgroundColor = backgroundColor;
    }
    
    // apply title appereance
    [self awakeTitleLabel];
    
    // apply body appereance
    [self awakeBodyLabel];
}

- (void)awakeTitleLabel {
    // title font
    UIFont *font = [DMPopupManager fontForParam:DMPopupCell_TitleFont];
    if (font) {
        self.titleLabel.font = font;
    }
    
    // title color
    UIColor *color = [DMPopupManager colorForParam:DMPopupCell_TitleColor];
    if (color) {
        self.titleLabel.textColor = color;
    }
}

- (void)awakeBodyLabel {
    // body font
    UIFont *font = [DMPopupManager fontForParam:DMPopupCell_BodyFont];
    if (font) {
        self.bodyLabel.font = font;
    }
    
    // body color
    UIColor *color = [DMPopupManager colorForParam:DMPopupCell_BodyColor];
    if (color) {
        self.bodyLabel.textColor = color;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)updateCellWithModel:(DMPopupItem *)model {
    self.titleLabel.text = model.title;
    self.bodyLabel.text = model.body;
    
    // type
    DMPopupType type = model.type;
    
    // apply icon
    [self updateIconForType:type];
    
    // apply background
    [self updateBackgroundForType:type];
    
    // apply title appereance
    [self updateTitleForType:type];
    
    // apply body appereance
    [self updateTitleForType:type];
}

- (void) updateIconForType:(DMPopupType) type {
    // image
    UIImage *image = nil;
    if (type == DMPopupTypeError) {
        image = [self errorIconWithColor:[UIColor whiteColor]];
    }
    if (type == DMPopupTypeWarning) {
        image = [self warningIconWithColor:[UIColor whiteColor]];
    }
    if (type == DMPopupTypeSuccess) {
        image = [self successIconWithColor:[UIColor whiteColor]];
    }
    
    if (image) {
        self.iconImageView.image = image;
    }
}

- (void) updateBackgroundForType:(DMPopupType) type {
    // color
    UIColor *color = [DMPopupManager colorForParam:DMPopupCell_BackgroundColor forType:type];
    if (color) {
        self.contentView.backgroundColor = color;
    }
}

- (void) updateTitleForType:(DMPopupType) type {
    // title font
    UIFont *font = [DMPopupManager fontForParam:DMPopupCell_TitleFont forType:type];
    if (font) {
        self.titleLabel.font = font;
    }
    
    // title color
    UIColor *color = [DMPopupManager colorForParam:DMPopupCell_TitleColor forType:type];
    if (color) {
        self.titleLabel.textColor = color;
    }
}

- (void) updateBodyForType:(DMPopupType) type {
    // body font
    UIFont *font = [DMPopupManager fontForParam:DMPopupCell_BodyFont forType:type];
    if (font) {
        self.bodyLabel.font = font;
    }
    
    // body color
    UIColor *color = [DMPopupManager colorForParam:DMPopupCell_BodyColor forType:type];
    if (color) {
        self.bodyLabel.textColor = color;
    }
}

#pragma mark - Close action

- (IBAction)closeAction:(UIButton*)sender {
    if (_closeBlock) {
        _closeBlock(sender);
    }
}

#pragma mark - Icon methods

- (UIImage *) errorIconWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40.0, 40.0), NO, 0.0);
    
    //// Group
    {
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = UIBezierPath.bezierPath;
        [rectangle2Path moveToPoint: CGPointMake(9.5, 25.5)];
        [rectangle2Path addLineToPoint: CGPointMake(16.5, 32.5)];
        [rectangle2Path addLineToPoint: CGPointMake(26.5, 32.5)];
        [rectangle2Path addLineToPoint: CGPointMake(33.5, 25.5)];
        [rectangle2Path addLineToPoint: CGPointMake(33.5, 15.5)];
        [rectangle2Path addLineToPoint: CGPointMake(26.5, 8.5)];
        [rectangle2Path addLineToPoint: CGPointMake(16.5, 8.5)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 15.5)];
        [rectangle2Path addLineToPoint: CGPointMake(9.5, 25.5)];
        [rectangle2Path closePath];
        [color setStroke];
        rectangle2Path.lineWidth = 1;
        [rectangle2Path stroke];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(16.5, 15.5)];
        [bezierPath addLineToPoint: CGPointMake(26.5, 25.5)];
        bezierPath.lineCapStyle = kCGLineCapSquare;
        
        [color setStroke];
        bezierPath.lineWidth = 1;
        [bezierPath stroke];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(16.5, 25.5)];
        [bezier2Path addLineToPoint: CGPointMake(26.5, 15.5)];
        bezier2Path.lineCapStyle = kCGLineCapSquare;
        
        [color setStroke];
        bezier2Path.lineWidth = 1;
        [bezier2Path stroke];
    }

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *) warningIconWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40.0, 40.0), NO, 0.0);
    
    //// Group
    {
        //// Graphic Многоугольник 1 Drawing
        UIBezierPath* graphic1Path = UIBezierPath.bezierPath;
        [graphic1Path moveToPoint: CGPointMake(21.5, 7.5)];
        [graphic1Path addLineToPoint: CGPointMake(39.5, 35.5)];
        [graphic1Path addLineToPoint: CGPointMake(4.5, 35.5)];
        [graphic1Path addLineToPoint: CGPointMake(21.5, 7.5)];
        [graphic1Path closePath];
        [color setStroke];
        graphic1Path.lineWidth = 1;
        [graphic1Path stroke];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *) successIconWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40.0, 40.0), NO, 0.0);
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(10.5, 20.5)];
    [bezierPath addLineToPoint: CGPointMake(18.5, 28.5)];
    [bezierPath addLineToPoint: CGPointMake(35.5, 12.5)];
    bezierPath.lineCapStyle = kCGLineCapSquare;
    
    [color setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
