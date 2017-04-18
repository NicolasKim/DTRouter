//
//  UIImageView+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/3/30.
//
//

#import "UIImageView+DTRouter.h"
#import "DTRouterService.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (DTRouter)

+(void)load{
    [[DTRouterService sharedInstance]addRouter:@"loadimageurl" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        NSString * imageURLString = arguments[@"url"];
        
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:imageURLString options:0];
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
        
        
        UIImageView * imageView   = arguments[@"imageview"];
        if (imageURLString) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:decodedString]];
        }
        return nil;
    }];
}


-(void)loadURLString:(NSString *)URLString{
    NSData *plainData = [URLString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    NSString * totalURLString = [NSString stringWithFormat:@"example://loadimageurl?url=%@",base64String];
    [[DTRouterService sharedInstance]route:totalURLString arguments:@{@"imageview":self}];
}
@end
