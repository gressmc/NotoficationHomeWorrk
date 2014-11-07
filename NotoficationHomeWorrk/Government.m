//
//  Government.m
//  NotificationTest
//
//  Created by gressmc on 05/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString* const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government
@synthesize taxLevel=_taxLevel, salary=_salary, pension=_pension, averagePrice=_averagePrice;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel=13.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10.f;
    }
    return self;
}

-(void) setTaxLevel:(CGFloat)taxLevel{
    _taxLevel = taxLevel;
    
    NSDictionary* dic = [NSDictionary dictionaryWithObject:@(taxLevel)
                                                    forKey:GovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dic];
}

-(void) setSalary:(CGFloat)salary{
    _salary = salary;
    
    NSDictionary* dic = [NSDictionary dictionaryWithObject:@(salary)
                                                    forKey:GovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dic];
}

-(void) setPension:(CGFloat)pension{
    _pension = pension;
    
    NSDictionary* dic = [NSDictionary dictionaryWithObject:@(pension)
                                                    forKey:GovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dic];
}

-(void) setAveragePrice:(CGFloat)averagePrice{
    _averagePrice = averagePrice;
    
    NSDictionary* dic = [NSDictionary dictionaryWithObject:@(averagePrice)
                                                    forKey:GovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dic];
}

-(CGFloat)taxLevel{
    return _taxLevel;
}

-(CGFloat)salary{
    return _salary;
}

-(CGFloat)pension{
    return _pension;
}

-(CGFloat)averagePrice{
    return _averagePrice;
}



@end
