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
    NSMutableArray *mLetras;
    mLetras = [NSMutableArray arrayWithObjects: @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"X", @"W", @"Z", nil];
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
     setTitle:@"Mostre"
     forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    [self.view addSubview:fotos];
    
    
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
