//
//  XMDBUserAccountStore.m
//  XTeamTalk
//
//  Created by jison on 2018/1/9.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import "XMDBManager.h"
#import "XMUserAccountModel+WCTTableCoding.h"
#import "XMDBUserAccountStore.h"
#import "XMUserAccountModel.h"
#import "XMDBUserAccountStoreSQL.h"

@interface XMDBUserAccountStore ()

@property (nonatomic, readonly, strong) WCTDatabase *dataBase;

@end

@implementation XMDBUserAccountStore
- (id)init
{
    if (self = [super init]) {
        BOOL ok = [self createTable];
        if (!ok) {
            XMLog(@"DB: 账号表创建失败");
        }
    }
    return self;
}

- (WCTDatabase *)dataBase {
    
    return [XMPublicDBManager sharedInstance].database;
}

- (BOOL)createTable
{
    NSString *sqlString = [NSString stringWithFormat:SQL_CREATE_USER_TABLE, USER_TABLE_NAME];
    return [self.dataBase createTableAndIndexesOfName:USER_TABLE_NAME withClass:XMUserAccountModel.class];
}

- (BOOL)updateUser:(XMUserAccountModel *)user
{
    BOOL ok = [self.dataBase insertOrReplaceObject:user into:USER_TABLE_NAME];
    return ok;
}

- (XMUserAccountModel *)userByID:(NSString *)userID
{
    XMUserAccountModel * user = [self.dataBase getOneObjectOfClass:XMUserAccountModel.class fromTable:USER_TABLE_NAME where:XMUserAccountModel.ID == userID];

    return [self p_handelModel:user];
}

- (NSArray *)userData
{
    NSMutableArray *data = [[NSMutableArray alloc] init];

    NSArray *tempArray = [self.dataBase getAllObjectsOfClass:XMUserAccountModel.class fromTable:USER_TABLE_NAME];
    
    [tempArray enumerateObjectsUsingBlock:^(XMUserAccountModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [data addSafeObject:[self p_handelModel:obj]];

    }];

    return data;
}

- (BOOL)deleteUsersByUid:(NSString *)uid
{
    BOOL ok = [self.dataBase deleteObjectsFromTable:USER_TABLE_NAME where:XMUserAccountModel.ID == uid];
    return ok;
}

#pragma mark - # Private Methods

- (XMUserAccountModel *)p_handelModel:(XMUserAccountModel*)model
{
    NSString *ipinfo = model.srcStr;
    id ipinfoObj = [ipinfo mj_JSONObject];
    
    if ([ipinfoObj isKindOfClass:[NSDictionary class]]) {
        XMUserAccountModel *user = [XMUserAccountModel model:ipinfoObj];
        
//        // name
//        NSString *name = model.name;
//        if (![name isEqualToString: user.name] && name.length > 0) {
//            user.name = name;
//        }
//
//        // avatar
//        NSString *avatar = model.avatar;
//        if (![avatar isEqualToString: user.avatar] && avatar.length > 0) {
//            user.avatar = avatar;
//        }
//
//        // desc
//        NSString *des = model.des;
//        if (![des isEqualToString: user.des] && des.length > 0) {
//            user.des = des;
//        }
//
//
        return user;
    }
    
    return nil;
}

@end
