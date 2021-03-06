//
//  ViewController.m
//  LWTAttributeTextAction
//
//  Created by liaowentao on 17/6/19.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+attributeTextAction.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel1;
@property (weak, nonatomic) IBOutlet UILabel *textLabel2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通过字符串标记
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:@"这是一串可点击的字符串，通过字符串进行标记了点击"];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, attributedString1.length)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(5, 2)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(attributedString1.length - 2, 2)];
    _textLabel1.attributedText = attributedString1;
    [_textLabel1 addAttributeActionWithStrings:@[@"点击",@"点击"] tapTargetAction:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"点击字符串:%@ 范围在%@，第%ld个",string,NSStringFromRange(range),index+1);
    }];
    
    
    
    //通过范围标记
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:@"使用范围来进行标记的字符串，可以在字符串在添加图片进行点击，实现再字符串中插入按钮的效果,有颜色的都可点击"];
    NSRange rang1 = [attributedString2.string rangeOfString:@"标记"];
    NSRange rang2 = [attributedString2.string rangeOfString:@"点击"];
    NSRange rang3 = [attributedString2.string rangeOfString:@"按钮"];

    [attributedString2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString2.length)];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:rang1];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:rang2];
    //添加图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"abc.jpg"];
    attach.bounds = CGRectMake(0, 0, 15, 15);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    [attributedString2 insertAttributedString:attachString atIndex:rang3.location];
    _textLabel2.attributedText = attributedString2;
    [_textLabel2 addAttributeActionWithRange:[NSArray arrayWithObjects:[NSValue valueWithRange:rang1],[NSValue valueWithRange:rang2],[NSValue valueWithRange:rang3],nil] tapTargetAction:^(NSString *string, NSRange range, NSInteger index) {
        UIAlertController *al = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"点击了第%ld个",index] message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [al addAction:cancelAction];
        [self presentViewController:al animated:NO completion:^{
            
        }];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%ld",index] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            
//        }];
//        [al addAction:action];
//]
        NSLog(@"点击字符串:%@ 范围在%@，第%ld个",string,NSStringFromRange(range),index+1);
    }];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
