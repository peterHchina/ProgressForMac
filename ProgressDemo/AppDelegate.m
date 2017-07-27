//
//  AppDelegate.m
//  ProgressDemo
//
//  Created by vivo on 2017/6/2.
//  Copyright © 2017年 vivo. All rights reserved.
//

#import "AppDelegate.h"
#import "LoadFileProgressView.h"
#import "UpdateImageProgressView.h"
#import "UpdateFileProgressView.h"
#import "UpdateVideoProgressView.h"
#import "LoadVideoProgressView.h"
#import "LoadImageProgressView.h"
@interface AppDelegate ()
@property (weak) IBOutlet LoadFileProgressView *loadProgressView;
@property (weak) IBOutlet UpdateImageProgressView *imageProgressView;
@property (weak) IBOutlet UpdateFileProgressView *fileProgressView;
@property (weak) IBOutlet UpdateVideoProgressView *videoProgressView;
@property (weak) IBOutlet LoadVideoProgressView *loadVideoProgressView;
@property (weak) IBOutlet LoadImageProgressView *loadImageProgressView;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self loading];
    });
}

-(void) loading{
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.loadProgressView.progress = progress;
            self.imageProgressView.progress = progress;
            self.fileProgressView.progress = progress;
            self.videoProgressView.progress = progress;
            self.loadVideoProgressView.progress = progress;
            self.loadImageProgressView.progress =progress;
        });
        if (progress >= 1.0) {
            progress = 0.0;
        }
        usleep(50000);
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
