//
//  XMUserAccountModel.h
//  XTeamTalk
//
//  Created by jison on 2018/1/6.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMUserInfoModel.h"

@class XMHostPortModel;

@interface XMUserAccountModel : XMUserInfoModel

/*
 * 返回状态码
 */
@property (nonatomic, assign) NSInteger resCode;

// ips
@property (nonatomic, copy) NSArray<XMHostPortModel *> *ipinfo;

/// token
@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *srcStr;


+ (instancetype)model:(NSDictionary *)dict;

- (instancetype)initModelWithDict:(NSDictionary *)dict;

@end
