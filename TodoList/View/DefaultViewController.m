#import "DefaultViewController.h"

#import "ListView.h"
#import "ViewController.h"

@interface DefaultViewController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *createButton;
@property (nonatomic, strong) ListView *listView;

@end

@implementation DefaultViewController

- (nonnull instancetype)initWithListView:(nonnull ListView *)listView {
    if (self = [super init]) {
        _listView = listView;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleLabel = [[UILabel alloc] init];
    _descriptionLabel = [[UILabel alloc] init];
    _createButton = [[UIButton alloc] init];

    [self.view addSubview:_titleLabel];
    [self.view addSubview:_descriptionLabel];
    [self.view addSubview:_createButton];
    [self.view addSubview:_listView];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];

    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor yellowColor].CGColor];

    [self.view.layer insertSublayer:gradient atIndex:0];
    
    [self layoutConstraints];
}

- (void)layoutConstraints {
    [self setupTitleLabelConstraints];
    [self setupDescriptionLabelConstraints];
    [self setupCreateButtonConstraints];
    [self setupListViewConstraints];

}

- (void)setupTitleLabelConstraints {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.titleLabel.heightAnchor constraintEqualToConstant:100]
    ]];

}

- (void)setupDescriptionLabelConstraints {
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false;

    [NSLayoutConstraint activateConstraints:@[
        [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor],
        [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.descriptionLabel.heightAnchor constraintEqualToConstant:50]
    ]];
}

- (void)setupCreateButtonConstraints {
    self.createButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.createButton.topAnchor constraintEqualToAnchor:self.descriptionLabel.bottomAnchor constant:20],
        [self.createButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.createButton.widthAnchor constraintEqualToConstant:150],
        [self.createButton.heightAnchor constraintEqualToConstant:70]
    ]];
}

- (void)setupListViewConstraints {
    self.listView.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.listView.topAnchor constraintEqualToAnchor:self.createButton.bottomAnchor constant:50],
        [self.listView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.listView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [self.listView.heightAnchor constraintEqualToConstant:200]
    ]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.titleLabel.font = [self.titleLabel.font fontWithSize:50];
    self.descriptionLabel.font = [self.descriptionLabel.font fontWithSize:25];
    self.createButton.backgroundColor = [UIColor redColor];
    self.createButton.layer.cornerRadius = 10;

    self.listView.layer.shadowRadius = 1.5f;
    self.listView.layer.shadowColor = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    self.listView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.listView.layer.shadowOpacity = 0.9f;
    self.listView.layer.masksToBounds = NO;

    UIEdgeInsets shadowInsets = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(self.listView.bounds, shadowInsets)];
    self.listView.layer.shadowPath = shadowPath.CGPath;
}

- (void)bindViewData:(nonnull DefaultPageViewData *)viewData {
    self.titleLabel.text = viewData.titleText;
    self.descriptionLabel.text = viewData.descriptionText;
    [self.createButton setTitle:viewData.buttonText forState:UIControlStateNormal];
}

- (void)addTarget:(nonnull id)target action:(nonnull SEL)action {
    [self.createButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
