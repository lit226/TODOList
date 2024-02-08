#import <UIKit/UIKit.h>

#import "ListViewData.h"

@protocol createButtonProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface ListView : UIView

@property (nonatomic, strong, readonly) ListViewData *viewData;

- (instancetype)initWithViewData:(ListViewData *)viewData
                        delegate:(id<createButtonProtocol>)delegate;

@end

NS_ASSUME_NONNULL_END
