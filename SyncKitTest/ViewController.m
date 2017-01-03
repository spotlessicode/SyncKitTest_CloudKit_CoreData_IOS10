//
//  ViewController.m
//  SyncKitTest
//
//  Created by Eva Puskas on 2017. 01. 03..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Companies+CoreDataProperties.h"
#import "Departments+CoreDataProperties.h"
#import "Employees+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize managedObjectModel, managedObjectContext;

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    NSUserDefaults *firstRun = [NSUserDefaults standardUserDefaults];
    if ([firstRun boolForKey:@"FirstLaunched"])
    {
        // app already launched
        NSLog(@"APP ALREADY LAUNCHED");
        
    }else{
        [firstRun setBool:YES forKey:@"FirstLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // first launch ever
        NSLog(@"APP FIRST LAUNCH EVER");
        [self importCoreDataDefaults];
    }

}
-(void)importCoreDataDefaults{
    
    AppDelegate *appdelegate =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext =appdelegate.managedObjectContext;
    self.managedObjectModel =appdelegate.managedObjectModel;
    
    
    Companies *c1= [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:self.managedObjectContext];
    c1.cName = @"FirstCompany";
    c1.cAddress = @"MilkyWay1";
    
    Companies *c2= [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:self.managedObjectContext];
    c2.cName = @"FirstCompany";
    c2.cAddress = @"MilkyWay1";
    
    Companies *c3= [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:self.managedObjectContext];
    c3.cName = @"FirstCompany";
    c3.cAddress = @"MilkyWay1";
    
    Companies *c4= [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:self.managedObjectContext];
    c4.cName = @"FirstCompany";
    c4.cAddress = @"MilkyWay1";
    
    Companies *c5= [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:self.managedObjectContext];
    c5.cName = @"FirstCompany";
    c5.cAddress = @"MilkyWay1";
    
    
    [self.managedObjectContext save:nil];
    NSLog(@"import saved");
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appdelegate =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext =appdelegate.managedObjectContext;
    self.managedObjectModel =appdelegate.managedObjectModel;
    
    NSFetchRequest *request =
    [[self.managedObjectModel fetchRequestTemplateForName:@"getAllCompanies"]copy];
    NSArray *companiesArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"companiesArray count %lu", (unsigned long)companiesArray.count);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createDep:(id)sender {
    AppDelegate *appdelegate =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext =appdelegate.managedObjectContext;
    self.managedObjectModel =appdelegate.managedObjectModel;
    
    NSFetchRequest *request =
    [[self.managedObjectModel fetchRequestTemplateForName:@"getAllDepartments"]copy];
    NSArray *departmentsArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"departmentsArray count %lu", (unsigned long)departmentsArray.count);
    NSLog(@"departmentsArray %@", departmentsArray);
    float count = departmentsArray.count;
    NSString  *nameString = [NSString stringWithFormat:@"depName%f",count];
    float budget =count+1000;
    
    Departments *d1= [NSEntityDescription insertNewObjectForEntityForName:@"Departments" inManagedObjectContext:self.managedObjectContext];
    d1.dName = nameString;
    d1.dBudget=budget;
    d1.dCreated=[NSDate date];
    [self.managedObjectContext save:nil];
    NSLog(@"d1 saved");
}

- (IBAction)createEmp:(id)sender {
    AppDelegate *appdelegate =(AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext =appdelegate.managedObjectContext;
    self.managedObjectModel =appdelegate.managedObjectModel;
    
    NSFetchRequest *request =
    [[self.managedObjectModel fetchRequestTemplateForName:@"getAllEmployees"]copy];
    NSArray *employeesArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"employeesArray count %lu", (unsigned long)employeesArray.count);
    NSLog(@"employeesArray %@", employeesArray);
    float ecount = employeesArray.count;
    NSString  *enameString = [NSString stringWithFormat:@"empName%f",ecount];
    
    Employees *e1= [NSEntityDescription insertNewObjectForEntityForName:@"Employees" inManagedObjectContext:self.managedObjectContext];
    e1.eName = enameString;
    e1.eStarted=[NSDate date];
    [self.managedObjectContext save:nil];
    NSLog(@"e1 saved");
}

- (IBAction)startSync:(id)sender {
    
    NSLog(@"startSync");
    AppDelegate *appdelegate =(AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdelegate sync];
}
@end
