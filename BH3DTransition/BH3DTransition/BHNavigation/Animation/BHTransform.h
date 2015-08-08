//
//  BHTransform.h
//  BH3DTransition
//
//  Created by libohao on 15/8/8.
//  Copyright (c) 2015年 libohao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BHTransform : NSObject

-(void)destinationFirstTransform:(CALayer* )layer;
-(void) destinationLastTransform:(CALayer*) layer;


-(void)sourceFirstTransform:(CALayer *)layer;
-(void)sourceLastTransform:(CALayer *)layer;

@end
