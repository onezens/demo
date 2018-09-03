//
//  DataBaseMgr.m
//  Sqlite3Demo
//
//  Created by wz on 2018/9/3.
//  Copyright © 2018年 wz. All rights reserved.
//

#import "DataBaseMgr.h"
#import <sqlite3.h>

@interface DataBaseMgr()

@end

@implementation DataBaseMgr

static sqlite3 *_db;
static dispatch_queue_t _dbQueue;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self initDatabase];
    });
}

+ (void)initDatabase{
    _dbQueue = dispatch_queue_create("YCDownloadDB_Queue", DISPATCH_QUEUE_SERIAL);
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    path = [path stringByAppendingPathComponent:@"download.db"];
    if (sqlite3_open(path.UTF8String, &_db) != SQLITE_OK) {
        NSLog(@"[db error]");
        return;
    }
    NSString *sql = @"create table if not exists t_contact (id integer primary key autoincrement,name text,phone text);";
    [self performBlock:^BOOL{ return [self execSql:sql]; } sync:true] ? NSLog(@"[init db success]") : false;
}

+ (BOOL)performBlock:(BOOL (^)(void))block sync:(BOOL)sync {
    __block BOOL result = false;
    if (sync) {
        dispatch_sync(_dbQueue, ^{
            result = block();
        });
    }else{
        dispatch_async(_dbQueue, ^{
            block();
        });
        result = true;
    }
    return result;
}

+ (BOOL)execSql:(NSString *)sql {
    char *error = NULL;
    sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
    error ? NSLog(@"[execSql error] %s", error) : false;
    return error == NULL;
}
//while (sqlite3_step(stmt) == SQLITE_ROW) {}
+ (void)selectSql:(NSString *)sql results:(void (^)(sqlite3_stmt *stmt))results {
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(_db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
        results(stmt);
    }
}


+ (void)log {
//    for(int i=0;i<200 ;i++){
//        [self performBlock:^BOOL{
//            int time = arc4random_uniform(5);
//            sleep(time);
//            NSLog(@"%d",i);
//            return true;
//        } sync:false];
//    }
}






















@end
