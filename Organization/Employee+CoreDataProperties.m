#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest
{
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

-(void)setFullName:(NSString*) string
{
    self.fullName = string;
}

- (NSString *)fullName
{
    return [self.firstName stringByAppendingString:self.lastName];
}

@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic org;

@end
