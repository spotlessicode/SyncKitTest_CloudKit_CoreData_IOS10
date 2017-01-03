//
//  Employees+CoreDataProperties.m
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import "Employees+CoreDataProperties.h"

@implementation Employees (CoreDataProperties)

+ (NSFetchRequest<Employees *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employees"];
}

@dynamic eName;
@dynamic eStarted;
@dynamic departmentofemployee;

@end
