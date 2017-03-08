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



## Usage

```objective-c
//regist 
DTRouterRequest * req = [[DTRouterRequest alloc]initRegistWithURLPattern:@"example://firstviewcontroller" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        DTViewController * viewcontroller = [[DTViewController alloc]init];
        viewcontroller.viewTitle = arguments[@"title"];
        return viewcontroller;
    } error:nil];
[[DTRouterService sharedInstance]request:req];

//route
DTRouterRequest * req = [[DTRouterRequest alloc]initRequestWithURLString:@"example://firstviewcontroller?title=hahaha" error:nil];
    DTRouterResponse * resp = [[DTRouterService sharedInstance]request:req];
    [self setViewControllers:@[resp.resultValue]];
```



## Author

jinqiucheng1006@live.cn

## License

DTRouter is available under the MIT license. See the LICENSE file for more info.
