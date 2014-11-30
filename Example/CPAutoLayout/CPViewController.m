//
//  CPViewController.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPViewController.h"
#import "CPPositionsViewController.h"
#import "CPAlignmentsViewController.h"
#import "CPAlignments2ViewController.h"
#import "CPInsetsViewController.h"
#import "CPSizeViewController.h"


@interface CPViewController ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation CPViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"CPAutoLayout";
        _titles = @[@"Basic - Positions", @"Basic - Alignments (1)", @"Basic - Alignments (2)", @"Basic - Insets", @"Basic - Size"];
        _viewControllers = @[
                [[CPPositionsViewController alloc] init],
                [[CPAlignmentsViewController alloc] init],
                [[CPAlignments2ViewController alloc] init],
                [[CPInsetsViewController alloc] init],
                [[CPSizeViewController alloc] init]
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
    [self.navigationController pushViewController:_viewControllers[indexPath.row] animated:YES];
}


@end
