//
//  XMDBUserAccountStore.h
//  XTeamTalk
//
//  Created by jison on 2018/1/9.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMUserAccountModel;

@interface XMDBUserAccountStore : NSObject

/**
 *  更新用户信息
 */
- (BOOL)updateUser:(XMUserAccountModel *)user;

/**
 *  获取用户信息
 */
- (XMUserAccountModel *)userByID:(NSString *)userID;

/**
 *  查询所有用户
 */
- (NSArray *)userData;

/**
 *  删除用户
 */
- (BOOL)deleteUsersByUid:(NSString *)uid;

@end


