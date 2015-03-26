//
//  HRPTableViewCell.m
//  HRPTableView
//
//  Created by Hao Runpeng on 14-8-18.
//  Copyright (c) 2014年 Hao Runpeng. All rights reserved.
//

#import "HRPTableViewCell.h"
#import "UIColor+HRPTableViewAdditions.h"

#define BUNDLE_NAME @ "HRPTableViewResource.bundle"
#define BUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: BUNDLE_NAME]
#define BUNDLE [NSBundle bundleWithPath: BUNDLE_PATH]

@interface HRPTableViewCell()

@property (nonatomic,strong) UIImageView *codeImageView;

@end

@implementation HRPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _codeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 25, 25)];
    _codeImageView.image            = [UIImage imageWithContentsOfFile: [self getResourcePath:@"circle_1.png"]];
    _codeImageView.highlightedImage = [UIImage imageWithContentsOfFile: [self getResourcePath:@"circle_2.png"]];
    _codeImageView.autoresizingMask =  UIViewAutoresizingFlexibleBottomMargin;
    [self.contentView addSubview:_codeImageView];
    
    _codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 18, 15, 15)];
    [_codeLabel setFrame:CGRectMake(21, 18, 15, 15)];
    _codeLabel.textAlignment    = NSTextAlignmentCenter;
    _codeLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin ;
    [self.contentView addSubview:_codeLabel];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor hrptv_colorWithHex:0x303030 alpha:1.0];
    _titleLabel.lineBreakMode             = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines             = 0;
    [self.contentView addSubview:_titleLabel];
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  _codeImageView.highlighted = selected;
  float height = self.bounds.size.height;
  float y      = 0;
  if (selected) {
    y = (height - 35) / 2;
    [_codeImageView setFrame:CGRectMake(10, y, 35, 35)];
    [_codeLabel setFont:[UIFont boldSystemFontOfSize:20]];
  }
  else{
    y = (height - 25) / 2;
    [_codeImageView setFrame:CGRectMake(15,y, 25, 25)];
    [_codeLabel setFont:[UIFont boldSystemFontOfSize:14]];
  }
  y = (height - 15) / 2 ;
  [_codeLabel setFrame:CGRectMake(21, y, 15, 15)];
  [_titleLabel setFrame:CGRectMake(55, 0, self.bounds.size.width - 55, self.bounds.size.height)];
}

- (NSString *)getResourcePath:(NSString *)filename
{
  NSBundle *libBundle = BUNDLE;
  NSString *path = @"";
  if (libBundle && filename) {
    path = [[libBundle resourcePath] stringByAppendingPathComponent:filename];
  }
  return path;
}

@end
