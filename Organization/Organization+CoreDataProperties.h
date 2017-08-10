#import "Organization+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<Employee *> *empls;

@end

@interface Organization (CoreDataGeneratedAccessors)

- (void)removeObjectFromEmplsAtIndex:(NSUInteger)idx;
- (void)addEmplsObject:(Employee *)value;
- (void)removeEmplsObject:(Employee *)value;

@end

NS_ASSUME_NONNULL_END
