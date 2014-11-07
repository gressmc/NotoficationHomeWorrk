//
//  Pensioner.m
//  NotoficationHomeWorrk
//
//  Created by gressmc on 06/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(pensionDidNotificator:)
                   name:GovernmentPensionDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceDidNotificator:)
                   name:GovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(enterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(enterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)pensionDidNotificator:(NSNotification*) notification{
    NSNumber* valuePension = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
       CGFloat pension = [valuePension floatValue];
    if (pension > self.pension){
        NSLog(@"-----\n  Pensioner happy \n  pension_old = %.2f \n  pension_new = %.2f",self.pension,pension);
    } else {
        NSLog(@"-----\n  Pensioner dont happy \n  pension_old = %.2f \n  pension_new = %.2f",self.pension,pension);
    }
    self.pension=pension;
}

-(void)averagePriceDidNotificator:(NSNotification*) notification{
    
    NSLog(@"-----\n  Pensioner does not rejoice in the average price %.2f", [[notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey] floatValue]);
}

-(void)enterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"Pensioner Sleep");
}

-(void)enterForegroundNotification:(NSNotification*) notification{
    NSLog(@"Pensioner Wake up");
}

@end
