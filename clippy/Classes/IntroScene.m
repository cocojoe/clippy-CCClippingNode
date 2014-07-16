//
//  IntroScene.m
//  clippy
//
//  Created by Martin Walsh on 16/07/2014.
//  Copyright Pedro LTD 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Import the interfaces
#import "IntroScene.h"

// -----------------------------------------------------------------------
#pragma mark - IntroScene
// -----------------------------------------------------------------------

@implementation IntroScene

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (IntroScene *)scene
{
	return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    // Create a colored background (Dark Grey)
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]];
    [self addChild:background];
    
    // Hello world
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Chalkduster" fontSize:36.0f];
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor redColor];
    label.position = ccp(0.5f, 0.5f); // Middle of screen
   
    // Create Clipping ViewPort
    CCNodeColor *scissorRect = [CCNodeColor nodeWithColor:[CCColor clearColor] width:100 height:50];
    [scissorRect setAnchorPoint:ccp(0.5,0.5f)];
    [scissorRect setPosition:ccp(240,160)];
    
    // Create Clipping Node
    CCClippingNode *scissor = [CCClippingNode clippingNodeWithStencil:scissorRect];
    [scissor setContentSize:self.contentSize];
    [scissor setPositionType:CCPositionTypeNormalized];
   
    [scissor setAlphaThreshold:0.0];
    
    //[scissor setInverted:YES];
    [self addChild:scissor];
    
    // Add nodes to Clipping Node
    [scissor addChild:label];


    // done
	return self;
}
// -----------------------------------------------------------------------
@end
