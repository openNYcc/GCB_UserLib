//
//  AESUtil.h
//  BSMProject
//
//  Created by 晨哲劉 on 16/5/18.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESUtil : NSObject

#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;

+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;

#pragma mark - AES加密
//将string转成带密码的data
+ (NSString*)encryptAESData:(NSString*)string withKey:(NSString*)key;
//将带密码的data转成string
+ (NSString*)decryptAESData:(NSString*)string withKey:(NSString*)key;


@end
