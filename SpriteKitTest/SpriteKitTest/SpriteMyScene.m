//
//  SpriteMyScene.m
//  SpriteKitTest
//
//  Created by Qingkui.Hu on 14-4-24.
//  Copyright (c) 2014年 5. All rights reserved.
//

#import "SpriteMyScene.h"

#define CCRANDOM_0_1() ((float)rand()/RAND_MAX)

@implementation SpritePerfScene

static int curCase;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [self initLabel];
    }
    return self;
}

-(NSString*)curTitle{
    return @"No title";
}

-(void)initLabel{
    SKLabelNode *decrease = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    decrease.text = @"-";
    decrease.fontSize = 15;
    decrease.fontColor = [SKColor greenColor];
    decrease.position = CGPointMake(CGRectGetMidX(self.frame) - 50,
                                    CGRectGetMidY(self.frame) + 50);
    decrease.name = @"decrease";
    [self addChild:decrease];
    
    SKLabelNode *increase = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    increase.text = @"+";
    increase.fontSize = 15;
    increase.fontColor = [SKColor greenColor];
    increase.position = CGPointMake(CGRectGetMidX(self.frame) + 50,
                                    CGRectGetMidY(self.frame) + 50);
    increase.name = @"increase";
    [self addChild:increase];
    
    SKLabelNode *subItem9 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    subItem9.text = @"9";
    subItem9.fontSize = 15;
    subItem9.fontColor = [SKColor greenColor];
    subItem9.position = CGPointMake(CGRectGetMidX(self.frame) - 50,
                                    CGRectGetMidY(self.frame) - 50);
    subItem9.name = @"subItem9";
    [self addChild:subItem9];
    
    SKLabelNode *subItem10 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    subItem10.text = @"10";
    subItem10.fontSize = 15;
    subItem10.fontColor = [SKColor greenColor];
    subItem10.position = CGPointMake(CGRectGetMidX(self.frame) + 50,
                                     CGRectGetMidY(self.frame) - 50);
    subItem10.name = @"subItem10";
    [self addChild:subItem10];
    
    
    SKLabelNode *itemNodeNum = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    itemNodeNum.text = @"500";
    itemNodeNum.fontSize = 15;
    itemNodeNum.fontColor = [SKColor greenColor];
    itemNodeNum.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame) + 30);
    itemNodeNum.name = @"itemNodeNum";
    [self addChild:itemNodeNum];
    
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"Images/b1.png"];
    [back setScale:0.2];
    back.position = CGPointMake(CGRectGetMidX(self.frame) - back.size.width * 2, CGRectGetMidY(self.frame) - back.size.height * 4);
    back.name = @"back";
    [self addChild:back];
    
    SKSpriteNode *restart = [SKSpriteNode spriteNodeWithImageNamed:@"Images/r1.png"];
    [restart setScale:0.2];
    restart.position = CGPointMake(CGRectGetMidX(self.frame),  CGRectGetMidY(self.frame) - back.size.height * 4);
    restart.name = @"restart";
    [self addChild:restart];
    
    SKSpriteNode *next = [SKSpriteNode spriteNodeWithImageNamed:@"Images/f1.png"];
    [next setScale:0.2];
    next.position = CGPointMake(CGRectGetMidX(self.frame) + next.size.width * 2, CGRectGetMidY(self.frame) - back.size.height * 4);
    next.name = @"next";
    [self addChild:next];
}

- (int)getSubTestNum{
    return self.subtestNumber;
}
- (int)getNodeTest{
    return self.quantityNodes;
}

-(void)initWithSubTest:(int)subTest :(int)nodes{
    
    self.subtestNumber = subTest;
    self.lastRenderedCount = 0;
    self.quantityNodes     = 0;
    
    SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    titleLabel.text = [self curTitle];
    titleLabel.fontSize = 15;
    titleLabel.fontColor = [SKColor yellowColor];
    titleLabel.position = CGPointMake(CGRectGetMidX(self.frame) + 15,
                                     CGRectGetMidY(self.frame) + 70);
    titleLabel.name = @"title";
    [self addChild:titleLabel];
    
    while (self.quantityNodes < nodes) {
        [self onIncrease];
    }
}

