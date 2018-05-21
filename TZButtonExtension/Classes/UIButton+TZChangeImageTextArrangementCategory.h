//
//  UIButton+TZChangeImageTextArrangementCategory.h
//  TESt
//
//  Created by kinglian on 2018/5/15.
//  Copyright © 2018年 kinglian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ButtonImageArrangementType) {
    ButtonImageArrangementTypeLeft,//图片在左
    ButtonImageArrangementTypeRight,//图片在右
    ButtonImageArrangementTypeTop,//图片在上
    ButtonImageArrangementTypeBottom//图片在下
};
@interface UIButton (TZChangeImageTextArrangementCategory)

/**
 使用该方法，对按钮的图片一级title重新进行布局

 @param offSet 图片与title之间的间距
 @param arrangmentType 图片位置
 */
- (void)setButtonImageTextOffSet:(CGFloat)offSet arrangementType:(ButtonImageArrangementType)arrangmentType;
@end
