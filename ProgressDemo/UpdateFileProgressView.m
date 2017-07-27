

//
//  UpdateFileProgressView.m
//  ProgressDemo
//
//  Created by vivo on 2017/6/6.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import "UpdateFileProgressView.h"

@implementation UpdateFileProgressView

-(BOOL) isFlipped{
    return YES;
}

- (void)drawRect:(NSRect)rect {
    [super drawRect:rect];

    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    // Drawing code here.
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat radius = hypot(CGRectGetWidth(rect),CGRectGetHeight(rect));
    
    
    // 进度环
    [SDColorMaker(0, 0, 0, .2) set];
    CGContextSetLineWidth(ctx, 1);
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGFloat to =  -M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
    CGContextAddArc(ctx, xCenter, yCenter, radius,  -M_PI * 0.5, to, 1);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

@end
