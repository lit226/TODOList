#import <Foundation/Foundation.h>

#import "ListViewData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DefaultPageViewData : NSObject

@property (nonatomic, strong, readonly) NSString *titleText;
@property (nonatomic, strong, readonly) NSString *descriptionText;
@property (nonatomic, strong, readonly) NSString *buttonText;
@property (nonatomic, strong, readonly) ListViewData *viewData;
@property (nonatomic) bool isDefault;

- (instancetype) initWithTitleText:(NSString *)titleText descriptionText:(NSString *)descriptionText buttonText:(NSString *)buttonString viewData:(ListViewData *)viewData;

@end

NS_ASSUME_NONNULL_END
