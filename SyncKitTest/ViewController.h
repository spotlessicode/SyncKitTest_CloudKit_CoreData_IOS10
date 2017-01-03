//
//  ViewController.h
//  SyncKitTest
//
//  Created by Eva Puskas on 2017. 01. 03..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (weak, nonatomic) IBOutlet UIButton *addDepartment;
@property (weak, nonatomic) IBOutlet UIButton *addEmployees;
@property (weak, nonatomic) IBOutlet UIButton *Sync;
- (IBAction)createDep:(id)sender;
- (IBAction)createEmp:(id)sender;
- (IBAction)startSync:(id)sender;

@end

