#import <UIKit/UIKit.h>
#import "ListViewData.h"

NS_ASSUME_NONNULL_BEGIN

@interface FullViewController : UIViewController <UIScrollViewDelegate>

- (instancetype)initWithViewData:(ListViewData *)viewData;

@end

NS_ASSUME_NONNULL_END
