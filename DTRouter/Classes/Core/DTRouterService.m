//
//  DTRouterService.m
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import "DTRouterService.h"
#import "DTURLPattern.h"
#import "DTError.h"
NSString * const defaultAppScheme = @"DTDefaultAppScheme";


@interface DTRouterService ()
/*!
 @property
 @abstract 路由映射集合
 */
@property (nonatomic,strong)NSMutableDictionary<DTURLPattern * , DTRouterRegistHandler> * routerMap;

@end


@implementation DTRouterService

static DTRouterService * _sharedInstance;


+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DTRouterService alloc]init];
    });
    return _sharedInstance;
}

-(DTRouterResponse *)request:(DTRouterRequest *)request{
    DTRouterResponse * resp = [[DTRouterResponse alloc]init];
    if (request.requestType == DTRouterRequestType_Regist) {
        DTURLPattern * pattern = [[DTURLPattern alloc]initWithURLPattern:request.URLPattern];
        resp.pattern    =  pattern;
        [self.routerMap setObject:request.registHandler forKey:pattern];
    }
    else if (request.requestType == DTRouterRequestType_Route){
        DTURLPattern * URLPattern = [self getPatternOfURL:request.URLString];
        if (!URLPattern) {
            resp.error = [DTError errorWithCode:DTErrorCode_RouterDoesNotExist andMessage:@"DTErrorCode_RouterDoesNotExist"];
        }
        else{
            DTError * error = nil;
            NSDictionary * pathMap = [URLPattern getPathValueMapWithURLString:request.URLString error:nil];
            if (error) {
                resp.error = error;
            }
            else{
                DTRouterRegistHandler handler = self.routerMap[URLPattern];
                resp.resultValue = handler(pathMap,request.arguments);
            }
        }
    }
    return resp;
}

-(void)request:(DTRouterRequest *)request response:(DTResponseBlock)respBlock{
    
}

-(BOOL)handleURL:(NSURL *)url{
    if ([url.scheme isEqualToString:self.appScheme]) {
//        DTURLPattern * URLPattern = [self getPatternOfURL:url];
//        if (!URLPattern) return NO;
        
        
        
        
        
        
        
        return YES;
    }
    return NO;
}


-(DTURLPattern *)getPatternOfURL:(NSString *)url{
    __block DTURLPattern * pattern = nil;
    [self.routerMap.allKeys enumerateObjectsUsingBlock:^(DTURLPattern * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMatchWithURLString:url]) {
            pattern = obj;
            *stop = YES;
        }
    }];
    return pattern;
}

-(NSString *)appScheme{
    if (!_appScheme) {
        _appScheme = defaultAppScheme;
    }
    return _appScheme;
}

-(NSMutableDictionary<DTURLPattern *,DTRouterRegistHandler> *)routerMap{
    if (!_routerMap) {
        _routerMap = [NSMutableDictionary dictionary];
    }
    return _routerMap;
}



@end
