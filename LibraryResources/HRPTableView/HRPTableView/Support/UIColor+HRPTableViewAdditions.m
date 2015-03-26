//
//  UIColor+HRPTableViewAdditions.m
//  HRPTableView
//
//  Created by Hao Runpeng on 14-8-19.
//  Copyright (c) 2014年 Hao Runpeng. All rights reserved.
//

#import "UIColor+HRPTableViewAdditions.h"

@implementation UIColor (HRPTableViewAdditions)

+ (UIColor*)hrptv_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
  return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                         green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                          blue:((float)(hexValue & 0xFF)) / 255.0
                         alpha:alphaValue];
}

@end
