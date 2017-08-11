#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest
{
    return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

- (NSString *)fullName
{
    return [self.firstName stringByAppendingString:self.lastName];
}

@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic birthDate;
@dynamic org;

@end
