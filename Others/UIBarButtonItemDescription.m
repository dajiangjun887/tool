
- (void)loadNavigationItemsShadowWith:(UIBarButtonItem *)item {
    
    
    NSArray <UIColor *> *colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor brownColor],[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor],[UIColor brownColor]];
    CGRect superFrame = CGRectZero;
    NSArray *subviews = @[];
    
    if (@available(iOS 11.0, *)) {
        UIView *__viewOwner = [self.rightItem valueForKey:@"__viewOwner"]; // _UIButtonBar
        UIView *_stackView = [__viewOwner valueForKey:@"_stackView"]; // _UIButtonBarStackView
        superFrame = _stackView.frame;
        superFrame.origin.y += 100;
        subviews = [_stackView subviews];
    } else {
        UIView *view = [item valueForKey:@"_view"];
        subviews = view.superview.subviews;
        
        superFrame = view.superview.frame;
        superFrame.origin.y += 100;
    }
    
    UIView *superView = [[UIView alloc]initWithFrame:superFrame];
    superView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:superView];
    
    for (int i=0; i<subviews.count; i++) {
        UIView *buttonItemView = subviews[i];
        UIView *subview = [[UIView alloc]initWithFrame:buttonItemView.frame];
        subview.backgroundColor = colors[i];
        [superView addSubview:subview];
    }
    /*
     id __viewOwner = [self.rightItem valueForKey:@"__viewOwner"]; // _UIButtonBar
     UIView *_stackView = [__viewOwner valueForKey:@"_stackView"]; // _UIButtonBarStackView
     
     po _stackView.frame
     (origin = (x = 240, y = 0), size = (width = 127, height = 44))
     
     po _stackView.subviews[0]
     <_UIButtonBarButton: 0x7fa741717270; frame = (0 0; 58 44); layer = <CALayer: 0x60000022b800>>
     
     po _stackView.subviews[1]
     <UIView: 0x7fa741517ad0; frame = (58 22; 8 0); layer = <CALayer: 0x604000434040>>
     
     po _stackView.subviews[2]
     <_UIButtonBarButton: 0x7fa741517cc0; frame = (66 0; 61 44); layer = <CALayer: 0x604000435680>>
     
     
     id _layoutViews = [__viewOwner valueForKey:@"_layoutViews"];  // __NSArrayM
     
     po [_layoutViews objectAtIndex:0]
     <_UIButtonBarButton: 0x7fedda71a110; frame = (0 0; 58 44); layer = <CALayer: 0x600000223080>>
     
     po [_layoutViews objectAtIndex:1]
     <UIView: 0x7fedda71cb10; frame = (58 22; 8 0); layer = <CALayer: 0x600000224aa0>>
     
     po [_layoutViews objectAtIndex:2]
     <_UIButtonBarButton: 0x7fedda71dbc0; frame = (66 0; 61 44); layer = <CALayer: 0x6000002248e0>>
     
     */
    
    
}

