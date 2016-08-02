//
//  textTableViewCell.m
//  customTableView
//
//  Created by justin on 2016/8/1.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "textTableViewCell.h"

@interface textTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation textTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateTextFont:(UIFont *)font titleColor:(UIColor *)color text:(NSString *) text {
    self.titleLabel.font = font;
    self.titleLabel.textColor = color;
    self.titleLabel.text = text;
}

@end
