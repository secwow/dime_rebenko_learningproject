#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


@synthesize managedObjectModel;
@synthesize managedObjectContext;
@synthesize persistentStoreCoordinator;
static NSManagedObjectContext* context;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    managedObjectModel = [self getObjectModel];
    NSLog(@"%@ fgdfg", [self managedObjectModel]);
    managedObjectContext = [self managedObjectContext];
    
    persistentStoreCoordinator = [self persistentStoreCoordinator];
    context = managedObjectContext;
    return YES;
}

+ (NSManagedObjectContext *) context
{
    return context;
}

- (NSManagedObjectModel *) getObjectModel
{
    if(managedObjectModel!=nil)
    {
        return managedObjectModel;
    }		
    
    NSURL *nsurl = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSLog(@"%@", nsurl.absoluteString);
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:nsurl];
    return managedObjectModel;
}

- (NSManagedObjectContext *)managedObjectContext {
    
    if(managedObjectContext != nil){
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if(coordinator != nil){
        managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return managedObjectContext;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if(persistentStoreCoordinator != nil){
        return persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Employer.sqlite"];
    NSLog(@"%@", [storeURL absoluteString]);
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: managedObjectModel];
    if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


+ (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectctx = context;
    
    if(managedObjectctx != nil)
    {
        if([managedObjectctx hasChanges] && ![managedObjectctx save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
    [AppDelegate saveContext];
}


@end
