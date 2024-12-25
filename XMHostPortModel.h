//
//  XMHostPortModel.h
//  XTeamTalk
//
//  Created by jison on 2018/1/9.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMHostPortModel : NSObject

@property (nonatomic, copy) NSString *host;
@property (nonatomic, assign) NSInteger port;

+ (instancetype)model:(NSDictionary *)dict;
- (instancetype)initModelWithDict:(NSDictionary *)dict;

@end
