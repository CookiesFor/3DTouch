//
//  oneViewController.m
//  3dTouch
//
//  Created by SIMPLE PLAN on 15/11/4.
//  Copyright © 2015年 SIMPLE PLAN. All rights reserved.
//

#import "oneViewController.h"

@interface oneViewController ()
@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        
        [self loadLabelWithTitle:title];
        
    }
    
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)loadLabelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:30];
    label.text = @"test";
    [self.view addSubview:label];
    
}
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction * action1 = [UIPreviewAction actionWithTitle:@"选项1" style:0 handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"click");
    }];
    
    UIPreviewAction * action2 = [UIPreviewAction actionWithTitle:@"选项2" style:1 handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"click");
    }];
    UIPreviewAction * action3 = [UIPreviewAction actionWithTitle:@"选项3" style:2 handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"click");
    }];


    
    
    NSArray * actions = @[action1,action2,action3];
    
    return actions;
}


@end
