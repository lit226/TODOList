#import "ViewController.h"

#import "DefaultPageViewData.h"
#import "DefaultViewController.h"
#import "MainViewController.h"
#import "TodoList-Swift.h"
#import "ListView.h"
#import "ListViewManager.h"
#import "FullViewController.h"

@class DetailsViewController;

@interface ViewController ()

@property (nonatomic, strong) DefaultViewController *defaultViewController;
@property (nonatomic, strong) DetailsViewController *detailsViewController;
@property (nonatomic, strong) FullViewController *fullViewController;
@property (nonatomic, strong) MainViewController *mainVC;
@property (nonatomic, strong) ListViewData *viewData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DefaultPageViewData *viewData = [[ListViewManager shared] getDefaultViewData];
    ListView *listView = [[ListView alloc] initWithViewData:viewData.viewData delegate:self];
    
    self.defaultViewController = [[DefaultViewController alloc] initWithListView:listView];
    self.defaultViewController.modalPresentationStyle = UIModalPresentationFullScreen;

    [self presentViewController:self.defaultViewController animated:YES completion:nil];
    
    [self.defaultViewController addTarget:self action:@selector(createButtonTapped)];
    [self.defaultViewController bindViewData:viewData];
}

- (void)createButtonTapped {
    self.detailsViewController = [[DetailsViewController alloc] init];

    self.detailsViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.defaultViewController presentViewController:self.detailsViewController animated:true completion:nil];
    [self.detailsViewController addTargetWithTarget:self selector:@selector(addButtonTapped)];
}

- (void)addButtonTapped {
    ListViewData *listViewdata = [self.detailsViewController getViewData];
    [[ListViewManager shared] saveData:listViewdata];
    [self.defaultViewController dismissViewControllerAnimated:true completion:nil];

    self.mainVC = [[MainViewController alloc] initDelegate:self];
    self.mainVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.defaultViewController presentViewController:self.mainVC animated:true completion:nil];
}

- (void)viewButtonTappedWithViewData:(ListViewData *)viewData {
    self.viewData = viewData;
    self.fullViewController = [[FullViewController alloc] initWithViewData:viewData];
    self.fullViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.fullViewController addTarget:self action:@selector(backButtonTapped)];

    switch (viewData.viewControllerType) {
        case presentingViewControllerTypeDefaultViewController:
            [self.defaultViewController presentViewController:self.fullViewController animated:true completion:nil];
            break;
            
        case presentingViewControllerTypeMainViewController:
            [self.mainVC presentViewController:self.fullViewController animated:true completion:nil];
            break;
    }
}

- (void)backButtonTapped {
    switch (self.viewData.viewControllerType) {
        case presentingViewControllerTypeDefaultViewController:
            [self.defaultViewController dismissViewControllerAnimated:true completion:nil];
            break;
            
        case presentingViewControllerTypeMainViewController:
            [self.mainVC dismissViewControllerAnimated:true completion:nil];
            break;
    }
}

@end
