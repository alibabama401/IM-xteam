//
//  XMUserAccountModel+WCTTableCoding.h
//  XTeamTalk
//
//  Created by jinbin on 2018/6/8.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#import <WCDB/WCDB.h>
#import "XMUserAccountModel.h"

@interface XMUserAccountModel (WCTTableCoding)<WCTTableCoding>

WCDB_PROPERTY(ID)
WCDB_PROPERTY(phoneNum)
WCDB_PROPERTY(email)
WCDB_PROPERTY(districtCode)
WCDB_PROPERTY(token)
WCDB_PROPERTY(srcStr)
@end
