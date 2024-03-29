#import "ListViewManager.h"

#import "DataPersistenceManager.h"
#import "DefaultPageViewData.h"

@implementation ListViewManager

+ (nonnull ListViewManager *)shared {
    static dispatch_once_t pred = 0;
       static id _sharedObject = nil;
       dispatch_once(&pred, ^{
           _sharedObject = [[self alloc] init];
       });
       return _sharedObject;
}

- (nonnull DefaultPageViewData *)getDefaultViewData {
    ListViewData *listViewData = [[ListViewData alloc] initWithTitleText:@"This is a demo list" descriptionText:@"Here add the things that you want to do" task:nil viewControllerType:presentingViewControllerTypeDefaultViewController];
    DefaultPageViewData *viewData = [[DefaultPageViewData alloc] initWithTitleText:@"TODO LIST" descriptionText:@"This is a todo list " buttonText:@"Create" viewData:listViewData];

    return viewData;
}

// Add logic to save data in persistence storage
- (void)saveData:(nonnull ListViewData *)viewData {
//    if (self.viewDatas.count == 0) {
//        self.viewDatas = [[NSMutableArray alloc] init];
//    }
//
//    [self.viewDatas addObject:viewData];
    [[DataPersistenceManager shared] saveDataWithViewData:viewData];
}

- (nonnull NSMutableArray<ListViewData *> *)getViewDatas {
    return [[DataPersistenceManager shared] fetchData];
}

@end
