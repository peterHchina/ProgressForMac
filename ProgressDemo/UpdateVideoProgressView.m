//
//  UpdateVideoProgressView.m
//  ProgressDemo
//
//  Created by vivo on 2017/6/6.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import "UpdateVideoProgressView.h"

@implementation UpdateVideoProgressView

-(BOOL) isFlipped{
    return YES;
}
- (void)drawRect:(NSRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    // Drawing code here.
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5)-2;

    [[NSColor clearColor] setFill];
    [[NSColor whiteColor] setStroke];
    CGFloat w = radius * 2;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w) * 0.5;
    CGFloat y = (rect.size.height - h) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
    CGContextDrawPath(ctx,kCGPathFillStroke);
    
    
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
