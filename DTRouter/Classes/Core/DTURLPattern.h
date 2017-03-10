//
//  DTURLPattern.h
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
#import "NSError+DTRouter.h"

typedef NS_ENUM(NSUInteger, DTURLPathType) {
    DTURLPathType_Static,//不可变
    DTURLPathType_Dynamic,//可变
};

typedef NS_ENUM(NSUInteger, DTURLPathSubType) {
    DTURLPathType_Require,//必要
    DTURLPathType_Optional,//可选
};



@interface DTURLPathComponent : NSObject

@property (nonatomic,strong)NSString * path;

@property (nonatomic,assign)DTURLPathType pathType;

@property (nonatomic,assign)DTURLPathSubType pathSubType;

@end



@interface DTURLPattern : NSObject<NSCopying>

@property (nonatomic,strong,readonly)NSArray<DTURLPathComponent *> * paths;

@property (nonatomic,strong,readonly)NSString * urlPattern;

-(instancetype)initWithURLPattern:(NSString *)urlPattern;

-(BOOL)isMatchWithURLString:(NSString *)URLString;

-(NSMutableDictionary *)getPathValueMapWithURLString:(NSString *)URLString error:(NSError **)error;


@end
