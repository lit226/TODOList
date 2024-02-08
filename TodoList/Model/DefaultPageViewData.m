#import "DefaultPageViewData.h"

@implementation DefaultPageViewData

- (nonnull instancetype)initWithTitleText:(nonnull NSString *)titleText descriptionText:(nonnull NSString *)descriptionText buttonText:(nonnull NSString *)buttonString viewData:(nonnull ListViewData *)viewData {
    self = [super init];
    if (self) {
        _titleText = titleText;
        _descriptionText = descriptionText;
        _buttonText = buttonString;
        _viewData = viewData;
    }

    return self;
}

@end
