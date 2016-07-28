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

- (void)updateCellImage:(NSString *)imageName title:(NSString *)title content:(NSString *)content {
    self.activityImageView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
    self.contentLabel.text = content;
}

@end