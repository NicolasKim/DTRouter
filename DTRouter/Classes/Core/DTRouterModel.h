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
/*!
 @property
 @abstract Purpose of module
 */
@property (nonatomic,assign,readonly)DTRouterPurpose   purpose;
/*!
 @property
 @abstract url   scheme://host/path    ** Do not include the param like scheme://host/path?p1=aa&p2=bb
 */
@property (nonatomic,copy,readonly)NSString          * URLString;
/*!
 @property
 @abstract use to regist DTRouterPurposeInvokeObjectMethod type model, don't forget unregist module or the object will never be dealloced
 */
@property (nonatomic,strong,readonly)id                object;
/*!
 @property
 @abstract use to regist DTRouterPurposeCreate/DTRouterPurposeInvokeClassMethod type model
 */
@property (nonatomic,assign,readonly)Class             className;

/*!
 @property
 @abstract selector
 */
@property (nonatomic,assign,readonly)SEL               selector;

//initializer for Create object
-(instancetype)initCreateModelWithURL:(NSString *)URLStr withClass:(Class)aClass method:(SEL)method;
//initializer for invoke class method
-(instancetype)initInvokeModelWithURL:(NSString *)URLStr withClass:(Class)aClass method:(SEL)method;
//initializer for invoke object method
-(instancetype)initInvokeModelWithURL:(NSString *)URLStr withObject:(id)anObject method:(SEL)method;

@end
