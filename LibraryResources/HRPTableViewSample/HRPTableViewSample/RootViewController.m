//
//  RootViewController.m
//  HRPTableViewSample
//
//  Created by Hao Runpeng on 14-8-22.
//  Copyright (c) 2014年 Hao Runpeng. All rights reserved.
//

#import "RootViewController.h"
#import "HRPTableView.h"
#import "QuestionEntities.h"

@interface RootViewController ()
<HRPtableViewDelegate,HRPTableViewDataSource>

@property (nonatomic,strong) HRPTableView *tableView;
@property (nonatomic)        NSArray      *questions;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {

  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setUpTableDataSource];
  
  _tableView = [[HRPTableView alloc] initWithFrame:CGRectMake(100, 20, 824, 748)];
  _tableView.questionFont = [UIFont systemFontOfSize:16];
  _tableView.optionFont   = [UIFont systemFontOfSize:14];
  _tableView.dataSource   = self;
  _tableView.delegate     = self;
  
  [self.view addSubview:_tableView];
}


- (void)setUpTableDataSource
{
  Option *option1 = [[Option alloc] init];
  option1.Id         = @"1";
  option1.content    = @"是";
  option1.isCorrect  = NO;
  option1.questionId = @"1";
  
  Option *option2 = [[Option alloc] init];
  option2.Id         = @"2";
  option2.content    = @"否";
  option2.isCorrect  = NO;
  option2.questionId = @"1";
  
  Option *option3 = [[Option alloc] init];
  option3.Id         = @"3";
  option3.content    = @"本身具有过敏体质请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!本身具有过敏体质请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!本身具有过敏体质请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!请输入新鲜血液和血浆!2请输入新鲜血液和血浆!请输入新鲜血液和血浆!0请输入新鲜血液和血浆0";
  option3.isCorrect  = NO;
  option3.questionId = @"1";
  
  NSArray *options = @[option1,option2,option3];
  
  Question *question1 = [[Question alloc] init];
  question1.Id      = @"1";
  question1.type    = QuestionTypeSingleChoice;
  question1.content = @"Q1:你认为印发长期过敏不愈的主要原因是什么?你认为印发长期过敏不愈的主要原因是什么?你认为印发长期过敏不愈的主要原因是什么?你认为印发长期过敏不愈的主要原因是什么?你认为印发长期过敏不愈的主要原因是什么?你认为印发长期过敏不愈的主要原因是什么?你认为印发长期过敏不愈的主要原因是什么!";
  question1.options = options;
  
  Question *question2 = [[Question alloc] init];
  question2.Id      = @"2";
  question2.type    = QuestionTypeSingleChoice;
  question2.content = @"Q2:过敏是不是长期疾病?";
  question2.options = options;
  
  Question *question3 = [[Question alloc] init];
  question3.Id      = @"3";
  question3.type    = QuestionTypeSingleChoice;
  question3.content = @"Q3:你认为如何治疗过敏才是最佳方式? -- 单选";
  question3.options = options;
  
  Question *question4 = [[Question alloc] init];
  question4.Id      = @"4";
  question4.type    = QuestionTypeMultipleChoice;
  question4.content = @"Q4:过敏是否需要长期治疗 -- 多选";
  question4.options = options;
  
  self.questions = @[question1,question2,question3,question4];
}

#pragma mark -
#pragma mark HRPTableView DataSource & Delegate

- (NSInteger) numberOfQuestionsForTableView:(HRPTableView *)tableView
{
  return self.questions.count;
}

- (NSString *)tableView:(HRPTableView *)tableView
titleForQuestionAtIndex:(NSInteger)index
{
  Question *question = self.questions[index];
  return question.content;
}

- (NSInteger) tableView:(HRPTableView *)tableView numberOfOptionsForQuestionAtIndex:(NSInteger)index
{
  Question *question = self.questions[index];
  return question.options.count;
}

- (NSString *)tableView:(HRPTableView *)tableView
  titleforOptionAtIndex:(NSInteger)optionIndex
     forQuestionAtIndex:(NSInteger)questionIndex
{
  Question *question = self.questions[questionIndex];
  Option   *option   = question.options[optionIndex];
  return option.content;
}

- (BOOL)tableView:(HRPTableView *)tableView allowsMultipleSelectionForQuestionAtIndex:(NSInteger)index
{
  Question *question = self.questions[index];
  return question.type == QuestionTypeMultipleChoice;
}

- (void)tableView:(HRPTableView *)tableView
    didSelectOptionAtIndex:(NSInteger)optionIndex
        forQuestionAtIndex:(NSInteger)questionIndex
{
  NSLog(@"select:%d -- %d",questionIndex,optionIndex);
}

- (void)tableView:(HRPTableView *)tableView
    didDeselectOptionAtIndex:(NSInteger)optionIndex
          forQuestionAtIndex:(NSInteger)questionIndex
{
  NSLog(@"Deselect:%d -- %d",questionIndex,optionIndex);
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
