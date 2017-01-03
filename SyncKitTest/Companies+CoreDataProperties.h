//
//  Companies+CoreDataProperties.h
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import "Companies+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Companies (CoreDataProperties)

+ (NSFetchRequest<Companies *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *cName;
@property (nullable, nonatomic, copy) NSString *cAddress;
@property (nullable, nonatomic, retain) NSSet<Departments *> *departmentsofcompany;

@end

@interface Companies (CoreDataGeneratedAccessors)

- (void)addDepartmentsofcompanyObject:(Departments *)value;
- (void)removeDepartmentsofcompanyObject:(Departments *)value;
- (void)addDepartmentsofcompany:(NSSet<Departments *> *)values;
- (void)removeDepartmentsofcompany:(NSSet<Departments *> *)values;

@end

NS_ASSUME_NONNULL_END
