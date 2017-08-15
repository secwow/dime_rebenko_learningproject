@class Employee;
@class Organization;

@protocol DataAccessProtocol <NSObject>

- (Employee *)saveEmployee:(NSString *)firstName lastName:(NSString *)lastName salary:(NSInteger)salary birthDate:(NSDate *)date;
- (Organization *)saveOrganization:(NSString *)orgName;
- (NSArray<Organization *> *)getAllOrganization;

@end
