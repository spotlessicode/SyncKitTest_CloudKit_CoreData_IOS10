//
//  Companies+CoreDataProperties.m
//  
//
//  Created by Eva Puskas on 2017. 01. 03..
//
//

#import "Companies+CoreDataProperties.h"

@implementation Companies (CoreDataProperties)

+ (NSFetchRequest<Companies *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Companies"];
}

@dynamic cName;
@dynamic cAddress;
@dynamic departmentsofcompany;

@end
