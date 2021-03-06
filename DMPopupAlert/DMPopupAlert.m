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

@property (strong, nonatomic) UIViewController *backingController;

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
    
    self.backingController = nil;
    self.view = view;
    
    [self initView];
    
    return self;
}

- (DMPopupAlert*)initWithController:(UIViewController *)viewController {
    self = [super init];
    if (!self) return nil;
    
    self.backingController = viewController;
    self.view = viewController.view;
    
    [self initView];
    
    return self;
}

- (void)initView {
    [self createTableView];
    
    // table data item
    self.dataItems = [NSMutableArray arrayWithCapacity:10];
    
    // table height
    self.totalTableHeight = 0.0;
}

#pragma mark - Shared instance

+ (void)show:(DMPopupItem *)item inView:(UIView *)view {
    DMPopupAlert *popupAlert = [[DMPopupManager sharedInstance] popupAlertForView:view];
    
    [popupAlert _show:item inView:view];
}

+ (void)show:(DMPopupItem *)item inController:(UIViewController *)viewController {
    DMPopupAlert *popupAlert = [[DMPopupManager sharedInstance] popupAlertForController:viewController];
    
    [popupAlert _show:item inView:viewController.view];
}

#pragma mark - Instance methods

- (void)_show:(DMPopupItem *)item inView:(UIView *)view {
    
    // max height
    CGFloat maxTableHeight = view.bounds.size.height * 0.8;
    
    // restrict table height
    CGFloat totalHeight = self.totalTableHeight + [self tableCellHeightByItem:item];
    if (totalHeight <= maxTableHeight) {
        self.totalTableHeight = totalHeight;
    }
    
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
    
    // cell destruct timer
    NSTimeInterval duration = item.duration;
    if (duration > 0.0) {
        NSDictionary *timerInfo = @{@"item":item};
        NSTimer *timer = [NSTimer timerWithTimeInterval:duration target:self selector:@selector(destructCellByTimer:) userInfo:timerInfo repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
}

- (void)destructCellByTimer:(NSTimer*)timer {
    DMPopupItem *item = [timer.userInfo objectForKey:@"item"];
    
    [self destructCellByItem:item];
}

- (void)destructCellByItem:(DMPopupItem*)item {
    NSInteger index = [self.dataItems indexOfObject:item];
    if (index == NSNotFound) return;
    
    // remove from data items
    [self.dataItems removeObjectAtIndex:index];
    
    // weak self
    __weak typeof (self) weakSelf = self;
    
    // update table data
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [CATransaction begin];
    [self.tableView beginUpdates];
    [CATransaction setCompletionBlock: ^{
        [weakSelf performSelector:@selector(restructTableHeight) withObject:nil afterDelay:0.1];
    }];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
    [CATransaction commit];
}

- (void)restructTableHeight {
    CGFloat h = self.tableView.contentSize.height;
    
    if (h > self.totalTableHeight) return;
    
    self.totalTableHeight = h;
    
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
    tableView.allowsSelection = NO;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    // register nib
    UINib *nib = [DMPopupManager sharedInstance].registredNib;
    if (nib == nil) {
        NSURL *bundlePath = [[NSBundle bundleForClass:[self class]] URLForResource:@"DMPopupAlert" withExtension:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithURL:bundlePath];
        
        nib = [UINib nibWithNibName:@"DMPopupAlertTableViewCell" bundle:bundle];
    }
    [tableView registerNib:nib forCellReuseIdentifier:DMPopupAlertTableViewCell_ID];
    
    // add to view
    [self.view addSubview:tableView];
    
    // add left & right constraints
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[tableView]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(tableView)]];
    
    // top constraint
    {
        NSLayoutConstraint *constraint;
        if (_backingController) {
            id<UILayoutSupport> topGuide = _backingController.topLayoutGuide;
            constraint = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
        } else {
            constraint = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
        }
        
        [self.view addConstraint:constraint];
    }
    
    self.tableViewHeightConstraint = [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:10.0];
    [tableView addConstraint:self.tableViewHeightConstraint];
    
    // store it
    self.tableView = tableView;
}

- (CGFloat)tableCellHeightByItem:(DMPopupItem*)item {
    CGFloat cellHeight = 50.0;
    DMPopupAlertHeightBlock block = [DMPopupManager sharedInstance].heightBlock;
    if (block) {
        CGFloat cellWidth = self.view.bounds.size.width;
        cellHeight = block(cellWidth, item);
    }
    
    return cellHeight;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataItems == nil) return 0;
    
    return [self.dataItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    __block DMPopupItem *model = [self.dataItems objectAtIndex:indexPath.row];
    
    return [self tableCellHeightByItem:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DMPopupItem *model = [self.dataItems objectAtIndex:indexPath.row];
    
    // weak self
    __weak typeof (self) weakSelf = self;
    
    DMPopupAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DMPopupAlertTableViewCell_ID forIndexPath:indexPath];
    [cell updateCellWithModel:model];
    cell.closeBlock = ^(UIButton *sender) {
        [weakSelf destructCellByItem:model];
    };
    
    return cell;
}

#pragma mark - Calculate block

+ (void)setCalculateHeightBlock:(DMPopupAlertHeightBlock)block {
    [DMPopupManager sharedInstance].heightBlock = block;
}

#pragma mark - Custom xib

+ (void) registerNib:(UINib *)nib {
    if (nib == nil) return;
    if (![nib isKindOfClass:[UINib class]]) return;
    
    [DMPopupManager sharedInstance].registredNib = nib;
}

#pragma mark - Appereance

+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName {
    [DMPopupManager setColor:value forParam:paramName];
}

+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType {
    [DMPopupManager setColor:value forParam:paramName forType:popupType];
}

+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName {
    [DMPopupManager setFont:value forParam:paramName];
}

+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType {
    [DMPopupManager setFont:value forParam:paramName forType:popupType];
}

@end
