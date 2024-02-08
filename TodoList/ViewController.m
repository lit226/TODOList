#import "ViewController.h"

#import "DefaultPageViewData.h"
#import "DefaultViewController.h"
#import "MainViewController.h"
#import "TodoList-Swift.h"
#import "ListView.h"
#import "ListViewManager.h"
#import "FullViewController.h"

@class FullListViewController;

@interface ViewController ()

@property (nonatomic, strong) DefaultViewController *defaultViewController;
@property (nonatomic, strong) FullListViewController *fullListViewController;
@property (nonatomic, strong) FullViewController *fullViewController;
@property (nonatomic, strong) MainViewController *mainVC;

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
    self.fullListViewController = [[FullListViewController alloc] init];

    self.fullListViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.defaultViewController presentViewController:self.fullListViewController animated:true completion:nil];
    [self.fullListViewController addTargetWithTarget:self selector:@selector(addButtonTapped)];
}

- (void)addButtonTapped {
    ListViewData *listViewdata = [self.fullListViewController getViewData];
    [[ListViewManager shared] saveData:listViewdata];
    [self.defaultViewController dismissViewControllerAnimated:true completion:nil];

    self.mainVC = [[MainViewController alloc] initDelegate:self];
    self.mainVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.defaultViewController presentViewController:self.mainVC animated:true completion:nil];
}

- (void)viewTappedWithViewData:(ListViewData *)viewData {
    self.fullViewController = [[FullViewController alloc] initWithViewData:viewData];
    [self.mainVC presentViewController:self.fullViewController animated:true completion:nil];

    self.fullListViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.fullListViewController addTargetWithTarget:self selector:@selector(backButtonTapped)];
}

- (void)backButtonTapped {
    [self.defaultViewController dismissViewControllerAnimated:true completion:nil];
    [self.defaultViewController presentViewController:self.mainVC animated:true completion:nil];
}

@end
