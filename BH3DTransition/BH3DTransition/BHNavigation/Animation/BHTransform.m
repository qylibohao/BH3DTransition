//
//  BHTransform.m
//  BH3DTransition
//
//  Created by libohao on 15/8/8.
//  Copyright (c) 2015年 libohao. All rights reserved.
//

#import "BHTransform.h"

@implementation BHTransform

-(void)destinationFirstTransform:(CALayer* )layer
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/ -500;
    // Rotate 5 degrees within the axis of z axis
    t = CATransform3DRotate(t, [self radianFromDegree:5.0f], 0.0f,0.0f, 1.0f);
    // Reposition toward to the left where it initialized
    t = CATransform3DTranslate(t, 320.0f, -40.0f,  150.0f);
    // Rotate it -45 degrees within the y axis
    t = CATransform3DRotate(t,[self radianFromDegree:-45], 0.0f,1.0f, 0.0f);
    // Rotate it 10 degrees within thee x axis
    t = CATransform3DRotate(t, [self radianFromDegree:10], 1.0f,0.0f, 0.0f);
    layer.transform = t;
}

-(void) destinationLastTransform:(CALayer*) layer
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/ -500;
    // Rotate to 0 degrees within z axis
    t = CATransform3DRotate(t,[self radianFromDegree:0], 0.0f,0.0f, 1.0f);
    // Bring back to the final position
    t = CATransform3DTranslate(t, 0.0f, 0.0f,  0.0f);
    // Rotate 0 degrees within y axis
    t = CATransform3DRotate(t, [self radianFromDegree:0], 0.0f,1.0f, 0.0f);
    // Rotate 0 degrees within  x axis
    t = CATransform3DRotate(t, [self radianFromDegree:0], 1.0f,0.0f, 0.0f);
    layer.transform = t;
}

#pragma mark - Convert Degrees to Radian
-(double)radianFromDegree:(float) degrees
{
    return (degrees / 180) * M_PI;
}

#pragma mark - Required 3d Transform
-(void)sourceFirstTransform:(CALayer *)layer
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/ -500;
    t = CATransform3DTranslate(t, 0.0f, 0.0f,  0.0f);
    layer.transform = t;
}

-(void)sourceLastTransform:(CALayer *)layer {
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/ -500;
    t = CATransform3DRotate(t, [self radianFromDegree:80], 0.0f,1.0f, 0.0f);
    t = CATransform3DTranslate(t, 0.0f, 0.0f,  -30.0f);
    t = CATransform3DTranslate(t,170.0f, 0.0f,  0.0f);
    layer.transform = t;
}

@end
