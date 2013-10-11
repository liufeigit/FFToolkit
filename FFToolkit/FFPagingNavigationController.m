//
//  MSNNavigationController.m
//  MineSweeper Neue
//
//  Created by Forrest Ye on 10/6/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//

#import "FFPagingNavigationController.h"

// views
#import "FFPagingNavigationBar.h"

// buttons
#import "FFPagingNavigationBarBackButton.h"

// controllers
#import "FFScrollableViewController.h"


@interface FFPagingNavigationController ()

@property (nonatomic) FFScrollableViewController *rootViewController;

@property (nonatomic) UIScrollView *backgroundScrollView;

@end


@implementation FFPagingNavigationController


- (instancetype)initWithRootViewController:(FFScrollableViewController *)rootViewController {
  self = [super init];

  if (self) {
    [self setupBackgroundScrollView];

    self.rootViewController = rootViewController;

    self.backgroundScrollView.contentSize = self.view.bounds.size;

    [self ____addChildViewController:self.rootViewController animated:NO];
  }

  return self;
}


- (void)setupBackgroundScrollView {
  self.backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  self.backgroundScrollView.pagingEnabled = YES;
  self.backgroundScrollView.showsHorizontalScrollIndicator = NO;
  self.backgroundScrollView.canCancelContentTouches = NO;

  [self.view addSubview:self.backgroundScrollView];
}


# pragma mark


- (void)pushViewController:(FFScrollableViewController *)viewController {
  NSParameterAssert(self.numberOfPages == self.childViewControllers.count);

  [self ____discardForwardChildViewControllers];

  self.backgroundScrollView.contentSize = CGSizeMake((self.currentPage + 2) * self.pageWidth,
                                                     self.pageWidth);

  [self ____setupNavigationBarForViewController:viewController];

  [self ____addChildViewController:viewController animated:YES];
}

- (void)goBack {
  NSParameterAssert(self.numberOfPages > 1);
  NSParameterAssert(self.currentPage > 0);

  FFScrollableViewController *lastViewController = self.childViewControllers[self.currentPage - 1];

  [self.backgroundScrollView scrollRectToVisible:lastViewController.view.frame animated:YES];
}


# pragma mark - private


- (void)____addChildViewController:(FFScrollableViewController *)viewController animated:(BOOL)animated {
  [self addChildViewController:viewController];

  viewController.view.center = CGPointMake(self.numberOfPages * self.pageWidth - self.view.center.x,
                                           self.view.center.y);

  [self.backgroundScrollView addSubview:viewController.view];

  [self.backgroundScrollView scrollRectToVisible:viewController.view.frame animated:animated];
}

- (void)____discardForwardChildViewControllers {
  if (self.numberOfPages - 1 > self.currentPage) {
    // not at last page, drop forward pages

    // fix child controller retaining
    NSMutableArray *viewControllersToRemove = [NSMutableArray array];

    for (int i = self.currentPage + 1; i < self.childViewControllers.count; i++) {
      FFScrollableViewController *childViewController = self.childViewControllers[i];

      [viewControllersToRemove addObject:childViewController];
    }

    for (FFScrollableViewController *childViewController in viewControllersToRemove) {

      // unregister navigationBar from KVO
      // maybe we should make navigationBar a property in MSNScrollableViewController?
      for (UIView *subView in childViewController.view.subviews) {
        if ([subView isKindOfClass:[FFPagingNavigationBar class]]) {
          [childViewController.scrollView removeObserver:subView forKeyPath:@"contentOffset"];
        }
      }

      [childViewController.view removeFromSuperview];
      [childViewController removeFromParentViewController];
    }
  }
}

- (void)____setupNavigationBarForViewController:(FFScrollableViewController *)viewController {
  CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44);

  FFPagingNavigationBar *navigationBar = [[FFPagingNavigationBar alloc] initWithFrame:frame];

  navigationBar.titleLabel.text = viewController.title;

  navigationBar.backButton.delegate = self;

  [viewController.scrollView addObserver:navigationBar forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];

  viewController.scrollView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);

  [viewController.view addSubview:navigationBar];
}


# pragma mark


- (NSUInteger)pageWidth {
  return CGRectGetWidth(self.view.bounds);
}

- (NSUInteger)currentPage {
  return self.backgroundScrollView.contentOffset.x / self.pageWidth;
}

- (NSUInteger)numberOfPages {
  return self.backgroundScrollView.contentSize.width / self.pageWidth;
}


# pragma mark - FFButtonDelegate


- (void)didPressedButton:(FFButton *)button {
  NSParameterAssert([button isKindOfClass:[FFPagingNavigationBarBackButton class]]);

  [self goBack];
}


@end
