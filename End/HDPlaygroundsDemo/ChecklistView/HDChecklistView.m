//
//  HDChecklistView.m
//  HDPlaygroundsDemoEnd
//
//  Created by 邓立兵 on 2023/8/12.
//

#import "HDChecklistView.h"

#import "HDPlaygroundsDemoEnd-Swift.h"

@interface HDChecklistView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *birds;

@end

@implementation HDChecklistView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        self.backgroundColor = [UIColor orangeColor];
        
        _birds = [[ChecklistView birdsToShow] mutableCopy];
    }
    return self;
}

- (void)addBird:(Bird *)bird {
    [_birds addObject:bird];
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _birds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    Bird *bird = _birds[indexPath.row];
    cell.textLabel.text = bird.commonName;
    cell.imageView.image = bird.photo;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MapViewController *mapController = [[MapViewController alloc] init];
    [self.viewController.navigationController pushViewController:mapController animated:YES];
}

@end
