//
//  TodosLetraViewController.h
//  Navigation
//
//  Created by Gustavo Maturana Abussamra on 26/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TodosLetraViewController : UIViewController

@property (strong,nonatomic)AVSpeechSynthesizer *fala;
@property (strong,nonatomic)AVSpeechUtterance *som;

@end
