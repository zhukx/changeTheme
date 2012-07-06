//
//  ZHUThemeMgr.h
//  zhukxContact
//
//  Created by zhukx on 6/24/12.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHUThemeMgr : NSObject {
    NSString *_themePath;
    NSString *_themeName;
    NSDictionary *_themesDic;
    NSArray *_themeArr;
    NSInteger _index;
}

+ (id)defaultThemeMgr;
- (NSString *)curName;
- (void)changeNextTheme;
- (void)changePreTheme;
- (void)changeTheme:(NSString *)name;
- (id)resourceForKey:(NSString *)key;
@end
