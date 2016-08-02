//
//  activityDetailViewController.m
//  customTableView
//
//  Created by justin on 2016/7/29.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "activityDetailViewController.h"
#import "textTableViewCell.h"
#import "introDuceTableViewCell.h"
#import "CommonFunction.h"
#import "dashItemTableViewCell.h"

@interface activityDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *detailTableVIew;
@property (nonatomic, strong) NSArray *imgAry;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSDictionary *activityDict;

@end

@implementation activityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgAry = @[@"scroll01", @"scroll02", @"scroll03"];
    self.activityDict = @{@"title" : @"健康減重班", @"titleDetail" : @"(不滿意可全額退費)",
                          @"introduce" : @"介紹", @"introduceUrl" : @"https://youtu.be/e0WPgoDIuWM", @"introduceContent" : @"糖尿病不可能消失，卻可以控制...\n一、打破５個常見的飲食迷思\n1.少吃飯就好？\n在六大類食物中，最會影響血糖變化的是五穀根莖澱粉類、水果和牛奶等食物，因為它們含醣豐富。除了米飯，吃起來口感鬆鬆的、咀嚼起來有稍微甜味的食物都屬五穀根莖澱粉類，例如紅豆、綠豆、薏芢、馬鈴薯和芋頭等。\n建議你，諮詢醫院的營養師精確算出你一天各類食物可食的分量，把食物代換原則學起來，以求營養均衡，並能有效控制血糖。\n事先準備一天的飲食紀錄表，填寫食物種類和份量及烹調方法，以利營養師評估，給予個別建議。",
                          @"suit" : @"適合此課程的學員", @"suitInfo" : @[@"體重忽高忽低", @"無法透過運動輕易克服減重", @"飲食健全，運動不良"],
                          @"service" : @"服務明細", @"serviceInfo" : @[@"服務時間為平日早上9點至晚上6點", @"教練每天都會幫您注意血糖、體重，飲食及活動紀錄，有必要時會透過夥伴訊息功能提供提醒或建議"],
                          @"coordinate": @"學員配合事項(讓課程發揮最大效果)", @"coordinateInfo" : @[@"要按時作功課", @"要按時執行", @"生病、胃口不佳時，仍宜儘量少量多餐，補足一日所需之能量，以避免血糖過低，若攝食量因而減少則胰島素或降血糖之劑量，應遵照醫師指示減低並宜多監測血糖。"]};

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 2;
    } else if (2 == section) {
        NSArray *suitArray = self.activityDict[@"suitInfo"];
        return suitArray.count;
    } else if (3 == section) {
        NSArray *serviceAry = self.activityDict[@"serviceInfo"];
        return serviceAry.count;
    } else if (4 == section) {
        NSArray *coordinateAry = self.activityDict[@"coordinateInfo"];
        return coordinateAry.count;
    }

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"";

    if (0 == indexPath.section) {
        CellIdentifier = @"textTableViewCell";
    } else if (1 == indexPath.section) {
        CellIdentifier = @"introDuceTableViewCell";
    } else {
        CellIdentifier = @"dashItemTableViewCell";
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }

    if ([CellIdentifier isEqualToString:@"textTableViewCell"]) {
        textTableViewCell *textCell = (textTableViewCell *)cell;

        if (0 == indexPath.section) {
            if (0 == indexPath.row) {
                [textCell updateTextFont:[UIFont boldSystemFontOfSize:24.0f] titleColor:[UIColor colorWithRed:68.0f / 255.0f green:68.0f / 255.0f blue:68.0f / 255.0f alpha:1.0f] text:self.activityDict[@"title"]];
            } else {
                [textCell updateTextFont:[UIFont systemFontOfSize:16.0f] titleColor:[UIColor orangeColor] text:self.activityDict[@"titleDetail"]];
            }
        }
    } else if ([CellIdentifier isEqualToString:@"introDuceTableViewCell"]) {
        introDuceTableViewCell *introCell = (introDuceTableViewCell *)cell;

        [introCell updateIntroCell:self.activityDict[@"introduceContent"] image:[UIImage imageNamed:@"scroll01"]];
    } else if ([CellIdentifier isEqualToString:@"dashItemTableViewCell"]) {
        dashItemTableViewCell *dashCell = (dashItemTableViewCell *)cell;

        if (2 == indexPath.section) {
            [dashCell updateCell:[self.activityDict[@"suitInfo"] objectAtIndex:indexPath.row]];
        } else if (3 == indexPath.section) {
            [dashCell updateCell:[self.activityDict[@"serviceInfo"] objectAtIndex:indexPath.row]];
        } else if (4 == indexPath.section) {
            [dashCell updateCell:[self.activityDict[@"coordinateInfo"] objectAtIndex:indexPath.row]];
        }
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 240.0f;
    }

    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 240.0f)];

        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 240.0f)];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;

        for (int i = 0; i < self.imgAry.count; i++) {
            CGFloat xOrigin = i * [UIScreen mainScreen].bounds.size.width;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0.0f, [UIScreen mainScreen].bounds.size.width, 240.0f)];
            imageView.image = [UIImage imageNamed:[self.imgAry objectAtIndex:i]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.scrollView addSubview:imageView];
        }

        self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 240.0f);
        [headerView addSubview:self.scrollView];

        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0f, 220.0f, [UIScreen mainScreen].bounds.size.width, 20.0f)];
        self.pageControl.numberOfPages = self.imgAry.count;
        self.pageControl.currentPage = 0;
        self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self.pageControl addTarget:self action:@selector(changepage:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:self.pageControl];

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 100.0f, [UIScreen mainScreen].bounds.size.width, 44.0f)];
        titleLabel.text = @"- 即時衛教 -";
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:titleLabel];

        return headerView;
    } else {
        UIView *introView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 44.0f)];
        introView.backgroundColor = [UIColor whiteColor];

        UILabel *introLabel = [[UILabel alloc] initWithFrame:CGRectMake(16.0f, 0.0f, [UIScreen mainScreen].bounds.size.width - 32.0f, 44.0f)];
        introLabel.font = [UIFont systemFontOfSize:18.0f];

        switch (section) {
            case 1:
                introLabel.text = self.activityDict[@"introduce"];
                break;
            case 2:
                introLabel.text = self.activityDict[@"suit"];
                break;
            case 3:
                introLabel.text = self.activityDict[@"service"];
                break;
            case 4:
                introLabel.text = self.activityDict[@"coordinate"];
                break;
            default:
                break;
        }


        [introView addSubview:introLabel];
        return introView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 0.5f)];
    footView.backgroundColor = [UIColor clearColor];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(16.0f, 0.0f, [UIScreen mainScreen].bounds.size.width - 32.0f, 0.5f)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [footView addSubview:lineView];

    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat padding = 32.0f;
    CGFloat imageHeight = 140.0f;
    CGFloat itemPadding = 50.0f;

    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
           return [CommonFunction setLabelHeight:self.activityDict[@"title"] minHeight:44.0f font:[UIFont boldSystemFontOfSize:24.0f] and_MaxWidth:screenWidth - padding];
        } else if (1 == indexPath.row) {
           return [CommonFunction setLabelHeight:self.activityDict[@"titleDetail"] minHeight:30.0f font:[UIFont systemFontOfSize:16.0f] and_MaxWidth:screenWidth - padding];
        }
    } else if (1 == indexPath.section) {
        return imageHeight + [CommonFunction setLabelHeight:self.activityDict[@"introduceContent"] minHeight:44.0f font:[UIFont systemFontOfSize:14.0f] and_MaxWidth:[UIScreen mainScreen].bounds.size.width - padding] + 20.0f;
    } else if (2 == indexPath.section) {
        return [CommonFunction setLabelHeight:[self.activityDict[@"suitInfo"] objectAtIndex:indexPath.row] minHeight:30.0f font:[UIFont systemFontOfSize:14.0f] and_MaxWidth:[UIScreen mainScreen].bounds.size.width - itemPadding];
    } else if (3 == indexPath.section) {
        return [CommonFunction setLabelHeight:[self.activityDict[@"serviceInfo"] objectAtIndex:indexPath.row] minHeight:30.0f font:[UIFont systemFontOfSize:14.0f] and_MaxWidth:[UIScreen mainScreen].bounds.size.width - itemPadding];
    } else if (4 == indexPath.section) {
        return [CommonFunction setLabelHeight:[self.activityDict[@"coordinateInfo"] objectAtIndex:indexPath.row] minHeight:30.0f font:[UIFont systemFontOfSize:14.0f] and_MaxWidth:[UIScreen mainScreen].bounds.size.width - itemPadding];
    }
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - Orientation

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations  {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - scrollerViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView {
    CGFloat pageWidth = [UIScreen mainScreen].bounds.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

#pragma mark - Private

- (void)changepage:(id)sender {
    NSInteger page = self.pageControl.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0.0f;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}


@end
