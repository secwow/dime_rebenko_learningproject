#import "Organization+CoreDataProperties.h"
#import "Employee+CoreDataClass.h"

@implementation Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Organization"];
}

- (void)removeEmplsObject:(Employee *)value
{
    for(Employee *empl in self.empls)
    {
        if([empl.fullName isEqualToString:value.fullName])
        {
            NSMutableSet *mutableSet = [self.empls mutableCopy];
            [mutableSet removeObject:empl];
            [self willChangeValueForKey:@"empls"];
            self.empls = [mutableSet copy];
            [self setValue:self.empls forKey:@"empls"];
            [self didChangeValueForKey:@"empls"];
            break;
        }
        
    }
}

- (void)removeObjectFromEmplsAtIndex:(NSUInteger)idx
{
    NSMutableOrderedSet *mutableSet = [self.empls mutableCopy];
    [mutableSet removeObjectAtIndex:idx];
    [self willChangeValueForKey:@"empls"];
    self.empls = [mutableSet mutableCopy];
    [self setValue:self.empls forKey:@"empls"];
    [self didChangeValueForKey:@"empls"];
}

@dynamic name;
@dynamic empls;

@end
