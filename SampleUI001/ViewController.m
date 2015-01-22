//
//  ViewController.m
//  SampleUI001
//
//  Created by Eriko Ichinohe on 2015/01/20.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL _isVisibleFlag;
    UIView *_backView;
    UITextField *_myTextField;
    UILabel *_myLabel;
    UIButton *_myButton;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //ボタンオブジェクトを生成
    [self createdButton];
   
    //オレンジ色のビューオブジェクトを生成
    
    _backView=[[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 250)];
    
    _backView.backgroundColor = [UIColor colorWithRed:1.0 green:0.54901 blue:0 alpha:1];
    [self.view addSubview:_backView];
    
    //オレンジ色のビューに灰色のテキストフィールドを生成
    _myTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    
    _myTextField.backgroundColor = [UIColor grayColor];
    
    [_myTextField addTarget:self action:@selector(returnBtn) forControlEvents:UIControlEventEditingDidEndOnExit];

    
    [_backView addSubview:_myTextField];
    
    //入力値を表示するラベルを生成
    _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 20)];
    
    _myLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_myLabel];
    
    
    //最初は非表示なのでNO
    _isVisibleFlag = NO;
    
}

//returnキーが押された時に反応するメソッド
-(void)returnBtn{
    NSLog(@"tapReturn");
    _myLabel.text = _myTextField.text;
    
    //TODO:ボタンやビューが下がる処理を記述
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [self downObjects];
    [UIView commitAnimations];

}

//tapされた時に反応するメソッド
-(void)tapBtn:(UIButton *)myButton{
    NSLog(@"Tap");
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];

    if (_isVisibleFlag) {
//        myButton.frame = CGRectMake(280, 548, 40, 20);
//        _backView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 250);
//        _isVisibleFlag = NO;
        [self downObjects];
    }else{
        myButton.frame = CGRectMake(280, 298, 40, 20);
        _backView.frame = CGRectMake(0, self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
        _isVisibleFlag = YES;
    }
    
    [UIView commitAnimations];

}

//ボタンを作成するメソッド
-(void)createdButton{
    _myButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 548, 40, 20)];
    
    [_myButton setTitle:@"Tap" forState:UIControlStateNormal];
    
    [_myButton setTitleColor:[UIColor colorWithRed:1.0 green:0.54901 blue:0 alpha:1] forState:UIControlStateNormal];
    
    [_myButton addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_myButton];
}
//オブジェクトを下げるメソッド
-(void)downObjects{
    _myButton.frame = CGRectMake(280, 548, 40, 20);
    _backView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 250);
    _isVisibleFlag = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
