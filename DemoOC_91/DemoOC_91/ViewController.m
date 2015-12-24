//
//  ViewController.m
//  DemoOC_91
//
//  Created by frankfan on 15/12/24.
//  Copyright © 2015年 frankfan. All rights reserved.
//

#import "ViewController.h"
#import <ZXingObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = @"/Users/frankfan/desktop/RQCode.jpg";
    
    
    
#if 0
    NSError *error;
    ZXMultiFormatWriter *write = [ZXMultiFormatWriter writer];
    ZXBitMatrix *result = [write encode:@"hello_world" format:kBarcodeFormatQRCode width:100 height:100 error:&error];
    if(result){
    
        CGImageRef image = [[ZXImage imageWithMatrix:result]cgimage];
        UIImage *uiimage = [UIImage imageWithCGImage:image];
        
        NSData *imageData = UIImageJPEGRepresentation(uiimage, 1);
        [imageData writeToFile:@"/Users/frankfan/desktop/RQCode.jpg" atomically:YES];
    }
    
#endif
    
    
    CGImageRef deCodeImage = [UIImage imageWithContentsOfFile:path].CGImage;
    ZXLuminanceSource *source = [[ZXCGImageLuminanceSource alloc]initWithCGImage:deCodeImage];
    ZXBinaryBitmap *bitMap = [ZXBinaryBitmap binaryBitmapWithBinarizer:[ZXHybridBinarizer binarizerWithSource:source]];
    
    NSError *error;
    ZXDecodeHints *hints = [ZXDecodeHints hints];
    ZXMultiFormatReader *reader = [ZXMultiFormatReader reader];
    ZXResult *result = [reader decode:bitMap hints:hints error:&error];
    if (result) {
        
        NSString *contents = result.text;
        NSLog(@"%@",contents);
    }
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
