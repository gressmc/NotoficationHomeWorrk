//
//  Doctor.m
//  NotificationTest
//
//  Created by gressmc on 06/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"

@implementation Doctor


- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(salaryDidNotificator:)
                   name:GovernmentSalaryDidChangeNotification
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

-(void)salaryDidNotificator:(NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
    if (salary > self.salary){
        NSLog(@"-----\n  Doctor happy \n  salary_old = %.2f \n  salary_new = %.2f",self.salary,salary);
    } else {
        NSLog(@"-----\n  Doctor dont happy \n  salary_old = %.2f \n  salary_new = %.2f",self.salary,salary);
    }
    self.salary=salary;
}

-(void)averagePriceDidNotificator:(NSNotification*) notification{
    
   NSLog(@"-----\n  Doctor does not rejoice in the average price %.2f", [[notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey] floatValue]);
}

-(void)enterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"Doctor Sleep");
}

-(void)enterForegroundNotification:(NSNotification*) notification{
    NSLog(@"Doctor Wake up");
}

@end
