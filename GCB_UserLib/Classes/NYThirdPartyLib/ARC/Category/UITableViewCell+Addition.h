//
//  UITableViewCell+Addition.h
//  TXZS_Communication
//
//  Created by 夜风 on 14-4-25.
//  Copyright (c) 2014年 FN company. All rights reserved.
//

@interface UITableViewCell (Addition)

+ (id)dequeOrCreateInTable:(UITableView*)tableView;
+ (id)dequeOrCreateInTable:(UITableView*)tableView ofType: (Class)tp fromNib: (NSString*)nibName withId: (NSString*)reuseId;

+ (id)loadCellOfType: (Class)tp fromNib: (NSString*)nibName withId: (NSString*)reuseId;
+ (id)loadFromNib;
+ (id)loadFromNibWithReuseFlag: (BOOL)toBeReused;

+ (id)dequeOrCreateInTable:(UITableView*)tableView withId: (NSString*)reuseId andStyle:(UITableViewCellStyle)style;

- (void)setSelectedBackgroundViewColor:(UIColor *)color;

@end