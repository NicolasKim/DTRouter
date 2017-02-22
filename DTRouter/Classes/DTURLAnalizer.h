//
//  DTURLAnalizer.h
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import <Foundation/Foundation.h>
@interface DTURLAnalizer : NSObject

+(NSDictionary *)paramDictOfURL:(NSURL *)URL;

+(NSDictionary *)paramDictOfURLString:(NSString *)URLString;

+(NSArray *)paramValueOfURLString:(NSString *)URLString;

@end
