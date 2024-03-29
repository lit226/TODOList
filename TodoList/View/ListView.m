#import "ListView.h"

#import "CreateButtonProtocol.h"

@interface ListView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIStackView *titleDescriptionButtonStackView;
@property (nonatomic, strong) UIButton *showFullViewButton;
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
        _titleDescriptionButtonStackView = [[UIStackView alloc] init];
        _showFullViewButton = [[UIButton alloc] init];
    }

    [self configure];
    return self;
}

- (void)configure {
    [self addViewHeirarchy];
    [self setConstraints];
    [self stylizeView];
}

- (void)addViewHeirarchy {
    [self addSubview:self.titleDescriptionButtonStackView];
    [self.stackView addArrangedSubview:self.titleLabel];
    if (self.viewData.descriptionText) {
        [self.stackView addArrangedSubview:self.descriptionLabel];
    }

    [self.titleDescriptionButtonStackView addArrangedSubview:self.stackView];
    [self.titleDescriptionButtonStackView addArrangedSubview:self.showFullViewButton];
}

- (void)setConstraints {
    self.titleDescriptionButtonStackView.translatesAutoresizingMaskIntoConstraints = false;
    self.showFullViewButton.translatesAutoresizingMaskIntoConstraints = false;

    [NSLayoutConstraint activateConstraints:@[
        [self.titleDescriptionButtonStackView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.titleDescriptionButtonStackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.titleDescriptionButtonStackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.titleDescriptionButtonStackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        
        [self.showFullViewButton.heightAnchor constraintEqualToConstant:70],
        [self.showFullViewButton.widthAnchor constraintEqualToConstant:100]
    ]];
}

- (void)stylizeView{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.text = self.viewData.titleText;
    self.titleLabel.font = [self.titleLabel.font fontWithSize:30];
    self.titleLabel.numberOfLines = 0;

    self.descriptionLabel.text = self.viewData.descriptionText;
    self.descriptionLabel.font = [self.descriptionLabel.font fontWithSize:15];
    self.descriptionLabel.numberOfLines = 0;

    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.layoutMargins = UIEdgeInsetsMake(12, 12, 12, 12);
    self.stackView.layoutMarginsRelativeArrangement = true;
    
    self.titleDescriptionButtonStackView.axis = UILayoutConstraintAxisHorizontal;
    self.titleDescriptionButtonStackView.alignment = UIStackViewAlignmentCenter;
    
    self.showFullViewButton.backgroundColor = [UIColor blueColor];
    self.showFullViewButton.layer.cornerRadius = 15.0f;
    [self.showFullViewButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.showFullViewButton setTitle:@"Show" forState:UIControlStateNormal];
    [self.showFullViewButton addTarget:self action:@selector(viewFullView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)viewFullView {
    [self.delegate viewButtonTappedWithViewData:self.viewData];
}

@end
