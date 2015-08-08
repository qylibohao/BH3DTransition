//
//  BHNavigationPopAnimation.m
//  BH3DTransition
//
//  Created by libohao on 15/8/8.
//  Copyright (c) 2015年 libohao. All rights reserved.
//

#import "BH3DNavigationPopAnimation.h"

#import "BHTransform.h"

@implementation BH3DNavigationPopAnimation

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [containerView addSubview:fromViewController.view];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    // [containerView insertSubview:self.toBackgroundView belowSubview:fromViewController.view];
    // [containerView insertSubview:self.shadowImageView belowSubview:fromViewController.view];
    duration = 0.6;
    BHTransform* trans = [[BHTransform alloc]init];
    [trans sourceLastTransform:[toViewController.view layer]];
    [trans destinationLastTransform:[fromViewController.view layer]];
    
    //Perform animation
    [UIView animateWithDuration:0.8f*duration delay:0.2f*duration options:UIViewAnimationOptionCurveLinear animations:^{
        [trans destinationFirstTransform:[fromViewController.view layer]];
    } completion:^(BOOL finished) {
        //completion(YES);
    }];
    
    [UIView animateWithDuration:duration delay:0.0f options:0 animations:^{
        [trans sourceFirstTransform:[toViewController.view layer]];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}


@end
