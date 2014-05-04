//
//  SpriteViewController.m
//  SpriteKitTest
//
//  Created by Qingkui.Hu on 14-4-24.
//  Copyright (c) 2014年 5. All rights reserved.
//

#import "SpriteViewController.h"
#import "SpriteMyScene.h"

@implementation SpriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    
    // Create and configure the scene.
    [SpritePerfScene setCurCase:0];
    SpritePerfScene * scene = [SpritePerformTest1 sceneWithSize:skView.bounds.size];
    [scene initWithSubTest: 9 : kNodesIncrease];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
