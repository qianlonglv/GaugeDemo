//
//  UIView+ViewExtention.m
//  demo
//
//  Created by lvyanlong on 16/4/29.
//  Copyright © 2016年 lvyanlong. All rights reserved.
//

#import "UIView+ViewExtention.h"

@implementation UIView (ViewExtention)

- (CGFloat)left{
    return self.frame.origin.x;
}

- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)top{
    return self.frame.origin.y;
}

- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

@end
