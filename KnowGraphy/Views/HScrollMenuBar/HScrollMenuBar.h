

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "HScrollView.h"
@protocol HScrollMenuBarDelegate<NSObject>
-(void)selectedItem:(ParamMenuItem*)item;
@end
@interface HScrollMenuBar : UIView
<
MenuItemDelegate
>
@property(nonatomic, weak) id<HScrollMenuBarDelegate>delegate;
@property(nonatomic, retain) NSArray<ParamMenuItem*>* items;
@property(nonatomic, retain) HScrollView* hscroll;
-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<ParamMenuItem*>*)items;
@end
