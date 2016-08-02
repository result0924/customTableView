//
//  dashItemTableViewCell.m
//  customTableView
//
//  Created by justin on 2016/8/2.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "dashItemTableViewCell.h"
#import "CommonFunction.h"

@interface dashItemTableViewCell()
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *dashTopConstraint;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation dashItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCell:(NSString *)content {
    self.titleLabel.text = content;

    if (30.0f == [CommonFunction setLabelHeight:content minHeight:30.0f font:[UIFont systemFontOfSize:14.0f] and_MaxWidth:270.0f]) {
        self.dashTopConstraint.constant = 1.0f;
    }
}

@end
