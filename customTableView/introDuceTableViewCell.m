//
//  introDuceTableViewCell.m
//  customTableView
//
//  Created by justin on 2016/8/1.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "introDuceTableViewCell.h"

@interface introDuceTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UILabel *introContentLabel;

@end

@implementation introDuceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateIntroCell:(NSString *)content image:(UIImage *)image {
    self.videoImageView.image = image;
    self.introContentLabel.text = content;
}

@end
