#import "MainViewController.h"

#import "CreateButtonProtocol.h"
#import "ListViewManager.h"

@interface MainViewController ()

@property (nonatomic, strong, readonly) UIScrollView *scrollView;
@property (nonatomic, strong, readonly) UIButton *CreateButtonButton;
@property (nonatomic, readonly) id<createButtonProtocol> delegate;

@end

@implementation MainViewController

- (instancetype)initDelegate:(id<createButtonProtocol>)delegate
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _scrollView = [[UIScrollView alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    
    [self setupConstraints];
    [self setupViews];
}

- (void)setupConstraints {
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}

- (void)setupViews {
    NSMutableArray<ListViewData *> *listDatas = [[ListViewManager shared] getViewDatas];
    
    ListView *listView = nil;
    for (ListViewData *viewData in listDatas) {
        ListView *view = [[ListView alloc] initWithViewData:viewData delegate:_delegate];
        [self.scrollView addSubview:view];
        [self addConstraintsForView:view WithListView:listView];
        listView = view;
    }
}

- (void)addConstraintsForView:(ListView *)listView WithListView:(ListView *)view {
    listView.translatesAutoresizingMaskIntoConstraints = false;
    if (view) {
        [NSLayoutConstraint activateConstraints:@[
            [listView.topAnchor constraintEqualToAnchor:view.bottomAnchor constant:50],
            [listView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
            [listView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
            [listView.heightAnchor constraintEqualToConstant:300]
        ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[
            [listView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
            [listView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
            [listView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
            [listView.heightAnchor constraintEqualToConstant:300]
        ]];
    }
}

@end
