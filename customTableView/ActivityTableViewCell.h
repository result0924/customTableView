//
//  ActivityTableViewCell.h
//  customTableView
//
//  Created by justin on 2016/7/28.
//  Copyright © 2016年 justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell

- (void)updateCellImage:(NSString *)imageName title:(NSString *)title content:(NSString *)content;

@end
