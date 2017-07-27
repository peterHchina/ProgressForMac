//
//  UpdateImageProgressView.m
//  vChat
//
//  Created by vivo on 2017/6/5.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import "UpdateImageProgressView.h"

@implementation UpdateImageProgressView

- (void)drawRect:(CGRect)rect{
       CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    
        CGFloat height = rect.size.height;
        
        // 背景
        [SDColorMaker(0, 0, 0, .2) set];
        CGFloat to = height*(self.progress);// 初始值
        NSLog(@"%f",self.progress);
        CGContextAddRect(ctx, CGRectMake(0, 0, rect.size.width, to));
        CGContextFillPath(ctx);
        
        NSString *progressStr = [NSString stringWithFormat:@"%.0f%%", self.progress * 100];
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [NSFont boldSystemFontOfSize:14];
        attributes[NSForegroundColorAttributeName] = [NSColor whiteColor];
        [self setCenterProgressText:progressStr withAttributes:attributes];
    }


@end
