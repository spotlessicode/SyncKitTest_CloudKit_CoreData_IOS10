//
//  Departments+CoreDataProperties.h
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import "Departments+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Departments (CoreDataProperties)

+ (NSFetchRequest<Departments *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dName;
@property (nonatomic) float dBudget;
@property (nullable, nonatomic, copy) NSDate *dCreated;
@property (nullable, nonatomic, retain) NSSet<Employees *> *employeesofdepartment;
@property (nullable, nonatomic, retain) Companies *companyofdepartment;

@end

@interface Departments (CoreDataGeneratedAccessors)

- (void)addEmployeesofdepartmentObject:(Employees *)value;
- (void)removeEmployeesofdepartmentObject:(Employees *)value;
- (void)addEmployeesofdepartment:(NSSet<Employees *> *)values;
- (void)removeEmployeesofdepartment:(NSSet<Employees *> *)values;

@end

NS_ASSUME_NONNULL_END
