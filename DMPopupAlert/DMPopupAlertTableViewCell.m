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
    
    // apply background
    [self updateBackgroundForType:type];
    
    // apply title appereance
    [self updateTitleForType:type];
    
    // apply body appereance
    [self updateTitleForType:type];
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

@end
