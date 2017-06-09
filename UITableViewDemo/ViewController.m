//
//  ViewController.m
//  UITableViewDemo
//
//  Created by didi on 2017/5/27.
//  Copyright © 2017年 didi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (strong,nonatomic) NSArray *array;
@property (strong,nonatomic) NSArray *timeZoneNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
    NSArray *timeZones = [NSTimeZone knownTimeZoneNames];
    self.timeZoneNames = [timeZones sortedArrayUsingSelector:@selector(localizedCompare:)];
    NSArray *rowList = @[@"第一行",@"第二行",@"第三行",@"第四行",@"第五行"];
    NSMutableArray *arrayValue = [[NSMutableArray alloc]init];
    NSInteger rowNumber = rowList.count;
    for (NSInteger i = 0; i< rowNumber; i++)
    {
        NSString *string = rowList[i];
        NSString *value = [NSString stringWithFormat:@"%@",string];
        [arrayValue addObject:value];
    }
    self.array = arrayValue;
    [self loadGroupData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadGroupData
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.array count];
    return self.timeZoneNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(!cell)
    {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
//    cell.textLabel.text = [self.array objectAtIndex:[indexPath row]];
    NSString *timeZoneName = self.timeZoneNames[indexPath.row];
    cell.textLabel.text = timeZoneName;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
