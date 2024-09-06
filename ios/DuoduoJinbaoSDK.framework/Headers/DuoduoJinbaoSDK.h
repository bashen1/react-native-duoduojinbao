//
//  DuoduoJinbaoSDK.h
//  DuoduoJinbao
//
//  Created by fuxuan on 2020/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DDJBCallback)(NSError *_Nullable error);

typedef NS_ENUM(NSUInteger, DDJBTakeOverJumpUrlStrategy) {
    DDJBTakeOverJumpUrlStrategyDefault, // automatic jump to the new url
    DDJBTakeOverJumpUrlStrategyBlocked // block automatic jump and handle the following operation yourself
};

/**
 url可能为网页链接或者唤起app的scheme，建议对多多的scheme类型直接使用[DuoduoJinbaoSDK openPDDWithURL]来进行处理
 extraInfo包含goodsSign、goodsId等字段
 */
typedef DDJBTakeOverJumpUrlStrategy (^DDJBTakeOverJumpUrlStrategyDecisionBlock)(NSString * _Nullable url, NSDictionary * _Nullable extraInfo);

@class WKWebView;

@interface DuoduoJinbaoSDK : NSObject

+ (void)setupWithCallback:(DDJBCallback)callback;

+ (void)openPDDWithURL:(NSString *)URL callback:(DDJBCallback)callback;

+ (void)openPDDWithURL:(NSString *)URL backURL:(nullable NSString *)backURL callback:(DDJBCallback)callback;

+ (void)takeOverDDJBWebsiteJumpUrl:(WKWebView *)webView withDecisionBlock:(DDJBTakeOverJumpUrlStrategyDecisionBlock)decisionBlock; // 注意，此webview加载的所有网页都会被注入sdk

/// 获取服务端分配的 Pati 参数
/// @param callback 回调 Block
+ (void)getPatiWithCallback:(void (^)(NSError *_Nullable error, NSString *_Nullable pati))callback;

@end

NS_ASSUME_NONNULL_END
