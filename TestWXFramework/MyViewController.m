//
//  MyViewController.m
//  TestWXFramework
//
//  Created by richard on 2016/10/9.
//  Copyright © 2016年 richard. All rights reserved.
//

#import "MyViewController.h"
#import <WXFramework/WXFramework.h>
#import "NSBundle+YourFrameworkBundle.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"测试获取图片";
    [ButtonUtil addBorder:self.button borderColor:[UIColor blueColor] borderWidth:5 borders:UIButtonBorderAllBorders];
    
    
//    NSBundle *myBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"WXFramework" ofType:@"bundle"]];
//    NSString *filePath = [myBundle pathForResource:@"wx_img_down" ofType:@"png"];
//    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    //UIImage *image2 = [UIImage imageNamed:@"wx_img_down" inBundle:[NSBundle yourFrameworkBundle] compatibleWithTraitCollection:[UITraitCollection traitCollectionWithDisplayScale:[UIScreen mainScreen].scale]];
    
    UIImage *image3 = [UIImage imageNamed:@"wx_img_down" inBundle:[NSBundle yourFrameworkBundle] compatibleWithTraitCollection:nil];
    
    [self.imageView setImage:image3];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonClicked:(id)sender{
    /**
     * 获取storyboard 里的vc
     */
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WXMain" bundle:[NSBundle yourFrameworkBundle]];
    //获取StoryBoard里面的ViewController，方式1：  前提是要在库工程的sb里设置StoryBoard ID
    //方式1可以获取sb里的任意一个vc
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"StoryBoardFirstViewController"];
    //方式2 这个只能获取init vc
     //UIViewController *vc = [sb instantiateInitialViewController];
    
    //vc 被present,这就需要在vc里将自己dismiss掉了，这是集成的需求
    [self presentViewController:vc animated:YES completion:NULL];
    
    
    /**
     * 获取xib资源，并生成ViewController
     *
     **/
//    WXViewController *vc = [[WXViewController alloc] initWithNibName:@"WXViewController" bundle:[NSBundle yourFrameworkBundle]];
//    [self.navigationController pushViewController:vc animated:YES];

}

@end
