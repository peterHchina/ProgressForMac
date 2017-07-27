//
//  BaseProgressView.m
//  vChat
//
//  Created by vivo on 2017/6/5.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import "BaseProgressView.h"

@implementation BaseProgressView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.backgroundColor = SDProgressViewBackgroundColor.CGColor;
        self.layer.cornerRadius = 5;
        [self addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.progress = 0;
        self.layer.backgroundColor = SDProgressViewBackgroundColor.CGColor;
        self.layer.cornerRadius = 5;
        [self addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"progress"];
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, key);
    [self setNeedsDisplay:YES];
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    if (progress >= 1.0) {
        [self removeFromSuperview];
    } else {
        [self setNeedsDisplay:YES];
    }
    
}

- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes{
    CGFloat xCenter = self.frame.size.width * 0.5;
    CGFloat yCenter = self.frame.size.height * 0.5;
    CGSize strSize = [text sizeWithAttributes:attributes];
    CGFloat strX = xCenter - strSize.width * 0.5;
    CGFloat strY = yCenter - strSize.height * 0.5;
    [text drawAtPoint:CGPointMake(strX, strY) withAttributes:attributes];
}



// 清除指示器
- (void)dismiss{
    self.progress = 1.0;
}

+ (id)progressView{
    return [[self alloc] init];
}


@end
