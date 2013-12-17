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
{
    NSMutableArray *taskList;
    BOOL addingMode;
}

@property (weak, nonatomic) IBOutlet UITableView *taskListView;
@property (weak, nonatomic) IBOutlet UITextField *addTaskField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

@end

@implementation MTDLViewController

@synthesize taskListView;

- (IBAction)newTaskClicked:(id)sender
{
    if([self.addTaskField text] && ![[self.addTaskField text] isEqualToString:@""]){
        
        MTDLTask * newTask = [[MTDLTask alloc] initWithName:[self.addTaskField text]];
            
        [taskList addObject:newTask];
        [self.addTaskField setText:@""];
        [self.taskListView reloadData];
    }
}
- (IBAction)plusButtonClicked:(id)sender
{
    if (!addingMode){
        addingMode = YES;
        self.addTaskField.hidden = NO;
        self.okButton.hidden = NO;
        [sender setTitle:@"-" forState:UIControlStateNormal];
        NSLog(@"set to -");

    } else {
        addingMode = NO;
        self.addTaskField.hidden = YES;
        self.okButton.hidden = YES;
        [sender setTitle:@"+" forState:UIControlStateNormal];
        NSLog(@"set to +");
        [self.addTaskField resignFirstResponder];

    }
    
    NSLog(@"pass");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    addingMode = NO;
    taskList = [[NSMutableArray alloc] init];
    self.addTaskField.hidden = YES;
    self.okButton.hidden = YES;
    
    NSLog(@"did load");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)removeItemAtIndexPath: (NSIndexPath *) indexPath
{
    //"Avisa" que serão feitas alterações na tableView
    [self.taskListView beginUpdates];
    
    // Remove a linha do NSMutableArray que contém os dados(tableData).
    [taskList removeObjectAtIndex:indexPath.row];
    
    //"Avisa" que a tabela foi modificada e remove da tableView.
    [self.taskListView deleteRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationRight];
    //"Avisa" que terminaram as alterações na tableView
    [self.taskListView endUpdates];
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self removeItemAtIndexPath:indexPath];
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [taskList count];
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"taskCell";
    
    UITableViewCell *cell = [self.taskListView dequeueReusableCellWithIdentifier:cellID];
    
    if ( cell == nil )
    {
        // Com StyleDefault, aparece só o título, sem a descrição
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        // Com StyleSubtitle, são mostrados título e descrição
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    MTDLTask *task = [taskList objectAtIndex:[indexPath row]];
    cell.textLabel.text = task.name;
    
    // Adiciona imagem à célula
    if(task.isDone){
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"done.png"]];
        [cell.textLabel setTextColor:[UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1]];
    }
    else{
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"not_done.png"]];
        [cell.textLabel setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected");
    
    MTDLTask *task = [taskList objectAtIndex:[indexPath row]];
    
    task.done = !task.done;
    
    [self.taskListView reloadData];


}

@end
