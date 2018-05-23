//
//  UIButton+TZChangeImageTextArrangementCategory.m
//  TESt
//
//  Created by kinglian on 2018/5/15.
//  Copyright © 2018年 kinglian. All rights reserved.
//

#import "UIButton+TZChangeImageTextArrangementCategory.h"
@interface UIButton(){}

@end
@implementation UIButton (TZChangeImageTextArrangementCategory)

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setButtonImageTextOffSet:(CGFloat)offSet arrangementType:(ButtonImageArrangementType)arrangmentType{
    
    CGRect imageViewFrame =  self.imageView.frame;
    CGFloat imageViewTopInset = 0;
    CGFloat imageViewLeftInset = 0;
    CGFloat imageViewBottomInset = 0;
    CGFloat imageViewRightInset = 0;
    
    CGRect titleLabelFrame = self.titleLabel.frame;
    NSDictionary *attrs = @{NSFontAttributeName : self.titleLabel.font};
    CGSize titleLabelSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGFloat titleLabelDifference = titleLabelSize.width-titleLabelFrame.size.width;
    CGFloat titleLabelTopInset = 0;
    CGFloat titleLabelLeftInset = 0;
    CGFloat titleLabelBottomInset = 0;
    CGFloat titleLabelRightInset = 0;
    
    switch (arrangmentType) {
        case ButtonImageArrangementTypeTop:
            imageViewTopInset = -(titleLabelFrame.size.height+offSet)*0.5;
            imageViewLeftInset = (self.frame.size.width - imageViewFrame.size.width)*0.5-imageViewFrame.origin.x;
            imageViewBottomInset = -imageViewTopInset;
            imageViewRightInset = -imageViewLeftInset;
            titleLabelTopInset = -imageViewTopInset;
            titleLabelBottomInset = -titleLabelTopInset;
            titleLabelLeftInset = -(self.frame.size.width-titleLabelFrame.size.width)*0.5+(self.frame.size.width-CGRectGetMaxX(titleLabelFrame))-titleLabelDifference*0.5;
            titleLabelRightInset = -titleLabelLeftInset-titleLabelDifference;
            break;
        case ButtonImageArrangementTypeBottom:
            
            imageViewTopInset = (titleLabelFrame.size.height+offSet)*0.5;
            imageViewLeftInset = (self.frame.size.width - imageViewFrame.size.width)*0.5-imageViewFrame.origin.x;
            imageViewBottomInset = -imageViewTopInset;
            imageViewRightInset = -imageViewLeftInset;
            titleLabelTopInset = -imageViewTopInset;
            titleLabelBottomInset = -titleLabelTopInset;
            titleLabelLeftInset = -(self.frame.size.width-titleLabelFrame.size.width)*0.5+(self.frame.size.width-CGRectGetMaxX(titleLabelFrame));
            titleLabelRightInset = -titleLabelLeftInset;
            
            break;
        case ButtonImageArrangementTypeLeft:
            imageViewLeftInset = (titleLabelFrame.origin.x- CGRectGetMaxX(imageViewFrame)-offSet)*0.5;
            imageViewRightInset = -imageViewLeftInset;
            titleLabelLeftInset = -imageViewLeftInset;
            titleLabelRightInset = -titleLabelLeftInset;
            break;
        case ButtonImageArrangementTypeRight:
            imageViewLeftInset = titleLabelFrame.size.width+0.5*offSet;
            imageViewRightInset = -imageViewLeftInset;
            titleLabelLeftInset = -(imageViewFrame.size.width+0.5*offSet);
            titleLabelRightInset = -titleLabelLeftInset;
            break;
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageViewTopInset, imageViewLeftInset, imageViewBottomInset, imageViewRightInset);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleLabelTopInset,titleLabelLeftInset, titleLabelBottomInset, titleLabelRightInset);
    
}


@end
