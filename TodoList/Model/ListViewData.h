#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, presentingViewControllerType) {
    presentingViewControllerTypeDefaultViewController,
    presentingViewControllerTypeMainViewController
};

// View Data to show the complete list
@interface ListViewData : NSObject

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong, nullable) NSMutableArray<NSString *> *task;
@property (nonatomic, assign, readwrite) presentingViewControllerType viewControllerType;

- (instancetype)initWithTitleText:(NSString *)titleText descriptionText:(nullable NSString *)descriptionText task:(nullable NSMutableArray<NSString *> *)task viewControllerType:(presentingViewControllerType)viewControllerType;

@end

NS_ASSUME_NONNULL_END
