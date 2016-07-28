//
//  ActivityTableViewCell.m
//  customTableView
//
//  Created by justin on 2016/7/28.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "ActivityTableViewCell.h"

@interface ActivityTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *activityImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *headView;

@end

@implementation ActivityTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellImage:(NSString *)imageName
                  title:(NSString *)title
                content:(NSString *)content
                  month:(NSNumber *)month
                  price:(NSNumber *)price {
    self.activityImageView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
    self.contentLabel.text = content;

    CGSize size = self.headView.frame.size;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor whiteColor] CGColor]];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, size.width, size.height);
    CGPathAddLineToPoint(path, NULL, size.width, 0.0f);
    CGPathAddLineToPoint(path, NULL, 0.0f, size.height / 2);

    CGPathCloseSubpath(path);
    [shapeLayer setPath:path];
    CFRetain(path);
    self.headView.layer.mask = shapeLayer;

    NSString *monthString = [NSString stringWithFormat:@"%@個月", month];
    NSString *priceString = [NSString stringWithFormat:@"$%@", price];
    NSString *labelString = [NSString stringWithFormat:@"%@ %@", monthString, priceString];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelString];
    NSRange range = [labelString rangeOfString:monthString];
    NSRange allTextRange = NSMakeRange(0, range.location + range.length);
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:allTextRange];
    [self.priceLabel setAttributedText:attributedString];
}

@end