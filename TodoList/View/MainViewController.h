#import <UIKit/UIKit.h>
#import "ListView.h"

@protocol createButtonProtocol;

NS_ASSUME_NONNULL_BEGIN

// Needs to customize this view
@interface MainViewController : UIViewController <UIScrollViewDelegate>

- (instancetype)initDelegate:(id<createButtonProtocol>)delegate;

@end

NS_ASSUME_NONNULL_END
