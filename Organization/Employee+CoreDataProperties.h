#import "Employee+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;
- (NSString *)fullName;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) int32_t salary;
@property (nullable, nonatomic, retain) Organization *org;

@end

NS_ASSUME_NONNULL_END
