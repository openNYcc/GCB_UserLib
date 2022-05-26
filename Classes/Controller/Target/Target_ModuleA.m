//
//  Target_ModuleA.m
//  GCB_UserLib
//
//  Created by sjtx on 2022/5/26.
//

#import "Target_ModuleA.h"
#import "ModuleAViewController.h"

@implementation Target_ModuleA

-(UIViewController *)Action_viewController:(NSDictionary *)params
{
    ModuleAViewController *VC = [[ModuleAViewController alloc] init];
    return VC;
}

@end

