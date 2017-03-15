//
//  DTURLPattern.m
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import "DTURLPattern.h"

@implementation DTURLPathComponent

-(NSString *)description{
    return  [NSString stringWithFormat:@"\npath : %@  \ntype : %ld \nsubtype : %ld",self.path,self.pathType,self.pathSubType];
}

@end


@implementation DTURLPattern
-(instancetype)initWithURLPattern:(NSString *)urlPattern{
    self = [super init];
    if (self) {
        //scheme://host/path1/path2
        _urlPattern = [urlPattern stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSArray * pathComponents = [self getPathComponents:_urlPattern];
        NSLog(@"%@",pathComponents);
        
        NSMutableArray<DTURLPathComponent *> * pathComponentArr = [NSMutableArray new];
        for (NSString * pathComponent in pathComponents) {
            DTURLPathComponent * c = [[DTURLPathComponent alloc] init];
            if ([pathComponent hasPrefix:@":"]) {
                c.path                 = [pathComponent stringByReplacingOccurrencesOfString:@":" withString:@""];
                c.pathType             = DTURLPathType_Dynamic;
            }
            else{
                c.path                 = pathComponent;
                c.pathType             = DTURLPathType_Static;
            }
            [pathComponentArr addObject:c];
        }
        _paths = [NSArray arrayWithArray:pathComponentArr];
    }
    return self;
}

-(BOOL)isMatchWithURLString:(NSString *)URLString{
    NSArray * paths = [self getPathComponents:URLString];
    if (self.paths.count != paths.count) return NO;
    BOOL matchResult = YES;
    for (NSInteger i = 0; i < self.paths.count; i++) {
        DTURLPathComponent * patternPath = self.paths[i];
        NSString *           urlPath     = paths[i];
        if (patternPath.pathType == DTURLPathType_Static &&
            ![patternPath.path isEqualToString:urlPath]) {
            matchResult = NO;
            break;
        }
    }
    return matchResult;
}

-(NSMutableDictionary *)getPathValueMapWithURLString:(NSString *)URLString error:(NSError **)error{
    NSMutableDictionary * map = [NSMutableDictionary new];
    NSArray * paths = [self getPathComponents:URLString];
    BOOL matchResult = YES;
    if (self.paths.count != paths.count) {
        matchResult = NO;
    }
    else{
        for (NSInteger i = 0; i < self.paths.count; i++) {
            DTURLPathComponent * patternPath = self.paths[i];
            NSString *           urlPath     = paths[i];
            if (patternPath.pathType == DTURLPathType_Static &&
                ![patternPath.path isEqualToString:urlPath]) {
                matchResult = NO;
                break;
            }
            else if(patternPath.pathType == DTURLPathType_Dynamic){
                [map setObject:urlPath forKey:patternPath.path];
            }
        }
    }
    
    
    if (matchResult == NO) {
        *error = [NSError errorWithCode:DTErrorCode_RouterURLDoesNotMatch andMessage:@"DTErrorCode_RouterURLDoesNotMatch"];
        return nil;
    }
    
    
    return map;

}


-(NSArray *)getPathComponents:(NSString *)url{
    
    NSScanner * scanner = [[NSScanner alloc]initWithString:url];
    scanner.caseSensitive = YES;
    [scanner scanUpToString:@"://" intoString:NULL];
    scanner.scanLocation += 3;
    NSString * path = nil;
    while ([scanner isAtEnd] == NO) {
        if ([scanner scanUpToString:@"?" intoString:&path]) {
            break;
        }
    }
    
    NSArray * pathComponents = [path componentsSeparatedByString:@"/"];

    return pathComponents;
}
- (id)copyWithZone:(nullable NSZone *)zone{
    
    return self;

}


-(BOOL)isEqual:(DTURLPattern *)object{
    if (!object)                                      return NO;
    if (self == object)                               return YES;
    if (![object isKindOfClass:[DTURLPattern class]]) return NO;
    if (self.paths.count != object.paths.count)       return NO;
    BOOL matchResult = YES;
    for (NSInteger i = 0; i < self.paths.count; i++) {
        DTURLPathComponent * patternPath1 = self.paths[i];
        DTURLPathComponent * patternPath2 = object.paths[i];
        
        if ((patternPath1.pathType == DTURLPathType_Static &&
            ![patternPath1.path isEqualToString:patternPath2.path]) ||
            patternPath1.pathType != patternPath2.pathType) {
            matchResult = NO;
            break;
        }
    }
    return matchResult;
}

-(NSUInteger)hash{
    
    __block NSUInteger hashResult = 0;

    [self.paths enumerateObjectsUsingBlock:^(DTURLPathComponent * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.pathType == DTURLPathType_Static) {
            hashResult ^= [obj.path hash] ^ obj.pathType ^ obj.pathSubType;
        }
    }];
    
    return hashResult;
}










@end
