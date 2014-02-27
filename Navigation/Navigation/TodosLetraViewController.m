//
//  TodosLetraViewController.m
//  Navigation
//
//  Created by Gustavo Maturana Abussamra on 26/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "TodosLetraViewController.h"


@interface TodosLetraViewController ()

@end

@implementation TodosLetraViewController

int indice = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void) viewDidLoad {
    
    if (indice == 26){
        indice = 0;
    }
    
    NSMutableArray *mLetras;
    mLetras = [NSMutableArray arrayWithObjects: @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
//    NSMutableArray *mPalavras;
    mPalavras = [NSMutableArray arrayWithObjects: @"Apple", @"Banana", @"Casa", @"Dado", @"Elefante", @"Fada", @"Gato", @"Helicóptero", @"Igreja", @"Jacare", @"Kiko", @"Lapis", @"Macaco", @"Navio", @"Oculos", @"Pato", @"Queijo", @"Rato", @"Sapato", @"Tatu", @"Uva", @"Vaca", @"Walle", @"Xicara", @"Yakisoba", @"Zebra", nil];
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@", [mLetras objectAtIndex:indice]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton
                       buttonWithType:UIButtonTypeSystem];
    
    UIImage *imagem = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [mLetras objectAtIndex:indice]]];
//    UIImage *imagem = [UIImage imageNamed:@"A.png"];
    UIImageView *fotos = [[UIImageView alloc]init];
    [fotos setFrame:CGRectMake(110, 70, 100, 150)];
    [fotos setImage: imagem];
    
   
    
    [botao
     setTitle:[NSString stringWithFormat:@"%@", [mPalavras objectAtIndex:indice]]
     forState:UIControlStateNormal];
    [botao sizeToFit];
    [botao addTarget:self action:@selector(FalaPalavra:) forControlEvents:(UIControlEventTouchDown)];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    [self.view addSubview:fotos];
    
    
}

-(IBAction)FalaPalavra:(id)sender
{
    NSString *pa = [mPalavras objectAtIndex:indice];
    NSLog(@"%@",pa);
    
    AVSpeechSynthesizer *so = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *ut = [[AVSpeechUtterance alloc]initWithString:pa];
    ut.rate= AVSpeechUtteranceMinimumSpeechRate;
    ut.voice= [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-br"];
    [so speakUtterance:ut];
//    
//    AVSpeechUtterance *som = [[AVSpeechUtterance alloc]initWithString:pa];


    
}


-(void)prev:(id)sender {
    
    [self.navigationController popToViewController:self animated:YES];
    
    indice--;
}

-(void)next:(id)sender {
    TodosLetraViewController *proximo = [[TodosLetraViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    indice++;
    

    
    
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
