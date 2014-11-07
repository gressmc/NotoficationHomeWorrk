//
//  Entrepreneur.m
//  NotoficationHomeWorrk
//
//  Created by gressmc on 06/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "Entrepreneur.h"
#import "Government.h"

@implementation Entrepreneur

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(taxLevelDidNotificator:)
                   name:GovernmentTaxLevelDidChangeNotification
                 object:nil];
        
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

-(void)taxLevelDidNotificator:(NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    
    CGFloat taxLevel = [value floatValue];
    CGFloat salaryWithoutTaxesNew = _salary - _salary*taxLevel/100;
    CGFloat salaryWithoutTaxesOld = _salary - _salary*_taxLevel/100;
    
    if (salaryWithoutTaxesNew > salaryWithoutTaxesOld) {
        NSLog(@"-----\n  Entrepreneur happy \n  taxLevel_old = %.2f \n  taxLevel_new = %.2f",self.taxLevel,taxLevel);
    } else {
        NSLog(@"-----\n  Entrepreneur dont happy \n  taxLevel_old = %.2f \n  taxLevel_new = %.2f",self.taxLevel,taxLevel);
    }
    
    self.taxLevel=taxLevel;
    NSLog(@"-----\n  Entrepreneur - %.2f", taxLevel);
}

-(void)salaryDidNotificator:(NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue]*5;
    CGFloat salaryWithoutTaxesNew = salary - salary*_taxLevel/100;
    CGFloat salaryWithoutTaxesOld = _salary - _salary*_taxLevel/100;
    
    if (salaryWithoutTaxesNew > salaryWithoutTaxesOld) {
        NSLog(@"-----\n  Entrepreneur happy \n  salary_old = %.2f \n  salary_new = %.2f",salaryWithoutTaxesOld,salaryWithoutTaxesNew);
    } else {
        NSLog(@"-----\n  Entrepreneur dont happy \nsalary_old = %.2f \nsalary_new = %.2f",salaryWithoutTaxesOld,salaryWithoutTaxesNew);
    }
    self.salary=salary;
}

-(void)averagePriceDidNotificator:(NSNotification*) notification{
    
    NSLog(@"-----\n  Entrepreneur does not rejoice in the average price %.2f", [[notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey] floatValue]);
}

-(void)enterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"Entrepreneur Sleep");
}

-(void)enterForegroundNotification:(NSNotification*) notification{
    NSLog(@"Entrepreneur Wake up");
}

@end
