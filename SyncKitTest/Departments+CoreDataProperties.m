//
//  Departments+CoreDataProperties.m
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import "Departments+CoreDataProperties.h"

@implementation Departments (CoreDataProperties)

+ (NSFetchRequest<Departments *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Departments"];
}

@dynamic dName;
@dynamic dBudget;
@dynamic dCreated;
@dynamic employeesofdepartment;
@dynamic companyofdepartment;

@end
