//
//  MCSLaunchMiniProgramReq.h
//  LDJYTeacher
//
//  Created by mcs on 2022/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 WXMiniProgramTypeRelease = 0,       //**< 正式版
 WXMiniProgramTypeTest = 1,        //**< 开发版
 WXMiniProgramTypePreview = 2,
 */
typedef enum : NSUInteger {
    MiniProgramTypeRelease = 0,
    MiniProgramTypeTest    = 1,
    MiniProgramTypePreview = 2
} MCSMiniProgramType;

@interface MCSLaunchMiniProgramReq : NSObject

/** 拉起的小程序的username*/
@property (nonatomic, strong) NSString *mcsUserName;

/** 拉起小程序页面的可带参路径，不填默认拉起小程序首页，对于小游戏，可以只传入 query 部分，来实现传参效果，如：传入 "?foo=bar"*/
@property (nonatomic, strong) NSString *mcsPath;

/** 拉起小程序的类型 默认正式版*/
@property (nonatomic, assign) MCSMiniProgramType mcsMiniProgramType;

@end

NS_ASSUME_NONNULL_END
