#import <UIKit/UIKit.h>

#import "DefaultPageViewData.h"
#import "ListView.h"

NS_ASSUME_NONNULL_BEGIN

// Add an attractive gradient to the background and make the view more appealing
@interface DefaultViewController : UIViewController

- (instancetype)initWithListView:(ListView *)listView;

- (void)bindViewData:(DefaultPageViewData *)viewData;

- (void)addTarget:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
