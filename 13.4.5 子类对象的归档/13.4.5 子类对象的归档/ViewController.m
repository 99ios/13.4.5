//
//  ViewController.m
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "ArchiveService.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)writeToFile:(id)sender {
    Student *student = [[Student alloc] init];
    student.name = self.nameTextField.text;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    student.age = [formatter numberFromString:self.ageTextField.text];
    student.score = self.scoreTextField.text;
    if([ArchiveService writeSubObjectToArchiveFile:student]){
        NSLog(@"归档成功");
    };
}

- (IBAction)readFromFile:(id)sender {
    Student *student = [ArchiveService readSubObjectFromArchiveFile];
    NSLog(@"student name: %@, student age:%@, student score:%@", student.name,student.age,student.score);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
