//
//  MTDLViewController.m
//  MyTodoList
//
//  Created by Nelson Terra on 16/12/13.
//  Copyright (c) 2013 Nelson Terra. All rights reserved.
//

#import "MTDLViewController.h"
#import "MTDLTask.h"

@interface MTDLViewController ()

@property (nonatomic) NSMutableArray *taskList;

@property (weak, nonatomic) IBOutlet UITableView *taskListView;
@property (weak, nonatomic) IBOutlet UITextField *newTaskField;

@end

@implementation MTDLViewController

- (IBAction)newTaskClicked:(id)sender
{
    MTDLTask * newTask = [[MTDLTask alloc] initWithName:[self.newTaskField text]];
    
    [_taskList addObject:newTask];
                          
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _taskList = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_taskList count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"thingCell";
    
    UITableViewCell *cell = [self.taskListView dequeueReusableCellWithIdentifier:cellID];
    
    if ( cell == nil )
    {
        // Com StyleDefault, aparece só o título, sem a descrição
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        // Com StyleSubtitle, são mostrados título e descrição
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    MTDLTask *task = [_taskList objectAtIndex:[indexPath row]];
    cell.textLabel.text = [task name];
    
    // Adiciona imagem à célula
    //cell.imageView.image = [UIImage imageNamed:@"imagem.png"];
    
    return cell;
}

@end
