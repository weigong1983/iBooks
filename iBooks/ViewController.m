//
//  MTViewController.m
//  Documents
//
//  Created by Bart Jacobs on 23/02/13.
//  Copyright (c) 2013 Mobile Tuts. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;

@end

@implementation ViewController

#pragma mark -
#pragma mark View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Actions
//// 直接预览： 备注：【iOS暂时不支持直接预览iBooks文件】
//- (IBAction)previewDocument:(id)sender {
//    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"ibooks"];
//    
//    if (URL) {
//        // Initialize Document Interaction Controller
//        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
//        
//        // Configure Document Interaction Controller
//        [self.documentInteractionController setDelegate:self];
//        
//        // Preview PDF
//        [self.documentInteractionController presentPreviewAnimated:YES];
//        
//    }
//}

// 打开文件，选择支持的程序
- (IBAction)openDocument:(id)sender
{
    UIButton *button = (UIButton *)sender;
    // 测试一： 打开【sample.ibooks】本地测试文件
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"ibooks"];
    
    // 不支持直接打开服务器上的课件，必须【离线下载】保存到本地，再传入本地路径才能打开iBooks文件
    //NSURL *URL = [NSURL fileURLWithPath:@"http://statictest.daiyan123.com/study/sample.ibooks"];
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Present Open In Menu
        [self.documentInteractionController presentOpenInMenuFromRect:[button frame] inView:self.view animated:YES];
    }
}

#pragma mark -
#pragma mark Document Interaction Controller Delegate Methods
- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}

@end
