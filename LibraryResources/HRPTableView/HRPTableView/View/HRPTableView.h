//
//  HRPTableView.h
//  HRPTableView
//
//  Created by Hao Runpeng on 14-8-18.
//  Copyright (c) 2014年 Hao Runpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HRPTableViewDataSource;
@protocol HRPtableViewDelegate;

@interface HRPTableView : UIView

@property (nonatomic) UIFont *questionFont;
@property (nonatomic) UIFont *optionFont;

@property (nonatomic,weak) id<HRPtableViewDelegate>   delegate;
@property (nonatomic,weak) id<HRPTableViewDataSource> dataSource;

- (instancetype)initWithFrame:(CGRect)frame;

@end

@protocol HRPTableViewDataSource <NSObject>

@required

- (NSInteger)numberOfQuestionsForTableView:(HRPTableView *)tableView;
- (NSString *)tableView:(HRPTableView *)tableView titleForQuestionAtIndex:(NSInteger)index;
- (NSInteger)tableView:(HRPTableView *)tableView numberOfOptionsForQuestionAtIndex:(NSInteger)index;
- (NSString *)tableView:(HRPTableView *)tableView titleforOptionAtIndex:(NSInteger)optionIndex forQuestionAtIndex:(NSInteger)questionIndex;

- (BOOL)tableView:(HRPTableView *)tableView allowsMultipleSelectionForQuestionAtIndex:(NSInteger)index;

@end

@protocol HRPtableViewDelegate <NSObject>

@required

- (void)tableView:(HRPTableView *)tableView didSelectOptionAtIndex:(NSInteger)optionIndex forQuestionAtIndex:(NSInteger)questionIndex;

- (void)tableView:(HRPTableView *)tableView didDeselectOptionAtIndex:(NSInteger)optionIndex forQuestionAtIndex:(NSInteger)questionIndex;

@end