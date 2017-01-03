//
//  Employees+CoreDataProperties.h
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import "Employees+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employees (CoreDataProperties)

+ (NSFetchRequest<Employees *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *eName;
@property (nullable, nonatomic, copy) NSDate *eStarted;
@property (nullable, nonatomic, retain) Departments *departmentofemployee;

@end

NS_ASSUME_NONNULL_END
