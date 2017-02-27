//
//  DTModularProtocol.h
//  Pods
//
//  Created by 金秋成 on 2017/2/27.
//
//

#ifndef DTModularProtocol_h
#define DTModularProtocol_h

@protocol DTModularProtocol <NSObject>

- (void)moduleSetUp;
@optional
- (BOOL)async;
@end

#endif /* DTModularProtocol_h */
