//
//  ZHUConfigMgr.h
//  zhukxContact
//
//  Created by zhukx on 6/24/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHUConfigMgr : NSObject
+ (id)defaultConfigMgr;
- (void)setValue:(id)value forKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;
@end
