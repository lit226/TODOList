#import "ListViewData.h"

@implementation ListViewData

- (nonnull instancetype)initWithTitleText:(nonnull NSString *)titleText 
                          descriptionText:(nullable NSString *)descriptionText
                                     task:(nullable NSMutableArray<NSString *> *)task
                       viewControllerType:(presentingViewControllerType)viewControllerType {
    if (self = [super init]) {
        _titleText = titleText;
        _descriptionText = descriptionText;
        _task = task;
        _viewControllerType = viewControllerType;
    }

    return self;
}

@end
