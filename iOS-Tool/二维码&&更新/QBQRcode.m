//
//  QBQRcode.m
//  test
//
//  Created by huangqibiao on 2017/1/11.
//  Copyright © 2017年 huangqibiao. All rights reserved.
//

#import "QBQRcode.h"

#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>

static QBQRcode *manager = nil;


@interface QBQRcode ()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) UIView *captureView;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, copy) CallBack callback;

@end

@implementation QBQRcode

+ (void)load {
    manager = [[self alloc]init];
}

// 生成模糊二维码 CIImage
+ (CIImage *)ciImageWithString:(NSString *)qrString {
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *qrData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:qrData forKeyPath:@"inputMessage"];
    CIImage *outputImage = [filter outputImage];
    return outputImage;
}

// 对模糊二维码处理
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));

    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);

    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

// 二维码生成
+ (UIImage *)qbImageWithQRString:(NSString *)qrString withSize:(CGFloat)size{
    CIImage *ciImage = [self ciImageWithString:qrString];
    UIImage *qrImage = [self createNonInterpolatedUIImageFormCIImage:ciImage withSize:size];
    return qrImage;
}

+ (void)scanQRCodeWithCallBack:(CallBack)callback  {
    manager.callback = callback;
    manager.session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [manager.session addInput:input];
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:manager queue:dispatch_get_main_queue()];
    [manager.session addOutput:output];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:manager.session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width * 3/5;
    manager.captureView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
    manager.captureView.backgroundColor = [UIColor redColor];
    [[UIApplication sharedApplication].keyWindow addSubview:manager.captureView];
    manager.captureView.center = [UIApplication sharedApplication].keyWindow.center;
    layer.frame = manager.captureView.bounds;
    [manager.captureView.layer addSublayer:layer];
    [manager.session startRunning];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        if (_callback) {
            _callback(object.stringValue, YES);
        }
        [self.session stopRunning];
        [self.layer removeFromSuperlayer];
        [_captureView removeFromSuperview];
    } else {
        if (_callback) {
            _callback(@"没有扫描到数据", NO);
        }
    }
}




@end
