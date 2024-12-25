//
//  XMDBUserAccountStoreSQL.h
//  XTeamTalk
//
//  Created by jison on 2018/1/9.
//  Copyright © 2018年 X-Men. All rights reserved.
//

#ifndef XMDBUserAccountStoreSQL_h
#define XMDBUserAccountStoreSQL_h

#define     USER_TABLE_NAME                 @"accounts"

#define     SQL_CREATE_USER_TABLE           @"CREATE TABLE IF NOT EXISTS %@(\
                                            uid INTEGER DEFAULT (0),\
                                            name TEXT,\
                                            avatar TEXT,\
                                            sex INTEGER DEFAULT (0),\
                                            des TEXT,\
                                            token TEXT,\
                                            ipinfo TEXT,\
                                            ext1 TEXT,\
                                            PRIMARY KEY(uid))"

#define     SQL_UPDATE_USER                 @"REPLACE INTO %@ (uid, name, avatar, sex, des, token, ipinfo, ext1) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"

#define     SQL_SELECT_USER_BY_ID           @"SELECT * FROM %@ WHERE uid = %@"

#define     SQL_SELECT_USERS                @"SELECT * FROM %@"

#define     SQL_DELETE_USER                 @"DELETE FROM %@ WHERE uid = %@"

#endif /* XMDBUserAccountStoreSQL_h */
