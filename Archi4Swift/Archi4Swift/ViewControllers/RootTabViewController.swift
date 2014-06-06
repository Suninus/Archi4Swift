//
//  RootTabViewController.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-5.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

let TABBARHEIGHT:CGFloat = 44.0

class RootTabViewController : UITabBarController
{
    var _tabNames:Array<String> = ["首页","收藏","推荐","更多"]
    var _tabBGView:UIView!
    var _tabViewControllers = Array<UIViewController>()
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
        self.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        self.createTabs()
        self.createTabViewContrller()
    }
    
    func createTabs () {
        
        _tabBGView = UIView(frame:CGRectMake(0,self.view.frame.size.height - TABBARHEIGHT,self.view.frame.size.width,TABBARHEIGHT));
        _tabBGView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(_tabBGView)
        
        for (i,v) in enumerate(_tabNames) {
            var btn:UIButton! = UIButton.buttonWithType(UIButtonType.System) as UIButton
            btn.tag = i
            var width:CGFloat = _tabBGView.frame.size.width / CGFloat(_tabNames.count)
            var height:CGFloat = TABBARHEIGHT
            var x:CGFloat = CGFloat(i) * width
            var y:CGFloat = CGFloat(0)
            btn.frame = CGRectMake(x,y,width,height)
            btn.setTitle(v, forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            btn.addTarget(self, action: Selector("tabClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
            _tabBGView.addSubview(btn)
        }
    }
    
    func createTabViewContrller() {
        
        var homeVC = HomeViewController(nibName:nil,bundle:nil)
        var homeNav = BaseNavController(rootViewController:homeVC)
        
        var favVC = FavViewController(nibName:nil,bundle:nil)
        var favNav = BaseNavController(rootViewController:favVC)
        
        var suggVC = SuggViewController(nibName:nil,bundle:nil)
        var suggNav = BaseNavController(rootViewController:suggVC)
        
        var moreVC = MoreViewController(nibName:nil,bundle:nil)
        var moreNav = BaseNavController(rootViewController:moreVC)
        
        _tabViewControllers += [homeNav,favNav,suggNav,moreNav]
        
        self.viewControllers = _tabViewControllers
    }
    
    func tabClicked(button:UIButton) {
        var index:Int = button.tag
        self.selectedViewController = _tabViewControllers[index]
    }
    
}

