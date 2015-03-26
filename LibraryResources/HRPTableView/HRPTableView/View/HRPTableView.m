//
//  HRPTableView.m
//  HRPTableView
//
//  Created by Hao Runpeng on 14-8-18.
//  Copyright (c) 2014年 Hao Runpeng. All rights reserved.
//

#import "HRPTableView.h"
#import "HRPTableViewCell.h"
#import "UIColor+HRPTableViewAdditions.h"

@interface HRPTableView ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HRPTableView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.allowsMultipleSelection = YES;
    _tableView.separatorStyle          = UITableViewCellSeparatorStyleSingleLine;
    _tableView.dataSource              = self;
    _tableView.delegate                = self;
    [self addSubview:_tableView];
  }
  return self;
}

- (UIFont *)questionFont
{
  if (_questionFont == nil) {
    _questionFont =  [UIFont systemFontOfSize:16];
  }
  return _questionFont;
}

- (UIFont *)optionFont
{
  if (_optionFont == nil) {
    _optionFont = [UIFont systemFontOfSize:14];
  }
  return _optionFont;
}

#pragma mark -
#pragma mark UITableView DataSource &Delegate

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
  NSString *questionTitle = [self.dataSource tableView:self titleForQuestionAtIndex:section];
  return [self heightForQuestion:questionTitle];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *optionContent = [self.dataSource tableView:self
                                 titleforOptionAtIndex:indexPath.row
                                    forQuestionAtIndex:indexPath.section];
  return [self heightForOption:optionContent];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [self.dataSource numberOfQuestionsForTableView:self];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.dataSource tableView:self numberOfOptionsForQuestionAtIndex:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *header = [[UIView alloc] init];
  header.backgroundColor = [UIColor whiteColor];
  
  NSString *questionTitle = [self.dataSource tableView:self titleForQuestionAtIndex:section];
  float width  = self.bounds.size.width - 10 * 2;
  float height = [self heightForQuestion:questionTitle];
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,0,width,height)];
  label.font                      = self.questionFont;
  label.textColor                 = [UIColor hrptv_colorWithHex:0x008cd6 alpha:1.0];
  label.lineBreakMode             = NSLineBreakByWordWrapping;
  label.numberOfLines             = 0;
  label.text                      = [self.dataSource tableView:self titleForQuestionAtIndex:section];
  [header addSubview:label];
  return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifier = @"OptionCell";
  HRPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[HRPTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    cell.titleLabel.font = self.optionFont;
  }
  cell.codeLabel.text  = [NSString stringWithFormat:@"%c", 'A' + indexPath.row];
  cell.titleLabel.text = [self.dataSource tableView:self
                              titleforOptionAtIndex:indexPath.row
                                 forQuestionAtIndex:indexPath.section];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (![self.dataSource tableView:self allowsMultipleSelectionForQuestionAtIndex:indexPath.section])
  {
    NSArray *selectedIndexPaths = tableView.indexPathsForSelectedRows;
    for (NSIndexPath *selectedIndexPath in selectedIndexPaths)
    {
      if (selectedIndexPath.section == indexPath.section && selectedIndexPath.row != indexPath.row)
      {
        [tableView deselectRowAtIndexPath:selectedIndexPath animated:NO];
      }
    }
  }
  [self.delegate tableView:self didSelectOptionAtIndex:indexPath.row forQuestionAtIndex:indexPath.section];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.delegate tableView:self didDeselectOptionAtIndex:indexPath.row forQuestionAtIndex:indexPath.section];
}

#pragma mark - Private Method

- (CGFloat)heightForQuestion:(NSString *)text
{
  if (text.length == 0) {
    return 100;
  }
  CGFloat height = [self heightOfContent:text withFont:self.questionFont];
  return height <= 100 ? 100 : height;
}

- (CGFloat)heightForOption:(NSString *)text
{
  if (text.length == 0) {
    return 50;
  }
  CGFloat height = [self heightOfContent:text withFont:self.optionFont];
  return height <= 50 ? 50 : height * 1.2;
}

- (CGFloat)heightOfContent:(NSString *)text withFont:(UIFont*)font
{
  NSDictionary *attributes = @{NSFontAttributeName:font};
  CGRect rect = [text boundingRectWithSize:self.bounds.size
                                   options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                attributes:attributes
                                   context:nil];
  CGFloat labelHeight = rect.size.height;
  return labelHeight;
}
@end
