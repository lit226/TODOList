#import <Foundation/Foundation.h>

#import "DefaultPageViewData.h"
#import "ListViewData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewManager : NSObject

@property (nonatomic, strong) NSMutableArray<ListViewData *> *viewDatas;

- (NSMutableArray<ListViewData *> *)getViewDatas;

- (DefaultPageViewData *)getDefaultViewData;

- (void)saveData:(ListViewData *)viewData;

+ (ListViewManager *)shared;

@end

NS_ASSUME_NONNULL_END
