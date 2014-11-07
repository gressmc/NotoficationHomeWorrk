//
//  MyAppDelegate.m
//  NotoficationHomeWorrk
//
//  Created by gressmc on 07/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "MyAppDelegate.h"

@implementation MyAppDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(enterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(enterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(didBecomeActiveNotification:)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
        
    }
    return self;
}


-(void)enterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"my App Sleep");
}

-(void)enterForegroundNotification:(NSNotification*) notification{
    NSLog(@"my App Wake up");
}

-(void)didBecomeActiveNotification:(NSNotification*) notification{
    NSLog(@"my App BecomeActive");
}
@end
