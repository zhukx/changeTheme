//
//  ZHUConfigMgr.m
//  zhukxContact
//
//  Created by zhukx on 6/24/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "ZHUConfigMgr.h"

@implementation ZHUConfigMgr
+ (id)defaultConfigMgr {
    static ZHUConfigMgr *sharedMgr = nil;
    if (!sharedMgr) {
        sharedMgr = [[ZHUConfigMgr alloc] init];
    }
    return sharedMgr;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if (!value || !key.length) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)valueForKey:(NSString *)key {
    if (!key.length) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
@end
