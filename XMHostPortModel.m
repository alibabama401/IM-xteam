//
//  XMHostPortModel.m
//  XTeamTalk
//
//  Created by jison on 2018/1/9.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import "XMHostPortModel.h"

@implementation XMHostPortModel

MJExtensionCodingImplementation

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"host" : @"ip",
            };
}

+ (instancetype)model:(NSDictionary *)dict
{
    return [[self alloc] initModelWithDict:dict];
}

- (instancetype)initModelWithDict:(NSDictionary *)dict {
    XMHostPortModel *model = [XMHostPortModel mj_objectWithKeyValues:dict];
    return model;
}

@end
