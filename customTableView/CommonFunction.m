//
//  CommonFunction.m
//  customTableView
//
//  Created by justin on 2016/8/2.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "CommonFunction.h"

@implementation CommonFunction

+ (float)setLabelHeight:(NSString *)str minHeight:(float)minHeight font:(UIFont *)set_font and_MaxWidth:(float)width {
    CGSize constraint = CGSizeMake(width , MAXFLOAT);

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;

    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:str attributes:@
                                          {
                                          NSFontAttributeName:set_font,
                                          NSParagraphStyleAttributeName:paragraphStyle
                                          }];

    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];

    CGFloat height = MAX(minHeight, rect.size.height);

    return height;
}


@end
