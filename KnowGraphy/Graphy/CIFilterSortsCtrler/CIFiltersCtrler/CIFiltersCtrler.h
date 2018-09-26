
#import "NavigationCtrler.h"
#import "CIFiltersView.h"
typedef NS_ENUM(NSInteger, eEmbedFilterMenu)
{
    eEmbedFilterMenu_def = 0,
    eEmbedFilterMenu_sigleplay,
    eEmbedFilterMenu_listplay
};
@interface CIFiltersCtrler : NavigationCtrler
<
HScrollMenuBarDelegate,
CIFiltersViewDelegate
>
@property(nonatomic, retain) ParamCIFilterSort* sort;
@property(nonatomic, retain) HScrollMenuBar* menubar;
@property(nonatomic, retain) CIFiltersView* filters;
@property(nonatomic, retain) UILabel* message;

@end
