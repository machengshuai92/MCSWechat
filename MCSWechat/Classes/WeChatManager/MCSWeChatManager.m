//
//  MCSWeChatManager.m
//  LDJYTeacher
//
//  Created by mcs on 2022/4/29.
//

#import "MCSWeChatManager.h"
#import <WechatOpenSDK/WXApi.h>

static MCSWeChatManager *_manager = nil;

@interface MCSWeChatManager()<NSCopying,NSMutableCopying,WXApiDelegate>

@end

@implementation MCSWeChatManager

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [[super allocWithZone:NULL] init];
        }
    });
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [[self class] shareInstance];
}

- (id)copyWithZone:(NSZone *)zone{
    return [[self class] shareInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return [[self class] shareInstance];
}

- (BOOL)mcsRegisterWeChatWithAppID:(NSString *)appid withUniversalLink:(NSString *)link{
    return [WXApi registerApp:appid universalLink:link];
    
}

- (BOOL)mcsHandleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)mcsHandleUniversalLinke:(NSUserActivity *)userActivity{
    return [WXApi handleOpenUniversalLink:userActivity delegate:self];
}

- (BOOL)mcsIsInstallWeChat{
    return [WXApi isWXAppInstalled];
}

- (NSString *)mcsGetWeChatInstallUrl{
    return [WXApi getWXAppInstallUrl];
}

- (void)mcsLaunchMiniProgramWith:(MCSLaunchMiniProgramReq *)req withCompletion:(void (^)(BOOL))result{
    
    WXLaunchMiniProgramReq *launchMiniProgramReq = [[WXLaunchMiniProgramReq alloc] init];
    launchMiniProgramReq.userName = req.mcsUserName;
    launchMiniProgramReq.path = req.mcsPath;
    if (req.mcsMiniProgramType == MiniProgramTypeRelease) {
        launchMiniProgramReq.miniProgramType = WXMiniProgramTypeRelease;
    }else if (req.mcsMiniProgramType == MiniProgramTypeTest) {
        launchMiniProgramReq.miniProgramType = WXMiniProgramTypeTest;
    }else if (req.mcsMiniProgramType == MiniProgramTypePreview) {
        launchMiniProgramReq.miniProgramType = WXMiniProgramTypePreview;
    }
    
    [WXApi sendReq:launchMiniProgramReq completion:^(BOOL success) {
        result ? result(success) : nil;
    }];
    
}

#pragma mark WXApi Delegate
- (void)onResp:(BaseResp *)resp{
    //打开微信小程序回调
    if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]]) {
        NSString *string = ((WXLaunchMiniProgramResp *)resp).extMsg;
        // 对应JsApi navigateBackApplication中的extraData字段数据
    }
}

@end
