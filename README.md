# DMPopupAlert
Simple popup alert view

## Installation

1. Simple drag and drop DMPopupAlert folder in you project
2. Add header file 

```objectiv-c
#import "DMPopupAlert.h"
```

## Architecture

- `DMPopupItem`
- `DMPopupAlert`

## Usage

### First example

For showing alert view into you UIViewController just do this:

```objectiv-c
  // create message item
  DMPopupItem *item = [[DMPopupItem alloc] init];
  item.title = @"Title";
  item.body = @"More sofisticated message about error";
  item.type = DMPopupTypeError;
  item.duration = 10.0;
  
  // show in current controller
  [DMPopupAlert show:item inView:self.view];
```

### Customization

For customization add in your AppDelegate file this:

```objectiv-c
  [DMPopupAlert setColor:[UIColor colorWithRed:240.0/255.0 green:91.0/255.0 blue:93.0/255.0 alpha:1.0] forParam:DMPopupCell_BackgroundColor forType:DMPopupTypeError];
  [DMPopupAlert setColor:[UIColor colorWithRed:245.0/255.0 green:220.0/255.0 blue:6.0/255.0 alpha:1.0] forParam:DMPopupCell_BackgroundColor forType:DMPopupTypeWarning];
  [DMPopupAlert setColor:[UIColor colorWithRed:187.0/255.0 green:221.0/255.0 blue:82.0/255.0 alpha:1.0] forParam:DMPopupCell_BackgroundColor forType:DMPopupTypeSuccess];
    
  [DMPopupAlert setFont:titleFont forParam:DMPopupCell_TitleFont];
  [DMPopupAlert setColor:[UIColor whiteColor] forParam:DMPopupCell_TitleColor];

  [DMPopupAlert setFont:bodyFont forParam:DMPopupCell_BodyFont];
  [DMPopupAlert setColor:[UIColor whiteColor] forParam:DMPopupCell_BodyColor];
```

### Custom table height

You can change cell height by adding calculating block in DMPopupAlert

```objectiv-c
    [DMPopupAlert setCalculateHeightBlock:^float(float cellWidth, DMPopupItem *item) {
        CGFloat avaliableWidth = cellWidth - 56.0 - 40.0;
        CGSize maxSize = CGSizeMake(avaliableWidth, CGFLOAT_MAX);
        CGSize titleSize = CGSizeZero, bodySize = CGSizeZero;
        
        if (item.title) {
            titleSize = [item.title textSizeWithFont:titleFont size:maxSize options:NSStringDrawingUsesLineFragmentOrigin];
        }
        if (item.body) {
            bodySize = [item.body textSizeWithFont:bodyFont size:maxSize options:NSStringDrawingUsesLineFragmentOrigin];
        }
        
        CGFloat h = 6.0 + titleSize.height + 5.0 + bodySize.height + 6.0;
        if (h < 50.0) h = 50.0;
        
        return h;
    }];
```