-(void)updateNodes{
    if (self.quantityNodes != self.lastRenderedCount) {
        SKLabelNode* infoLabel = (SKLabelNode*)[self childNodeWithName:@"itemNodeNum"];
        infoLabel.text = [NSString stringWithFormat: @"%d", self.quantityNodes];
        self.lastRenderedCount = self.quantityNodes;
    }
}

-(SKSpriteNode*)createSprite{
    
    SKSpriteNode* sprite = nil;
    switch (self.subtestNumber) {
        case 9:
            {
                int y,x;
                int r = CCRANDOM_0_1() * 6400 / 100;
                
                y = r / 8;
                x = r % 8;
                
                NSString* fileName = [NSString stringWithFormat:@"Images/sprites_test/sprite-%d-%d.png", x, y];
                sprite = [SKSpriteNode spriteNodeWithImageNamed:fileName];
                sprite.position = CGPointMake(rand() % (int)CGRectGetWidth(self.frame), rand() % (int)CGRectGetHeight(self.frame));
                sprite.zPosition = -1;
                [self addChild:sprite];
            }
            break;
            
        case 10:
            {
                int y,x;
                int r = (CCRANDOM_0_1() * 6400 / 100);
                
                y = r / 8;
                x = r % 8;
                
                x *= 32;
                y *= 32;
                
                SKTexture* texture = [SKTexture textureWithImageNamed:@"Images/spritesheet1.png"];
                SKTexture* subTexture = [SKTexture textureWithRect:CGRectMake(x / texture.size.width, y / texture.size.height, 32 / texture.size.width, 32 / texture.size.height) inTexture:texture];
                                         
                sprite = [SKSpriteNode spriteNodeWithTexture:subTexture];
                [self addChild:sprite];
            }
            break;
            
        default:
            break;
    }
    
    return sprite;
}

- (void)onIncrease{
    if (self.quantityNodes >= kMaxNodes) {
        return;
    }
    
    SKSpriteNode* sprite = nil;
    for (int i = 0; i < kNodesIncrease; i++) {
        
        sprite = [self createSprite];
        [sprite setName:[NSString stringWithFormat:@"sprite %d",self.quantityNodes]];
        [self doTest:sprite];
        self.quantityNodes++;
    }
    
    [self updateNodes];
}

- (void)onDecrease{
    
    if (self.quantityNodes <= 0) {
        return;
    }
    
    for (int i = 0 ; i < kNodesIncrease; i++) {
        self.quantityNodes--;
        SKSpriteNode* sprite = (SKSpriteNode*)[self childNodeWithName:[NSString stringWithFormat:@"sprite %d",self.quantityNodes]];
        [sprite removeFromParent];
        
    }
    [self updateNodes];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKNode* node     = [self nodeAtPoint:location];
        if ([node.name isEqualToString:@"decrease"])
        {
            [self onDecrease];
        }
        else if ([node.name isEqualToString:@"increase"])
        {
            [self onIncrease];
        }
        else if([node.name isEqualToString:@"next"])
        {
            [SpritePerfScene setCurCase:([SpritePerfScene getCurCase] + 1) % TEST_COUNT];
            [self showCurTest];
        }
        else if([node.name isEqualToString:@"back"])
        {
            int curCase = [SpritePerfScene getCurCase] - 1;
            if (curCase < 0) {
                curCase += TEST_COUNT;
            }
            [SpritePerfScene setCurCase:curCase];
            [self showCurTest];
        }
        else if([node.name isEqualToString:@"restart"])
        {
            [self showCurTest];
        }
        else if([node.name isEqual:@"subItem9"])
        {
            self.subtestNumber = 9;
            [self showCurTest];
        }
        else if([node.name isEqual:@"subItem10"])
        {
            self.subtestNumber = 10;
            [self showCurTest];
        }
    }
}

