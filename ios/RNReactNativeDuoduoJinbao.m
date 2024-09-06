#import <DuoduoJinbaoSDK/DuoduoJinbaoSDK.h>
#import "RNReactNativeDuoduoJinbao.h"

@implementation RNReactNativeDuoduoJinbao {
    bool hasListeners;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_MODULE()

// Will be called when this module's first listener is added.
- (void)startObserving {
    hasListeners = YES;
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
- (void)stopObserving {
    hasListeners = NO;
    // Remove upstream listeners, stop unnecessary background tasks
}

// 初始化
RCT_EXPORT_METHOD(init:(NSDictionary *)param resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    [DuoduoJinbaoSDK setupWithCallback:^(NSError *_Nullable error) {
        if (!error) {
            NSDictionary *ret = @{ @"code": @1, @"message": @"success" };
            resolve(ret);
        } else {
            NSDictionary *ret = @{ @"code": @0, @"message": error.description };
            resolve(ret);
        }
    }];
}

// 获取 risk_token
RCT_EXPORT_METHOD(getPati:(NSDictionary *)param resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    [DuoduoJinbaoSDK getPatiWithCallback:^(NSError *_Nullable error, NSString *_Nullable pati) {
        if (!error && pati) {
            NSDictionary *ret = @{ @"code": @1, @"message": pati };
            resolve(ret);
        } else {
            NSDictionary *ret = @{ @"code": @0, @"message": error.description };
            resolve(ret);
        }
    }];
}

// 打开落地页
RCT_EXPORT_METHOD(openPDDWithURL:(NSDictionary *)param resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *url = (NSString *)param[@"url"];
    NSString *backUrl = (NSString *)param[@"backUrl"];

    if (url != nil && ![url isEqual:@""]) {
        if (backUrl != nil && ![backUrl isEqual:@""]) {
            [DuoduoJinbaoSDK openPDDWithURL:url
                                    backURL:backUrl
                                   callback:^(NSError *_Nullable error) {
                if (!error) {
                    NSDictionary *ret = @{ @"code": @1, @"message": @"" };
                    resolve(ret);
                } else {
                    NSDictionary *ret = @{ @"code": @0, @"message": error.description };
                    resolve(ret);
                }
            }];
        } else {
            [DuoduoJinbaoSDK openPDDWithURL:url
                                   callback:^(NSError *_Nullable error) {
                if (!error) {
                    NSDictionary *ret = @{ @"code": @1, @"message": @"" };
                    resolve(ret);
                } else {
                    NSDictionary *ret = @{ @"code": @0, @"message": error.description };
                    resolve(ret);
                }
            }];
        }
    } else {
        NSDictionary *ret = @{
                @"code": @0, @"message": @"url为空"
        };
        resolve(ret);
    }
}

@end
