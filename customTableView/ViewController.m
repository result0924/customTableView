//
//  ViewController.m
//  customTableView
//
//  Created by justin on 2016/7/26.
//  Copyright © 2016年 justin. All rights reserved.
//

#import "ViewController.h"
#import "ActivityTableViewCell.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *activityTableView;
@property (nonatomic, strong) NSArray *activityAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"加入1對1專屬課程";
    NSMutableArray *activityMAry = [NSMutableArray new];

    @autoreleasepool {
        for (int i = 1; i < 6; i++) {
            NSString *imgName = [NSString stringWithFormat:@"activity0%d", i];
            NSString *title = [NSString stringWithFormat:@"健康減重班%d", i];
            NSString *content = @"醫療人員需接受以上專業的訓練才能提供患者優質服務，並於院內提供優質的成長團體，促進病友間經驗與心得分享，加強病友的適應力與自我照顧能力，因此唯有專業且完整的醫療照顧，才能降低患者相關併發症的發生，並提高患者的生活品質。給予患者最好的醫療品質。為糖尿病患者的健康把關！";
            NSDictionary *dict = @{@"imgName" : imgName, @"title" : title, @"content" : content};

            [activityMAry addObject:dict];
        }
    }

    self.activityAry = [[NSArray alloc] initWithArray:activityMAry];
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
    return self.activityAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"ActivityTableViewCell";

    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }

    NSDictionary *activityDict = [self.activityAry objectAtIndex:indexPath.row];
    [cell updateCellImage:activityDict[@"imgName"] title:activityDict[@"title"] content:activityDict[@"content"]];

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
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300.0f;
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

@end
