//
//  LoadImageProgressView.m
//  ProgressDemo
//
//  Created by vivo on 2017/6/6.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import "LoadImageProgressView.h"

@implementation LoadImageProgressView
-(BOOL) isFlipped{
    return YES;
}
- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5)-2;
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    [[NSColor clearColor] setFill];
    [[NSColor whiteColor] setStroke];
    CGFloat w = radius * 2;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w) * 0.5;
    CGFloat y = (rect.size.height - h) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
    CGContextDrawPath(ctx,kCGPathFillStroke);
    
    [[NSColor grayColor] set];
    CGFloat startAngle = M_PI * 0.5 - self.progress * M_PI;
    CGFloat endAngle = M_PI * 0.5 + self.progress * M_PI;
    CGContextAddArc(ctx, xCenter, yCenter, radius, startAngle, endAngle, 0);
    CGContextFillPath(ctx);
    
    NSString *progressStr = [NSString stringWithFormat:@"%.0f%%", self.progress * 100];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [NSFont boldSystemFontOfSize:14];
    attributes[NSForegroundColorAttributeName] = [NSColor whiteColor];
    [self setCenterProgressText:progressStr withAttributes:attributes];
}

@end
