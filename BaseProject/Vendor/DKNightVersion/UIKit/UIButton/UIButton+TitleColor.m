//
//  UIButton+TitleColor.m
//  UIButton+TitleColor
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIButton+TitleColor.h"
#import "DKNightVersionManager.h"
#import "objc/runtime.h"

@interface UIButton ()

@property (nonatomic, strong) UIColor *normalTitleColorN;
@property (nonatomic, strong) UIColor *normalTitleColorH;
@property (nonatomic, strong) UIColor *normalTitleColorS;
@property (nonatomic, strong) UIColor *normalTitleColorD;

@property (nonatomic, strong) UIImage *normalImageN;
@property (nonatomic, strong) UIImage *normalImageH;
@property (nonatomic, strong) UIImage *normalImageS;
@property (nonatomic, strong) UIImage *normalImageD;

@property (nonatomic, strong) UIImage *normalBackImageN;
@property (nonatomic, strong) UIImage *normalBackImageH;
@property (nonatomic, strong) UIImage *normalBackImageS;
@property (nonatomic, strong) UIImage *normalBackImageD;

@end

@implementation UIButton (TitleColor)

+ (void)load {
    static dispatch_once_t onceToken;                                              
    dispatch_once(&onceToken, ^{                                                   
        Class class = [self class];                                                
        SEL originalSelector = @selector(setTitleColor:forState:);                                  
        SEL swizzledSelector = @selector(hook_setTitleColor:forState:);                                 
        Method originalMethod = class_getInstanceMethod(class, originalSelector);  
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);  
        BOOL didAddMethod =                                                        
        class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));                   
        if (didAddMethod){
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));           
        } else {                                                                   
            method_exchangeImplementations(originalMethod, swizzledMethod);        
        }
        {
            SEL originalSelector = @selector(setImage:forState:);
            SEL swizzledSelector = @selector(hook_setImage:forState:);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod =
            class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod){
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
        {
            SEL originalSelector = @selector(setBackgroundImage:forState:);
            SEL swizzledSelector = @selector(hook_setBackgroundImage:forState:);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod =
            class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod){
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
        {
            SEL originalSelector = @selector(awakeFromNib);
            SEL swizzledSelector = @selector(hook_awakeFromNib);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod =
            class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod){
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    });
    [DKNightVersionManager addClassToSet:self.class];
}

- (void)hook_awakeFromNib
{
    self.normalTitleColorN = [self titleColorForState:UIControlStateNormal];
    self.normalTitleColorH = [self titleColorForState:UIControlStateHighlighted];
    self.normalTitleColorS = [self titleColorForState:UIControlStateSelected];
    self.normalTitleColorD = [self titleColorForState:UIControlStateDisabled];
    self.normalImageN = [self imageForState:UIControlStateNormal];
    self.normalImageH = [self imageForState:UIControlStateHighlighted];
    self.normalImageS = [self imageForState:UIControlStateSelected];
    self.normalImageD = [self imageForState:UIControlStateDisabled];
    self.normalBackImageN = [self backgroundImageForState:UIControlStateNormal];
    self.normalBackImageH = [self backgroundImageForState:UIControlStateHighlighted];
    self.normalBackImageS = [self backgroundImageForState:UIControlStateSelected];
    self.normalBackImageD = [self backgroundImageForState:UIControlStateDisabled];
    [self hook_awakeFromNib];
}

- (void)hook_setTitleColor:(UIColor*)titleColor forState:(UIControlState)state {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) {
        switch (state) {
            case UIControlStateNormal: {
                [self setNormalTitleColorN:titleColor];
                break;
            }
            case UIControlStateHighlighted: {
                [self setNormalTitleColorH:titleColor];
               break;
            }
            case UIControlStateDisabled: {
                [self setNormalTitleColorD:titleColor];
                break;
            }
            case UIControlStateSelected: {
                [self setNormalTitleColorS:titleColor];
                break;
            }
            default: {
                break;
            }
    }
    }
    [self hook_setTitleColor:titleColor forState:state];
}

- (void)hook_setImage:(UIImage *)image forState:(UIControlState)state {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) {
        switch (state) {
            case UIControlStateNormal: {
                [self setNormalImageN:image];
                break;
            }
            case UIControlStateHighlighted: {
                [self setNormalImageH:image];
                break;
            }
            case UIControlStateDisabled: {
                [self setNormalImageD:image];
                break;
            }
            case UIControlStateSelected: {
                [self setNormalImageS:image];
                break;
            }
            default: {
                break;
            }
        }
    }
    [self hook_setImage:image forState:state];
}

- (void)hook_setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) {
        switch (state) {
            case UIControlStateNormal: {
                [self setNormalBackImageN:image];
                break;
            }
            case UIControlStateHighlighted: {
                [self setNormalBackImageH:image];
                break;
            }
            case UIControlStateDisabled: {
                [self setNormalBackImageD:image];
                break;
            }
            case UIControlStateSelected: {
                [self setNormalBackImageS:image];
                break;
            }
            default: {
                break;
            }
        }
    }
    [self hook_setBackgroundImage:image forState:state];
}

- (UIColor *)nightTColorN {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTColorN));
    if (nightColor) {
        return nightColor;
    } else {
        UIColor *resultColor = [self.nightJoin boolValue] ? buttonTitleColorN : [self titleColorForState:UIControlStateNormal];
        return resultColor;
    }
}

