//
//  UIImageView+Ex.m
//  FakeDaily
//
//  Created by BOOM on 16/3/18.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "UIImageView+Ex.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCacheOperation.h>

@implementation UIImageView (Ex)

- (void)setImageWithUrlString:(NSString *)urlString placeHolder:(UIImage *)placeHolder
{
    [self sd_cancelCurrentImageLoad];
    
    NSURL *url = [NSURL URLWithString:urlString];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // 检查磁盘缓存
    NSString *storeKey = [manager cacheKeyForURL:url];
    __block UIImage *roundImage = [manager.imageCache imageFromDiskCacheForKey:storeKey];
    
    if (roundImage) {
        self.image = roundImage;
        
        // 完成block待加入
    } else {
        self.image = placeHolder;
        
        // 开始下载
        WS(weakSelf)
        if (url) {
            id <SDWebImageOperation> operation = [manager downloadImageWithURL:url options:SDWebImageRetryFailed | SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                // 下载中
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                dispatch_main_async_safe(^{
                    if (image)
                    {
                        // 下载成功
                        dispatch_async(dispatch_get_global_queue(0, 0), ^{
                            
                            roundImage = image;
                            dispatch_main_sync_safe(^{
                                
                                // QuickBlock(completedBlock, image)
                                
                                [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction animations:^{
                                   
                                    weakSelf.image = roundImage;
                                } completion:^(BOOL finished) {
                                    [weakSelf setNeedsDisplay];
                                }];
                            });
                        });
                    } else {
                        // 下载失败
                        weakSelf.image = placeHolder;
                        [weakSelf setNeedsDisplay];
                    }
                })
            }];
            [self sd_setImageLoadOperation:operation forKey:@"UIImageViewLoad"];
        }
    }
}

@end
