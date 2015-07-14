//
//  DMPopupAlert.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "DMPopupAlert.h"

#import "DMPopupManager.h"

#import "DMPopupAlertTableViewCell.h"

@interface DMPopupAlert() <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSLayoutConstraint *tableViewHeightConstraint;

@property (strong, nonatomic) NSMutableArray *dataItems;

@property (assign, nonatomic) CGFloat totalTableHeight;

@end

@implementation DMPopupAlert

#pragma mark - init

- (DMPopupAlert*)initWithView:(UIView*)view{
    self = [super init];
    if (!self) return nil;
    
    self.view = view;
    
    [self createTableView];
    
    // table data item
    self.dataItems = [NSMutableArray arrayWithCapacity:10];
    
    // table height
    self.totalTableHeight = 0.0;
    
    return self;
}

#pragma mark - Shared instance

+ (void)show:(DMPopupItem *)item inView:(UIView *)view {
    DMPopupAlert *popupAlert = [[DMPopupManager sharedInstance] popupAlertForView:view];
    
    [popupAlert _show:item inView:view];
}

#pragma mark - Instance methods

- (void)_show:(DMPopupItem *)item inView:(UIView *)view {
    
    // restrict table height
    CGFloat totalHeight = self.totalTableHeight + [self tableCellHeightByItem:item];
    if (totalHeight > 200.0) totalHeight = 200.0;
    self.totalTableHeight = totalHeight;
    
    // update table height
    self.tableViewHeightConstraint.constant = self.totalTableHeight;
    
    // update layout
    [self.view layoutIfNeeded];

    // append item
    [self.dataItems insertObject:item atIndex:0];
    
    // update table data
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
}

- (void) updateTableViewHeight {
    // update table height
    self.tableViewHeightConstraint.constant = self.totalTableHeight;
    
    // update layout
    [self.view layoutIfNeeded];
}

#pragma mark - UITableView methods

- (void) createTableView {
    
    CGRect tableFrame = CGRectZero;
    tableFrame.size.width = self.view.frame.size.width;
    tableFrame.size.height = 200.0;
    
    // create tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerNib:[UINib nibWithNibName:@"DMPopupAlertTableViewCell" bundle:nil] forCellReuseIdentifier:DMPopupAlertTableViewCell_ID];
    
    // add to view
    [self.view addSubview:tableView];
    
    // add constraints
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[tableView]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(tableView)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    self.tableViewHeightConstraint = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:10.0];
    [tableView addConstraint:self.tableViewHeightConstraint];
    
    // store it
    self.tableView = tableView;
}

- (CGFloat)tableCellHeightByItem:(DMPopupItem*)item {
    return 50.0;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataItems == nil) return 0;
    
    return [self.dataItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DMPopupItem *model = [self.dataItems objectAtIndex:indexPath.row];
    
    return [self tableCellHeightByItem:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DMPopupItem *model = [self.dataItems objectAtIndex:indexPath.row];
    
    DMPopupAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DMPopupAlertTableViewCell_ID forIndexPath:indexPath];
    [cell updateCellWithModel:model];
    
    return cell;
}

@end
