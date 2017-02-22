//
//  DTRouterRequest.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTRouterRequest.h"


@implementation DTRouterRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.routerType = DTRoterRequestType_GET;
    }
    return self;
}

@end
