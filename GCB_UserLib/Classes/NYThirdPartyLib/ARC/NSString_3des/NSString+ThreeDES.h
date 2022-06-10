//
//  NSString+ThreeDES.h
//  3DE
//
//  Created by Brandon Zhu on 31/10/2012.
//  Copyright (c) 2012 Brandon Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (ThreeDES)
//3DES加密kCCEncrypt
+ (NSString *)encryptDES:(NSString*)plainText key:(NSString*)key;
//3DES解密kCCDecrypt
+ (NSString *)decryptDES:(NSString*)plainText key:(NSString*)key;
+ (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key;
@end
