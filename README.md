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
or  'DTRouter/Core'
or  'DTRouter/UI'
```



## Usage

```objective-c
//regist 
-(void)addRouter:(NSString *)URLPattern handler:(DTRouterRegistHandler)handler;

//route
-(DTRouterResponse *)route:(NSString *)URLString arguments:(NSDictionary *)arguments;

-(NSOperation *)asyncRoute:(NSString *)URLString arguments:(NSDictionary *)arguments handler:(DTResponseBlock)handler;

```

```objective-c
//regist
[[DTRouterService sharedInstance]addRouter:@"addnumber/:num" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
		NSString * num = paths[@"num"];
		handler    handle = arguments[@"taskkey"];
        return nil;
}];

//route
handler  h = ^(long long num){
                NSLog(@"current num : %lld",num);
             };
[[DTRouterService sharedInstance]asyncRoute:@"addnumber/100" arguments:@{@"taskkey":h} handler:^(DTRouterResponse *response) {
	NSLog(@"result : %@",response.resultValue);
}];

```



## Author

jinqiucheng1006@live.cn

## License

DTRouter is available under the MIT license. See the LICENSE file for more info.