- (void)doTest:(SKSpriteNode*)sprite {
}

- (void)showCurTest{
    SpritePerfScene* scene = nil;
    int subTest = self.subtestNumber;
    int sprites = self.quantityNodes;
    
    switch ([SpritePerfScene getCurCase]) {
        case 0:
            {
                 scene = [SpritePerformTest1 sceneWithSize:[self view].bounds.size];
            }
            break;
        case 1:
            {
                 scene = [SpritePerformTest2 sceneWithSize:[self view].bounds.size];
            }
            break;
        case 2:
            {
                scene = [SpritePerformTest3 sceneWithSize:[self view].bounds.size];
            }
            break;
        case 3:
            {
                scene = [SpritePerformTest4 sceneWithSize:[self view].bounds.size];
            }
            break;
        default:
            break;
    }
    
    if (nil != scene) {
        [scene initWithSubTest: subTest : sprites];
        [self.view presentScene:scene];
    }
}

+ (void)setCurCase:(int)cur{
    curCase = cur;
}
+ (int)getCurCase{
    return curCase;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

@implementation SpritePerformTest1

-(NSString*)curTitle {
    return [NSString stringWithFormat:@"A (%d) position", self.subtestNumber];
}

-(void)doTest:(SKSpriteNode*)sprite {
    
    sprite.position = CGPointMake(rand() % (int)CGRectGetWidth(self.frame), rand() % (int)CGRectGetHeight(self.frame));
    sprite.zPosition = -1;
}

@end

@implementation SpritePerformTest2

-(NSString*)curTitle {
    return [NSString stringWithFormat:@"D (%d) 100%% out", self.subtestNumber];
}

-(void)doTest:(SKSpriteNode*)sprite {
    
    sprite.position = CGPointMake(-1000, -1000);
    sprite.zPosition = -1;
}

@end

@implementation SpritePerformTest3

-(NSString*)curTitle {
    return [NSString stringWithFormat:@"E (%d) 80%% out", self.subtestNumber];
}

-(void)doTest:(SKSpriteNode*)sprite {
    
    if (CCRANDOM_0_1() < 0.2f) {
        sprite.position = CGPointMake(rand() % (int)CGRectGetWidth(self.frame), rand() % (int)CGRectGetHeight(self.frame));
    }
    else{
        sprite.position = CGPointMake(-1000, -1000);
    }
    sprite.zPosition = -1;
}

@end

@implementation SpritePerformTest4

-(NSString*)curTitle {
    return [NSString stringWithFormat:@"G (%d) actions 80%% out", self.subtestNumber];
}

-(void)doTest:(SKSpriteNode*)sprite {
    
    if (CCRANDOM_0_1() < 0.2f) {
        sprite.position = CGPointMake(rand() % (int)CGRectGetWidth(self.frame), rand() % (int)CGRectGetHeight(self.frame));
    }
    else{
        sprite.position = CGPointMake(-1000, -1000);
    }
    
    float period = 0.5f + (rand() % 1000) / 500.0f;
    SKAction* rot = [SKAction rotateByAngle:M_PI * 2 * CCRANDOM_0_1() duration:period];
    SKAction* rot_back = [rot reversedAction];
    SKAction* permanentRotation = [SKAction repeatActionForever:[SKAction sequence:@[rot, rot_back]]];
    [sprite runAction:permanentRotation];
    
    
    float growDuration = 0.5f + (rand() % 1000) / 500.0f;
    SKAction* grow = [SKAction scaleBy:0.5f duration:growDuration];
    SKAction* permanentScaleLoop = [SKAction repeatActionForever:[SKAction sequence:@[grow, [grow reversedAction]]]];
    [sprite runAction:permanentScaleLoop];
    
    sprite.zPosition = -1;
}

@end
