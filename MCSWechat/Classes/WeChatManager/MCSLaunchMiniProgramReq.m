//
//  MCSLaunchMiniProgramReq.m
//  LDJYTeacher
//
//  Created by mcs on 2022/5/5.
//

#import "MCSLaunchMiniProgramReq.h"

@implementation MCSLaunchMiniProgramReq

- (instancetype)init{
    if (self = [super init]) {
        self.mcsUserName = @"";
        self.mcsPath = @"";
        self.mcsMiniProgramType = MiniProgramTypeRelease;
    }
    return self;
}

@end
