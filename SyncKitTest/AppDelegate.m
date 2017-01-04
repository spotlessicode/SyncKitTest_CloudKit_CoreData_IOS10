//
//  AppDelegate.m
//  SyncKitTest
//
//  Created by Eva Puskas on 2017. 01. 03..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <SyncKit/QSCloudKitSynchronizer+CoreData.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
#define debug 1

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSDictionary *appDefaults = [NSDictionary
                                 dictionaryWithObject:[NSNumber numberWithBool:YES]
                                 forKey:@"iCloudEnabled"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    
    [self iCloudAccountIsSignedIn];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.colourbox.cloudkittest.prueba" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SyncKitTest" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SyncKitTest.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - ICLOUD
- (BOOL)iCloudAccountIsSignedIn {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    id token = [[NSFileManager defaultManager] ubiquityIdentityToken];
    if (token) {
        NSLog(@"** iCloud is SIGNED IN with token '%@' **", token);
        return YES;
    }
    return NO;
}

- (BOOL)iCloudEnabledByUser {
    
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"iCloudEnabled"] boolValue]) {
        NSLog(@"** iCloud is ENABLED in Settings **");
        return YES;
    }
    NSLog(@"** iCloud is DISABLED in Settings **");
    return NO;

}
#pragma mark - SYNC
- (QSCloudKitSynchronizer *)synchronizer
{
    if ([self iCloudEnabledByUser] && [self iCloudAccountIsSignedIn]) {
        NSLog(@"** iCloud available SYNCHRONIZER! **");
        if (!_synchronizer) {
            _synchronizer = [QSCloudKitSynchronizer cloudKitSynchronizerWithContainerName:@"iCloud.spotless.SyncKitTest" managedObjectContext:self.managedObjectContext changeManagerDelegate:self];
            NSLog(@"_synchronizer %@", _synchronizer);
        }
    }else{
        NSLog(@"** iCloud not available **");
    }
    return _synchronizer;
}
- (void)sync{
    NSLog(@"Synchronize View");
    [self.synchronizer synchronizeWithCompletion:^(NSError *error) {
        NSLog(@"Synchronize Complete");
        if (error) {
            NSLog(@"Synchronize ERROR");
            NSLog(@"%@", error);
            //[[NSNotificationCenter defaultCenter]postNotificationName:@"synced" object:self];
        }else{
            NSLog(@"Synchronize NO ERROR");
            NSFetchRequest *request =
            [[self.managedObjectModel fetchRequestTemplateForName:@"getAllCompanies"]copy];
            NSArray *companiesArray = [self.managedObjectContext executeFetchRequest:request error:nil];
            NSLog(@"companiesArray count %lu", (unsigned long)companiesArray.count);
            //[[NSNotificationCenter defaultCenter]postNotificationName:@"synced" object:self];
        }
    }];
}
#pragma mark - QSCoreDataChangeManagerDelegate

- (void)changeManagerRequestsContextSave:(QSCoreDataChangeManager *)changeManager completion:(void (^)(NSError *))completion
{
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    __block NSError *error = nil;
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext save:&error];
    }];
    completion(error);
}

- (void)changeManager:(QSCoreDataChangeManager *)changeManager didImportChanges:(NSManagedObjectContext *)importContext completion:(void (^)(NSError *))completion
{
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSFetchRequest *request =
    [[self.managedObjectModel fetchRequestTemplateForName:@"getAllCompanies"]copy];
    NSArray *companiesArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"did importChanges companiesArray count %lu", (unsigned long)companiesArray.count);
    
    __block NSError *error = nil;
    [importContext performBlockAndWait:^{
        [importContext save:&error];
    }];
    
    if (!error) {
        NSLog(@"Saved");
        [self.managedObjectContext performBlockAndWait:^{
            [self.managedObjectContext save:&error];
        }];
    }
    completion(error);
}


@end
