#import "DataPersistenceManager.h"

//#import "ListDataModel.xcDataModel"
#import "ListDataModel.xcdatamodel"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@implementation DataPersistenceManager

+ (nonnull DataPersistenceManager *)shared {
    static dispatch_once_t pred = 0;
       static id _sharedObject = nil;
       dispatch_once(&pred, ^{
           _sharedObject = [[self alloc] init];
       });
       return _sharedObject;
}

- (void)saveDataWithViewData:(nonnull ListViewData *)viewData {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ListViewDatas" inManagedObjectContext:context];

    NSManagedObject *object = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    [object setValue:viewData forKey:@"viewData"];

    [context save:nil];
}

- (NSMutableArray<ListViewData *> *)fetchData {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ListViewDatas"];
    NSArray<NSManagedObject *> *object = (NSArray<NSManagedObject *> *)[context executeFetchRequest:request error:nil];

    NSMutableArray<ListViewData *> *viewData = [[NSMutableArray alloc] init];
    for (NSManagedObject *data in object) {
        ListViewData *listViewData = [data valueForKey:@"viewData"];
        [viewData addObject:listViewData];
    }

    return viewData;
}

@end
