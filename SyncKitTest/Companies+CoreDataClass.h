//
//  Companies+CoreDataClass.h
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <SyncKit/QSPrimaryKey.h>
@class Departments;

NS_ASSUME_NONNULL_BEGIN

@interface Companies : NSManagedObject <QSPrimaryKey>
@end

NS_ASSUME_NONNULL_END

#import "Companies+CoreDataProperties.h"
