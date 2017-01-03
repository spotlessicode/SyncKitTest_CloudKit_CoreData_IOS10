//
//  AppDelegate.h
//  SyncKitTest
//
//  Created by Eva Puskas on 2017. 01. 03..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <SyncKit/QSCloudKitSynchronizer+CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate, QSCoreDataChangeManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic) BOOL FirstLaunched;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) QSCloudKitSynchronizer *synchronizer;
- (void)saveContext;
-(void)sync;

@end

