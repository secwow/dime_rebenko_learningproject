#import "Organization+CoreDataProperties.h"
#import "Employee+CoreDataClass.h"
@implementation Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest
{
    return [[NSFetchRequest alloc] initWithEntityName:@"Organization"];
}

@dynamic name;
@dynamic empls;

@end
