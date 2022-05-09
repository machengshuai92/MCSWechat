//
//  MCSWeChatManager.h
//  LDJYTeacher
//
//  Created by mcs on 2022/4/29.
//

#import <Foundation/Foundation.h>
#import <MCSLaunchMiniProgramReq.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MCSWeChatManagerDelegate <NSObject>



@end

@interface MCSWeChatManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, weak) id<MCSWeChatManagerDelegate> delegate;

/// 向微信注册
/// @param appid 微信开发者id
/// @param link 微信开发者universal link
/// @return 成功返回YES，失败返回NO。
- (BOOL)mcsRegisterWeChatWithAppID:(NSString *_Nonnull)appid withUniversalLink:(NSString *)link;

/// 处理旧版微信通过URL启动App时传递的数据
/// @param url 微信启动第三方应用时传递过来的URL
/// @return 成功返回YES，失败返回NO。
- (BOOL)mcsHandleOpenURL:(NSURL *_Nonnull)url;

/// 处理微信通过Universal Link启动App时传递的数据
/// @param userActivity 微信启动第三方应用时系统API传递过来的userActivity
/// @return 成功返回YES，失败返回NO。
- (BOOL)mcsHandleUniversalLinke:(NSUserActivity *)userActivity;

/// 用户是否安装安心
/// @return 是否安装微信
- (BOOL)mcsIsInstallWeChat;

/// 安装微信的地址
/// @return 微信的安装地址字符串。
- (NSString *)mcsGetWeChatInstallUrl;

/// 拉起小程序
/// @param req 具体的发送请求
/// @param result 调用结果回调block
- (void)mcsLaunchMiniProgramWith:(MCSLaunchMiniProgramReq *)req withCompletion:(void(^)(BOOL success))result;

@end

NS_ASSUME_NONNULL_END
