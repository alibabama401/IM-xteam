//
//  XMDBUserAccountStore.m
//  XTeamTalk
//
//  Created by jison on 2018/1/9.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import "XMDBUserAccountStore.h"
#import "XMUserAccountModel.h"
#import "XMDBUserAccountStoreSQL.h"

@implementation XMDBUserAccountStore
- (id)init
{
    if (self = [super init]) {
        self.dbQueue = [XMPublicDBManager sharedInstance].publicQueue;
        BOOL ok = [self createTable];
        if (!ok) {
            XMLog(@"DB: 账号表创建失败");
        }
    }
    return self;
}

- (BOOL)createTable
{
    NSString *sqlString = [NSString stringWithFormat:SQL_CREATE_USER_TABLE, USER_TABLE_NAME];
    return [self createTable:USER_TABLE_NAME withSQL:sqlString];
}

- (BOOL)updateUser:(XMUserAccountModel *)user
{
    NSString *sqlString = [NSString stringWithFormat:SQL_UPDATE_USER, USER_TABLE_NAME];

    NSArray *arrPara = [NSArray arrayWithObjects:
                        @(user.ID),
                        XMNoNilString(user.name),
                        XMNoNilString(user.avatar),
                        @(user.sex),
                        XMNoNilString(user.des),
                        XMNoNilString(user.token),
                        XMNoNilString(user.srcStr),
                        @"",
                        nil];
    BOOL ok = [self excuteSQL:sqlString withArrParameter:arrPara];
    return ok;
}

- (XMUserAccountModel *)userByID:(NSString *)userID
{
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USER_BY_ID, USER_TABLE_NAME, userID];
    __block XMUserAccountModel * user;
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            user = [self p_createUserByFMResultSet:retSet];
        }
        [retSet close];
    }];
    return user;
}

- (NSArray *)userData
{
    __block NSMutableArray *data = [[NSMutableArray alloc] init];
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USERS, USER_TABLE_NAME];
    
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            XMUserAccountModel *user = [self p_createUserByFMResultSet:retSet];
            [data addSafeObject:user];
        }
        [retSet close];
    }];
    
    return data;
}

- (BOOL)deleteUsersByUid:(NSString *)uid
{
    NSString *sqlString = [NSString stringWithFormat:SQL_DELETE_USER, USER_TABLE_NAME, uid];
    BOOL ok = [self excuteSQL:sqlString, nil];
    return ok;
}

#pragma mark - # Private Methods

- (XMUserAccountModel *)p_createUserByFMResultSet:(FMResultSet *)retSet
{
    NSString *ipinfo = [retSet stringForColumn:@"ipinfo"];
    id ipinfoObj = [ipinfo mj_JSONObject];
    
    if ([ipinfoObj isKindOfClass:[NSDictionary class]]) {
        XMUserAccountModel *user = [XMUserAccountModel model:ipinfoObj];
        
        // name
        NSString *name = [retSet stringForColumn:@"name"];
        if (![name isEqualToString: user.name] && name.length > 0) {
            user.name = name;
        }
        
        // avatar
        NSString *avatar = [retSet stringForColumn:@"avatar"];
        if (![avatar isEqualToString: user.avatar] && avatar.length > 0) {
            user.avatar = avatar;
        }
        
        // desc
        NSString *des = [retSet stringForColumn:@"des"];
        if (![des isEqualToString: user.des] && des.length > 0) {
            user.des = des;
        }
    
      
        return user;
    }
    
    return nil;
}

@end
