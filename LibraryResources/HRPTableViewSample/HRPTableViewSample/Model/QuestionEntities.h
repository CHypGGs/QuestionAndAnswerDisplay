//
//  QuestionEntities.h
//  Call
//
//  Created by Hao Runpeng on 14-8-15.
//  Copyright (c) 2014年 Hao Runpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, QuestionType) {
  QuestionTypeSingleChoice   = 0, // 单选题
  QuestionTypeMultipleChoice = 1, // 多选题
  QuestionTypeSubjective     = 2, // 主观题
};

@interface Question : NSObject

@property NSString     *Id;
@property NSString     *content;
@property QuestionType type;
@property NSArray      *options;
@property NSArray      *optionsResult;

@end

@interface Option : NSObject

@property NSString *Id;
@property NSString *questionId;
@property NSString *content;
@property BOOL      isCorrect;

@end
