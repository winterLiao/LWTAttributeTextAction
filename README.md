### 需求
字符串中某段区域需要添加点击效果或者字符串中添加可点击的按钮。       
解决：给UILabel添加点击事件的category。

### 调用方法
#### 用字符串标记需要点击的位置
```
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:@"这是一串可点击的字符串，通过字符串进行标记了点击"];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, attributedString1.length)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(5, 2)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(attributedString1.length - 2, 2)];
    _textLabel1.attributedText = attributedString1;
    [_textLabel1 addAttributeActionWithStrings:@[@"点击",@"点击"] tapTargetAction:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"点击字符串:%@ 范围在%@，第%ld个",string,NSStringFromRange(range),index+1);
    }];
```

### 用范围标记需要点击的位置（实现插入按钮）
```
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:@"使用范围来进行标记的字符串，可以在字符串在添加图片进行点击，实现再字符串中插入按钮的效果,有颜色的都可点击"];
    NSRange rang1 = [attributedString2.string rangeOfString:@"标记"];
    NSRange rang2 = [attributedString2.string rangeOfString:@"点击"];
    NSRange rang3 = [attributedString2.string rangeOfString:@"按钮"];

    [attributedString2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString2.length)];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:rang1];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:rang2];
    
    //添加图片附件(插入图片，添加点击事件)
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"abc.jpg"];
    attach.bounds = CGRectMake(0, 0, 15, 15);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    [attributedString2 insertAttributedString:attachString atIndex:rang3.location];
    _textLabel2.attributedText = attributedString2;
    [_textLabel2 addAttributeActionWithRange:[NSArray arrayWithObjects:[NSValue valueWithRange:rang1],[NSValue valueWithRange:rang2],[NSValue valueWithRange:rang3],nil] tapTargetAction:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"点击字符串:%@ 范围在%@，第%ld个",string,NSStringFromRange(range),index+1);
    }];
```
