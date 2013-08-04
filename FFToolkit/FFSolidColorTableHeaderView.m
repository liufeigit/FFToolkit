//
//  DictionaryTableHeaderView.m
//  Dictionary
//
//  Created by Forrest Ye on 7/2/13.
//
//

#import "FFSolidColorTableHeaderView.h"


@implementation FFSolidColorTableHeaderView


+ (instancetype)viewWithText:(NSString *)text {
  return [self sharedInstanceWithText:text];
}


# pragma mark - private


// reuse globally
+ (instancetype)sharedInstanceWithText:(NSString *)text {
  static NSMutableDictionary* _instances = nil;

  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    _instances = [@{} mutableCopy];
  });

  @synchronized(_instances) {
    if (!_instances[text]) {
      FFSolidColorTableHeaderView *view = [[self alloc] initWithText:text];
      _instances[text] = view;
    }

    return _instances[text];
  }
}


- (instancetype)initWithText:(NSString *)text {
  self = [super initWithFrame:CGRectMake(0, 0, 320, 30)];

  if (self) {
    self.backgroundColor = [UIColor colorWithRed:0.65 green:0.34 blue:0.28 alpha:1.0];
    self.alpha = 0.9;

    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 310, 30)];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    self.textLabel.text = text;

    [self addSubview:self.textLabel];
  }

  return self;
}


@end
