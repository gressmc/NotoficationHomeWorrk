//
//  Government.h
//  NotificationTest
//
//  Created by gressmc on 05/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* const GovernmentTaxLevelDidChangeNotification;
extern NSString* const GovernmentPensionDidChangeNotification;
extern NSString* const GovernmentSalaryDidChangeNotification;
extern NSString* const GovernmentAveragePriceDidChangeNotification;

extern NSString* const GovernmentTaxLevelUserInfoKey;
extern NSString* const GovernmentPensionUserInfoKey;
extern NSString* const GovernmentSalaryUserInfoKey;
extern NSString* const GovernmentAveragePriceUserInfoKey;

@interface Government : NSObject

@property(assign,nonatomic) CGFloat taxLevel;
@property(assign,nonatomic) CGFloat salary;
@property(assign,nonatomic) CGFloat pension;
@property(assign,nonatomic) CGFloat averagePrice;

@end
