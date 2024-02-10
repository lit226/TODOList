#import "FullViewController.h"

@interface FullViewController ()

@property (nonatomic, strong, readonly) ListViewData *viewData;
@property (nonatomic, strong, readonly) UIButton *backButton;
@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, readonly) UILabel *titleLabel;

@end

@implementation FullViewController

- (nonnull instancetype)initWithViewData:(nonnull ListViewData *)viewData {
    self = [super init];
    _viewData = viewData;
    _backButton = [[UIButton alloc] init];
    _scrollView = [[UIScrollView alloc] init];
    _titleLabel = [[UILabel alloc] init];

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];

    // Customize button
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.scrollView];
    // Customize labels by creating another view for them
    [self.scrollView addSubview:self.titleLabel];
    
    [self constraintsForButton];
    [self constraintsForScrollView];
    [self constraintsForTitleLabel];

    [self setup];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, [self calculateHeight]);
}

- (void)setup {
    self.titleLabel.text = self.viewData.titleText;
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    self.backButton.backgroundColor = [UIColor blueColor];
    self.backButton.layer.cornerRadius = 10.0;

    UILabel *descriptionLabel = nil;
    if (self.viewData.descriptionText) {
        descriptionLabel = [[UILabel alloc] init];
        descriptionLabel.text = self.viewData.descriptionText;
        [self.scrollView addSubview:descriptionLabel];
        [self constraintsForDescriptionLabel:descriptionLabel];
    }
    
    UILabel *prevLabelView = nil;
    for (NSString *text in self.viewData.task) {
        UILabel *label = [[UILabel alloc] init];
        label.text = text;

        [self.scrollView addSubview:label];
        prevLabelView
        ? [self addConstraintsForView:label WithListView:prevLabelView]
        : descriptionLabel
        ? [self addConstraintsForView:label WithListView:descriptionLabel]
        : [self addConstraintsForView:label WithListView:self.titleLabel];
        prevLabelView = label;
    }
}

- (void)constraintsForButton {
    self.backButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.backButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [self.backButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.backButton.widthAnchor constraintEqualToConstant:70],
        [self.backButton.heightAnchor constraintEqualToConstant:50]
    ]];
}

- (void)constraintsForScrollView {
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.backButton.bottomAnchor constant:20],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}

- (void)constraintsForTitleLabel {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:20],
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:20],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-20],
        [self.titleLabel.heightAnchor constraintEqualToConstant:40]
    ]];
}

- (void)constraintsForDescriptionLabel:(UILabel *)descriptionLabel {
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [descriptionLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:20],
        [descriptionLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:20],
        [descriptionLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-20],
        [descriptionLabel.heightAnchor constraintEqualToConstant:30]
    ]];
}

- (void)addConstraintsForView:(UILabel *)listView WithListView:(UILabel *)view {
    listView.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [listView.topAnchor constraintEqualToAnchor:view.bottomAnchor constant:10],
        [listView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:20],
        [listView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-20],
        [listView.heightAnchor constraintEqualToConstant:20]
    ]];
}

- (void)addTarget:(nonnull id)target action:(nonnull SEL)action {
    [self.backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (CGFloat)calculateHeight {
    // Add logic to calculate height
    return 1000.0f;
}

@end
