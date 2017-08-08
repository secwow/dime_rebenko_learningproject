#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (nonatomic, readwrite) NSString *firstName;
@property (nonatomic, readwrite) NSString *lastName;
@property (nonatomic, readwrite) NSInteger salary;
@property (nonatomic, readonly) NSString *fullName;

-(id) initWithFirstName:(NSString *)firstname lastNameInit:(NSString *)lastname initSalary:(NSInteger)initsalary;

@end