- (void)setNightTColorN:(UIColor *)nightTColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) [self setTitleColor:nightTColor forState:UIControlStateNormal];
    objc_setAssociatedObject(self, @selector(nightTColorN), nightTColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nightTColorH {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTColorH));
    if (nightColor) {
        return nightColor;
    } else {
        UIColor *resultColor = [self.nightJoin boolValue] ? buttonTitleColorH : [self titleColorForState:UIControlStateHighlighted];
        return resultColor;
    }
}

- (void)setNightTColorH:(UIColor *)nightTColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) [self setTitleColor:nightTColor forState:UIControlStateHighlighted];
    objc_setAssociatedObject(self, @selector(nightTColorH), nightTColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nightTColorS {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTColorS));
    if (nightColor) {
        return nightColor;
    } else {
        UIColor *resultColor = [self.nightJoin boolValue] ? buttonTitleColorS : [self titleColorForState:UIControlStateSelected];
        return resultColor;
    }
}

- (void)setNightTColorS:(UIColor *)nightTColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) [self setTitleColor:nightTColor forState:UIControlStateSelected];
    objc_setAssociatedObject(self, @selector(nightTColorS), nightTColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nightTColorD {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTColorD));
    if (nightColor) {
        return nightColor;
    } else {
        UIColor *resultColor = [self.nightJoin boolValue] ? buttonTitleColorD : [self titleColorForState:UIControlStateDisabled];
        return resultColor;
    }
}

- (void)setNightTColorD:(UIColor *)nightTColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) [self setTitleColor:nightTColor forState:UIControlStateDisabled];
    objc_setAssociatedObject(self, @selector(nightTColorD), nightTColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTitleColorN {
    return objc_getAssociatedObject(self, @selector(normalTitleColorN));
}

- (void)setNormalTitleColorN:(UIColor *)normalTitleColorN {
    objc_setAssociatedObject(self, @selector(normalTitleColorN), normalTitleColorN, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTitleColorH {
    return objc_getAssociatedObject(self, @selector(normalTitleColorH));
}

- (void)setNormalTitleColorH:(UIColor *)normalTitleColorH {
    objc_setAssociatedObject(self, @selector(normalTitleColorH), normalTitleColorH, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTitleColorS {
    return objc_getAssociatedObject(self, @selector(normalTitleColorS));
}

- (void)setNormalTitleColorS:(UIColor *)normalTitleColorS {
    objc_setAssociatedObject(self, @selector(normalTitleColorS), normalTitleColorS, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTitleColorD {
    return objc_getAssociatedObject(self, @selector(normalTitleColorD));
}

- (void)setNormalTitleColorD:(UIColor *)normalTitleColorD {
    objc_setAssociatedObject(self, @selector(normalTitleColorD), normalTitleColorD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightImageN {
    return objc_getAssociatedObject(self, @selector(nightImageN));
}

- (void)setNightImageN:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightImageN), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightImageH {
    return objc_getAssociatedObject(self, @selector(nightImageH));
}

- (void)setNightImageH:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightImageH), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightImageS {
    return objc_getAssociatedObject(self, @selector(nightImageS));
}

- (void)setNightImageS:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightImageS), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightImageD {
    return objc_getAssociatedObject(self, @selector(nightImageD));
}

- (void)setNightImageD:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightImageD), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightBackImageN {
    return objc_getAssociatedObject(self, @selector(nightBackImageN));
}

- (void)setNightBackImageN:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightBackImageN), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightBackImageH {
    return objc_getAssociatedObject(self, @selector(nightBackImageH));
}

- (void)setNightBackImageH:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightBackImageH), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightBackImageS {
    return objc_getAssociatedObject(self, @selector(nightBackImageS));
}

- (void)setNightBackImageS:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightBackImageS), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nightBackImageD {
    return objc_getAssociatedObject(self, @selector(nightBackImageD));
}

- (void)setNightBackImageD:(UIImage *)nightImage {
    objc_setAssociatedObject(self, @selector(nightBackImageD), nightImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalImageN {
    return objc_getAssociatedObject(self, @selector(normalImageN));
}

- (void)setNormalImageN:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalImageN), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalImageH {
    return objc_getAssociatedObject(self, @selector(normalImageH));
}

- (void)setNormalImageH:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalImageH), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalImageS {
    return objc_getAssociatedObject(self, @selector(normalImageS));
}

- (void)setNormalImageS:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalImageS), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalImageD {
    return objc_getAssociatedObject(self, @selector(normalImageD));
}

- (void)setNormalImageD:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalImageD), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalBackImageN {
    return objc_getAssociatedObject(self, @selector(normalBackImageN));
}

- (void)setNormalBackImageN:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalBackImageN), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalBackImageH {
    return objc_getAssociatedObject(self, @selector(normalBackImageH));
}

- (void)setNormalBackImageH:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalBackImageH), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalBackImageS {
    return objc_getAssociatedObject(self, @selector(normalBackImageS));
}

- (void)setNormalBackImageS:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalBackImageS), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalBackImageD {
    return objc_getAssociatedObject(self, @selector(normalBackImageD));
}

- (void)setNormalBackImageD:(UIImage *)normalImage {
    objc_setAssociatedObject(self, @selector(normalBackImageD), normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
