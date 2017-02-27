# DTRouter

[![CI Status](http://img.shields.io/travis/jinqiucheng1006@live.cn/DTRouter.svg?style=flat)](https://travis-ci.org/jinqiucheng1006@live.cn/DTRouter)
[![Version](https://img.shields.io/cocoapods/v/DTRouter.svg?style=flat)](http://cocoapods.org/pods/DTRouter)
[![License](https://img.shields.io/cocoapods/l/DTRouter.svg?style=flat)](http://cocoapods.org/pods/DTRouter)
[![Platform](https://img.shields.io/cocoapods/p/DTRouter.svg?style=flat)](http://cocoapods.org/pods/DTRouter)
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.



## Installation

DTRouter is available through [CocoaPods]([http://cocoapods.org](http://cocoapods.org)). To install

it, simply add the following line to your Podfile:

```ruby
pod "DTRouter"
```



## Description

DTRouterRequest->param is a list for the selector param。

![image](https://github.com/NicolasKim/DTRouter/blob/master/DESCPIC.png)



## Usage

1. create

```objective-c
//regist
DTRouterModel * model = [[DTRouterModel alloc]initCreateModelWithURL:@"dtrouter://initViewController" withClass:[DTViewController class] method:@selector(initWithDict:)];
[[DTRouter sharedInstance]registModel:model error:nil];
//invoke
DTRouterRequest * request = [[DTRouterRequest alloc]init];
request.routerType = DTRoterRequestType_POST;
request.URLString = @"dtrouter://initViewController";
request.params    = @[@{@"key1":@"value1",@"key2":@"value2"}];
DTRouterResponse * resp = [[DTRouter sharedInstance]syncRequest:request];
```

2. invoke class method

```objective-c
//regist
DTRouterModel * model = [[DTRouterModel alloc]initInvokeModelWithURL:@"dtrouter://invokeclassmethod" withClass:[DTViewController class] method:@selector(test:andTest:)];
[[DTRouter sharedInstance]registModel:model error:nil];
//invoke
DTRouterRequest * request = [[DTRouterRequest alloc]init];
request.routerType = DTRoterRequestType_GET;
request.URLString = @"dtrouter://invokeclassmethod?aa=haha&bb=heihei";
DTRouterResponse * resp = [[DTRouter sharedInstance]syncRequest:request];
NSLog(@"%@",resp.resultValue);
```

3. invoke instance method

```objective-c
//regist
DTRouterModel * model = [[DTRouterModel alloc]initInvokeModelWithURL:@"dtrouter://invokeinstancemethod" withObject:self method:@selector(dt_setupData:)];
[[DTRouter sharedInstance]registModel:model error:nil];
//invoke
DTRouterRequest * request = [[DTRouterRequest alloc]init];
request.routerType = DTRoterRequestType_POST;
request.URLString = @"dtrouter://invokeinstancemethod";
request.params    = @[@{@"key1":@"value1",@"key2":@"value2"}];
DTRouterResponse * resp = [[DTRouter sharedInstance]syncRequest:request];
```

​

4. set block as parameter

```objective-c
//regist
DTRouterModel * model = [[DTRouterModel alloc]initInvokeModelWithURL:@"dtrouter://invokeinstancemethod" withObject:self method:@selector(dt_setupData:block:)];
[[DTRouter sharedInstance]registModel:model error:nil];
//invoke
DTViewControllerTestBlock block = ^(){
NSLog(@"52sdlkjfklajsdlkfjkasjdfkljlk");
};
DTRouterRequest * request = [[DTRouterRequest alloc]init];
request.routerType = DTRoterRequestType_POST;
request.URLString = @"dtrouter://invokeinstancemethod";
request.params    = @[@{@"key1":@"value1",@"key2":@"value2"},block];
DTRouterResponse * resp = [[DTRouter sharedInstance]syncRequest:request];

```

​



## Author

jinqiucheng1006@live.cn

## License

DTRouter is available under the MIT license. See the LICENSE file for more info.
