#import <UIKit/UIKit.h>
#import "ListView.h"

@protocol createButtonProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UIScrollViewDelegate>

- (instancetype)initDelegate:(id<createButtonProtocol>)delegate;

@end

NS_ASSUME_NONNULL_END
