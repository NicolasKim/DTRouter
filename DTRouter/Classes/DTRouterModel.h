//
//  DTRouterModel.h
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, DTRouterPurpose) {
    DTRouterPurposeCreate,
    DTRouterPurposeInvokeClassMethod,
    DTRouterPurposeInvokeObjectMethod,
};

@interface DTRouterModel : NSObject

@property (nonatomic,assign,readonly)DTRouterPurpose   purpose;

@property (nonatomic,copy,readonly)NSString          * URLString;

@property (nonatomic,strong,readonly)id                object;

@property (nonatomic,assign,readonly)Class             className;

@property (nonatomic,assign,readonly)SEL               selector;

-(instancetype)initCreateModelWithURL:(NSString *)URLStr withClass:(Class)aClass method:(SEL)method;

-(instancetype)initInvokeModelWithURL:(NSString *)URLStr withClass:(Class)aClass method:(SEL)method;

-(instancetype)initInvokeModelWithURL:(NSString *)URLStr withObject:(id)anObject method:(SEL)method;

@end
