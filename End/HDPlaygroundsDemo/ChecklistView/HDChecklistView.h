//
//  HDChecklistView.h
//  HDPlaygroundsDemoEnd
//
//  Created by 邓立兵 on 2023/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Bird;

@interface HDChecklistView : UITableView

@property (nonatomic, weak) UIViewController *viewController;

- (void)addBird:(Bird *)bird;

@end

NS_ASSUME_NONNULL_END
