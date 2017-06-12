//
//  ZAEvent.m
//  ZATools
//
//  Created by mac on 2017/6/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZAEvent.h"

@implementation ZAEvent
@synthesize bridge = _bridge;


RCT_EXPORT_MODULE()

/**
 支持事件的名

 @return array<string>
 */
-(NSArray<NSString *> *)supportedEvents{
    return @[@"sendCallback",@"sendMessage"];
}

- (void)receivedCallback:(NSString *)code result:(NSString *)result{
//    [self.bridge sendEventWithName:@"sendCallback" body:@{@"code" : code,
//                                                   @"result" : result}];
}

- (void)sendMessage:(NSString *)msg{

//    [self sendEventWithName:@"sendMessage" body:@{@"msg" : msg}];
    dispatch_async(dispatch_get_main_queue(), ^{
       [self sendAppEventWithName:@"sendCallback" body:@{@"msg" : @"hello"}];
    });
}

RCT_EXPORT_METHOD(sendMessage){
//    [self sendEventWithName:@"sendMessage" body:@{@"msg" : @"msg"}];
}

@end