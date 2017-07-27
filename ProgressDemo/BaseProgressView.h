//
//  BaseProgressView.h
//  vChat
//
//  Created by vivo on 2017/6/5.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#define SDColorMaker(r, g, b, a) [NSColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
// 背景颜色
#define SDProgressViewBackgroundColor SDColorMaker(240, 240, 240, 0.9)
IB_DESIGNABLE
@interface BaseProgressView : NSView
@property (nonatomic, assign) IBInspectable CGFloat progress;

- (void)setCenterProgressText:(NSString *)text withAttributes:(NSDictionary *)attributes;

- (void)dismiss;

+ (id)progressView;
@end
