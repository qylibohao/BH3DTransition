//
//  BHNavigationPushAnimation.m
//  BH3DTransition
//
//  Created by libohao on 15/8/8.
//  Copyright (c) 2015年 libohao. All rights reserved.
//

#import "BHNavigationPushAnimation.h"
#import "BHTransform.h"

@implementation BHNavigationPushAnimation

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor blackColor];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];
    fromViewController.view.frame = CGRectMake(0, 0, 320, CGRectGetHeight(fromViewController.view.frame));
    toViewController.view.frame = CGRectMake(0, 0, 320, CGRectGetHeight(toViewController.view.frame));
    
    
    
    // Change anchor point and reposition it.
    CGRect oldFrame = [[fromViewController.view layer]frame];
    [[fromViewController.view layer]setAnchorPoint:CGPointMake(0.0,0.5f)];
    [[fromViewController.view layer] setFrame:oldFrame];
    
    BHTransform * trans = [[BHTransform alloc]init];
    
    // Reset to initial transform
    [trans sourceFirstTransform:[fromViewController.view layer]];
    [trans destinationFirstTransform:[toViewController.view layer]];
    
    //Perform animation
    // 推入新页面
    
    [UIView animateWithDuration:duration delay:0.0f options:0 animations:^{
        [trans destinationLastTransform:[toViewController.view layer]];
    } completion:^(BOOL finished) {
        
    }];
    
    
    //退出当前页面
    [UIView animateWithDuration:0.8*duration delay:0.2*duration options:0 animations:^{
        [trans sourceLastTransform:[fromViewController.view layer]];
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
    
    
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}


@end
