//
//  Employee+CoreDataProperties.m
//  Organization
//
//  Created by New user on 08.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

-(void)setFullName:(NSString*) string {
    
}
- (NSString *)fullName{
    return [self.firstName stringByAppendingString:self.lastName];
}

@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic org;

@end
