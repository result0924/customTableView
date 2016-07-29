//
//  activityDetailViewController.m
//  customTableView
//
//  Created by justin on 2016/7/29.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "activityDetailViewController.h"

@interface activityDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *detailTableVIew;
@property (nonatomic, strong) NSArray *imgAry;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation activityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgAry = @[@"scroll01", @"scroll02", @"scroll03"];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }

    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }

    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 240.0f;
    }

    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
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

        return headerView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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
