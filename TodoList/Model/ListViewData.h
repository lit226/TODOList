#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListViewData : NSObject

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong, nullable) NSMutableArray<NSString *> *task;
@property (nonatomic, assign, readwrite) BOOL isFullListVisible;

- (instancetype)initWithTitleText:(NSString *)titleText descriptionText:(nullable NSString *)descriptionText task:(nullable NSMutableArray<NSString *> *)task isFullListVisible:(BOOL)isFullListVisible;

@end

NS_ASSUME_NONNULL_END
