//
//  Organization+CoreDataProperties.h
//  Organization
//
//  Created by New user on 08.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import "Organization+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<Employee *> *empls;


@end

@interface Organization (CoreDataGeneratedAccessors)

- (void)insertObject:(Employee *)value inEmplsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEmplsAtIndex:(NSUInteger)idx;
- (void)insertEmpls:(NSArray<Employee *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEmplsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEmplsAtIndex:(NSUInteger)idx withObject:(Employee *)value;
- (void)replaceEmplsAtIndexes:(NSIndexSet *)indexes withEmpls:(NSArray<Employee *> *)values;
- (void)addEmplsObject:(Employee *)value;
- (void)removeEmplsObject:(Employee *)value;
- (void)addEmpls:(NSOrderedSet<Employee *> *)values;
- (void)removeEmpls:(NSOrderedSet<Employee *> *)values;


@end

NS_ASSUME_NONNULL_END
