#import <Foundation/Foundation.h>

#import "ListViewData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataPersistenceManager : NSObject

+ (DataPersistenceManager *)shared;

- (void)saveDataWithViewData:(ListViewData *)viewData;

- (NSMutableArray<ListViewData *> *)fetchData;

@end

NS_ASSUME_NONNULL_END
