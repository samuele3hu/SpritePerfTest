//
//  SpriteMyScene.h
//  SpriteKitTest
//

//  Copyright (c) 2014. 5. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

enum
{
    kMaxNodes = 50000,
    kNodesIncrease = 500,
    
    TEST_COUNT = 4,
};

@interface SpritePerfScene : SKScene

- (NSString*)curTitle;
- (void)initLabel;
- (void)initWithSubTest:(int)subTest :(int)nodes;
- (void)updateNodes;
- (void)onIncrease;
- (void)onDecrease;
- (void)doTest:(SKSpriteNode*)sprite;
- (int)getSubTestNum;
- (int)getNodeTest;
- (void)dumpProfileFps;

- (void)showCurTest;
+ (void)setCurCase:(int)cur;
+ (int)getCurCase;
+ (void)setStats:(bool)state;
+ (bool)getStats;

@property (SK_NONATOMIC_IOSONLY) int lastRenderedCount;
@property (SK_NONATOMIC_IOSONLY) int quantityNodes;
@property (SK_NONATOMIC_IOSONLY) int subtestNumber;
@property (SK_NONATOMIC_IOSONLY) int curCase;
@property (SK_NONATOMIC_IOSONLY) CFTimeInterval lastUpdateTime;
@property (SK_NONATOMIC_IOSONLY) CFTimeInterval accumDt;
@property (SK_NONATOMIC_IOSONLY) int frameCount;
@property (SK_NONATOMIC_IOSONLY) CFTimeInterval frameRate;
@property (SK_NONATOMIC_IOSONLY) int executeTimes;
@property (SK_NONATOMIC_IOSONLY) NSMutableArray* arrFps;
@property (SK_NONATOMIC_IOSONLY) CFTimeInterval lastExeStatusTime;

@end

@interface SpritePerformTest1 : SpritePerfScene

@end

@interface SpritePerformTest2 : SpritePerfScene

@end

@interface SpritePerformTest3 : SpritePerfScene

@end

@interface SpritePerformTest4: SpritePerfScene

@end






