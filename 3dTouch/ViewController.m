//
//  ViewController.m
//  3dTouch
//
//  Created by SIMPLE PLAN on 15/11/4.
//  Copyright © 2015年 SIMPLE PLAN. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"

#define MAINSIZE  [UIScreen mainScreen].bounds.size


@interface ViewController ()<UIViewControllerPreviewingDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView * tableView;

@property (nonatomic, strong) NSArray * array;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"3DTouch";

    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableView];
    
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    
    [self check3dtouch];

    
    
}
-(void)check3dtouch
{
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"3DTouch 可用");
    }else{
        NSLog(@"3DTouch 不可用");
    }
}
-(void)initTableView
{
    
    self.array = [[NSArray alloc]initWithObjects:@"张三",@"李四",@"王武",@"赵六",@"李大", nil];
    UITableView * tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}



#pragma mark - UIViewControllerPreviewingDelegate 预览
- (UIViewController *)previewingContext:(id)context viewControllerForLocation:(CGPoint) point
{
    oneViewController *childVC = [[oneViewController alloc] initWithTitle:@"测试"];
    childVC.preferredContentSize = CGSizeMake(0.0f,300.f);
    //NSLog(@"-%f = -%f",point.x,point.y);
    //    CGRect rect = CGRectMake(10, point.y - 10, self.view.frame.size.width - 20,20);
    //    context.sourceRect = rect;
    
    NSLog(@"%@",childVC);
    return childVC;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    
    [self showViewController:viewControllerToCommit sender:self];
}

@end
