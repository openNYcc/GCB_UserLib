//
//  NSData+AES.h
//  BSMProject
//
//  Created by 晨哲劉 on 16/5/18.
//  Copyright © 2016年 Steven. All rights reserved.
//


#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Encryption)

- (NSData *)AES128EncryptWithKey:(NSString *)key gIv:(NSString *)Iv;   //加密
- (NSData *)AES128DecryptWithKey:(NSString *)key gIv:(NSString *)Iv;   //解密

@end
