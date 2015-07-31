//
//  CPViewController.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation CPViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Examples";
        _titles = @[@"Position", @"Alignment", @"Position (Advanced)", @"Fixed Size", @"Relative Size", @"Size by Aspect Ratio"];
        _viewControllers = @[
                @"CP_Step1_PositionViewController",
                @"CP_Step2_AlignmentViewController",
                @"CP_Step3_PositionAdvancedViewController",
                @"CP_Step4_FixedSizeViewController",
                @"CP_Step5_RelativeSizeViewController",
                @"CP_Step6_AspectRatioViewController"
        ];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }

    cell.textLabel.text = _titles[indexPath.row];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *viewController =
            (UIViewController *) [[NSClassFromString(_viewControllers[indexPath.row]) alloc] init];
    viewController.title = _titles[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
