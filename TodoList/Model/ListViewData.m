#import "ListViewData.h"

@implementation ListViewData

- (nonnull instancetype)initWithTitleText:(nonnull NSString *)titleText 
                          descriptionText:(nullable NSString *)descriptionText
                                     task:(nullable NSMutableArray<NSString *> *)task
                        isFullListVisible:(BOOL)isFullListVisible {
    if (self = [super init]) {
        _titleText = titleText;
        _descriptionText = descriptionText;
        _task = task;
        _isFullListVisible = isFullListVisible;
    }

    return self;
}

@end
