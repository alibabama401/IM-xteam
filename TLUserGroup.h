//
//  TLUserGroup.h
//  XMTeamTalk
//
//  Created by harry on 17/11/26.
//  Copyright © 2017年 X-Men. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLUser.h"

@interface TLUserGroup : NSObject

@property (nonatomic, strong) NSString *groupName;

@property (nonatomic, strong) NSMutableArray *users;

@property (nonatomic, assign, readonly) NSInteger count;

- (id)initWithGroupName:(NSString *)groupName users:(NSMutableArray *)users;

- (void)addObject:(id)anObject;

- (id)objectAtIndex:(NSUInteger)index;

@end
