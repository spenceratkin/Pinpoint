//
//  UserData.m
//  Pinpoint
//
//  Created by Spencer Atkin on 8/6/15.
//  Copyright (c) 2015 Pinpoint-DCHacks. All rights reserved.
//

#import "UserData.h"

@implementation UserData

+ (instancetype)sharedInstance {
    static dispatch_once_t p = 0;
    static UserData *_sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

+ (Firebase *)sharedRef {
    static dispatch_once_t o = 0;
    static Firebase *_sharedRef = nil;
    
    dispatch_once(&o, ^{
        _sharedRef = [[Firebase alloc] initWithUrl: @"pinpoint.firebaseio.com"];
    });
    return _sharedRef;
}

- (void)load {
    NSLog(@"Loading data");
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    self.username = [def objectForKey:@"username"];
    self.name = [def objectForKey:@"name"];
    self.number = [def objectForKey:@"number"];
    self.email = [def objectForKey:@"email"];
    self.uid = [def objectForKey:@"firebase.uid"];
    self.password = [def objectForKey:@"password"];
    [def synchronize];
}

- (void)save {
    NSLog(@"Saving data");
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:self.username forKey:@"username"];
    [def setObject:self.name forKey:@"name"];
    [def setObject:self.number forKey:@"number"];
    [def setObject:self.email forKey:@"email"];
    [def setObject:self.uid forKey:@"firebase.uid"];
    [def setObject:self.password forKey:@"password"];
    [def synchronize];
}

@end