#import "ListView.h"

#import "CreateButtonProtocol.h"

@interface ListView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, readonly) id<createButtonProtocol> delegate;

@end

@implementation ListView

- (nonnull instancetype)initWithViewData:(nonnull ListViewData *)viewData
                                delegate:(id<createButtonProtocol>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _viewData = viewData;
        _titleLabel = [[UILabel alloc] init];
        _descriptionLabel = [[UILabel alloc] init];
        _stackView = [[UIStackView alloc] init];
    }

    [self configure];
    return self;
}

- (void)configure {
    [self addGestureRecognizerToview];
    [self addViewHeirarchy];
    [self setConstraints];
    [self stylizeView];
}

- (void)addGestureRecognizerToview {
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(viewFullView)];
    [self addGestureRecognizer:singleFingerTap];
    self.userInteractionEnabled = true;
//    [self.stackView addGestureRecognizer:singleFingerTap];
//    [self.titleLabel addGestureRecognizer:singleFingerTap];
//    [self.descriptionLabel addGestureRecognizer:singleFingerTap];
    
}

- (void)addViewHeirarchy {
    [self addSubview:self.stackView];
    [self.stackView addArrangedSubview:self.titleLabel];
    if (self.viewData.descriptionText) {
        [self.stackView addArrangedSubview:self.descriptionLabel];
    }
    
    if (self.viewData.isFullListVisible) {
        for (NSString *textString in self.viewData.task) {
            self.descriptionLabel.hidden = true;
            UILabel *label = [[UILabel alloc] init];
            label.text = textString;
            [self.stackView addArrangedSubview:label];
        }
    }
}

- (void)setConstraints {
    self.stackView.translatesAutoresizingMaskIntoConstraints = false;

    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.stackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

- (void)stylizeView{
    self.titleLabel.text = self.viewData.titleText;
    self.titleLabel.font = [self.titleLabel.font fontWithSize:30];

    self.descriptionLabel.text = self.viewData.descriptionText;
    self.descriptionLabel.font = [self.descriptionLabel.font fontWithSize:15];

    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.layoutMargins = UIEdgeInsetsMake(12, 12, 12, 12);
    self.stackView.layoutMarginsRelativeArrangement = true;

    self.backgroundColor = [UIColor whiteColor];
}

- (void)viewFullView {
    [self.delegate viewTappedWithViewData:self.viewData];
}

@end
