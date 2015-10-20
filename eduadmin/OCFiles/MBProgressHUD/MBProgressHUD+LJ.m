//
//  MBProgressHUD+LJ.h
//  lntuApp
//
//  Created by 李杰 on 15-01-05.
//  Copyright (c) 2015年 PUPBOSS. All rights reserved.
//

#import "MBProgressHUD+LJ.h"

@implementation MBProgressHUD (LJ)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:0.9];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view {
    
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    
    hud.removeFromSuperViewOnHide = YES;
    
    hud.dimBackground = YES;
    
    return hud;
}

+ (void)showSuccess:(NSString *)success {
    
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error {
    
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message {
    
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view {
    
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {
    
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view];
}
@end
