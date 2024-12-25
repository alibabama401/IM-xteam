//
//  XMDistrictCodeModel.m
//  XTeamTalk
//
//  Created by 蔡景松 on 2017/12/21.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "XMDistrictCodeModel.h"

@implementation XMDistrictCodeModel

- (instancetype)initDistrictCodeWithDict:(NSDictionary *)dict {
    XMDistrictCodeModel *code = [[XMDistrictCodeModel alloc] init];
    code.name = dict[@"Name"];
    code.number = dict[@"Number"];
    return code;
}

+ (instancetype)districtCodeWithDict:(NSDictionary *)dict {
    XMDistrictCodeModel *code = [[XMDistrictCodeModel alloc] initDistrictCodeWithDict:dict];
    return code;
}

@end
