//
//  AppDelegate.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "AppDelegate.h"

#import "DMPopupAlert.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initPopupAlertAppereance];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Init appereance

- (void)initPopupAlertAppereance {

    [DMPopupAlert setColor:[UIColor redColor] forParam:DMPopupCell_BackgroundColor forType:DMPopupTypeError];
    [DMPopupAlert setColor:[UIColor orangeColor] forParam:DMPopupCell_BackgroundColor forType:DMPopupTypeWarning];
    [DMPopupAlert setColor:[UIColor greenColor] forParam:DMPopupCell_BackgroundColor forType:DMPopupTypeInfo];
    
    [DMPopupAlert setSize:CGSizeMake(30.0, 30.0) forParam:DMPopupCell_ImageSize];
    [DMPopupAlert setPadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) forParam:DMPopupCell_ImagePadding];
    
    [DMPopupAlert setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17.0] forParam:DMPopupCell_TitleFont];
    [DMPopupAlert setColor:[UIColor whiteColor] forParam:DMPopupCell_TitleColor];
    [DMPopupAlert setPadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) forParam:DMPopupCell_TitlePadding];

    [DMPopupAlert setFont:[UIFont fontWithName:@"Helvetica" size:12.0] forParam:DMPopupCell_BodyFont];
    [DMPopupAlert setColor:[UIColor whiteColor] forParam:DMPopupCell_BodyColor];
    [DMPopupAlert setPadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) forParam:DMPopupCell_TitlePadding];

}

@end
