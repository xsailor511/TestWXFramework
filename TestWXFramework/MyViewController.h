//
//  MyViewController.h
//  TestWXFramework
//
//  Created by richard on 2016/10/9.
//  Copyright © 2016年 richard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

-(IBAction)buttonClicked:(id)sender;

@end
