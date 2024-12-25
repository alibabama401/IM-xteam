//
//  XMUserAccountModel.m
//  XTeamTalk
//
//  Created by jison on 2018/1/6.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import "XMUserAccountModel.h"
#import "XMHostPortModel.h"

@implementation XMUserAccountModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"resCode" : @"res",
             @"token" : @"tk",
             @"ID"   : @"uid",
             @"name" : @"nm",
             @"avatar" : @"avt",
             @"districtCode" :@"dm",
             @"phoneNum" : @"pho",
             @"email" : @"eml",
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"ipinfo" : @"XMHostPortModel",
             };
}

+ (instancetype)model:(NSDictionary *)dict
{
    return [[self alloc] initModelWithDict:dict];
}

- (instancetype)initModelWithDict:(NSDictionary *)dict {
    XMUserAccountModel *model = [XMUserAccountModel mj_objectWithKeyValues:dict];
    model.srcStr = [dict mj_JSONString];
    
    return model;
}

#pragma mark - NSCopying


- (instancetype)copyWithZone:(NSZone *)zone {
    
//    XMUserAccountModel *model = [[[self class] allocWithZone:zone] init];
    XMUserAccountModel *model = [super copyWithZone:zone];

    model.resCode = self.resCode;
    model.ipinfo = self.ipinfo;
    model.token = self.token;
    model.srcStr = self.srcStr;
    
    return model;
}

@end

