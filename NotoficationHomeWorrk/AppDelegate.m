//
//  AppDelegate.m
//  NotoficationHomeWorrk
//
//  Created by gressmc on 06/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Entrepreneur.h"
#import "MyAppDelegate.h"

@interface AppDelegate ()

@property(strong,nonatomic) Government* government;
@property(strong,nonatomic) Entrepreneur* entrepreneur;
@property(strong,nonatomic) Pensioner* pensioner;
@property(strong,nonatomic) Doctor* doc;
@property(strong,nonatomic) MyAppDelegate* myApp;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotificator:)
                                                 name:GovernmentTaxLevelDidChangeNotification
                                               object:nil];
    */
    self.government = [Government new];
    self.entrepreneur = [Entrepreneur  new];
    self.pensioner = [Pensioner new];
    self.doc =[Doctor new];
    self.myApp = [MyAppDelegate new];
    
    self.doc.salary = 900.f;
    self.pensioner.pension = 300;
    self.entrepreneur.salary = self.government.salary*5;
    self.entrepreneur.taxLevel = self.government.taxLevel;
    
    
    
    self.government.taxLevel = 13.4f;
    self.government.salary = 1100;
    NSLog(@"Next Day-----------");
    self.government.pension = 550;
    self.government.taxLevel = 13.7f;
    NSLog(@"Next Day-----------");
    self.government.averagePrice  = 17;
    self.government.pension = 600;
    NSLog(@"Next Day-----------");
    self.government.salary = 1500;
    self.government.averagePrice  = 20;
    self.government.pension = 550;
    NSLog(@"Next Day-----------");
    self.government.taxLevel = 13.f;
    self.government.averagePrice  = 25;
    self.government.pension = 850;
    NSLog(@"Next Day-----------");
    self.government.taxLevel = 20.f;
    self.government.salary = 1401;

    return YES;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)governmentNotificator:(NSNotification*) notif{
    NSLog(@"%@", notif.userInfo);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     NSLog(@"App Sleep");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
        NSLog(@"App  Wake up");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"App BecomeActive");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
