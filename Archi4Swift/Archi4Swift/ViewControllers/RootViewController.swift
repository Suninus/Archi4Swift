//
//  RootViewController.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-4.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class RootViewController : UIViewController
{
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.redColor()

        let type = UIButtonType.System
        var button:UIButton = UIButton.buttonWithType(type) as UIButton
        button.frame = CGRectMake((self.view.frame.size.width - 200) * 0.5,(self.view.frame.size.height - 200) * 0.5, 200, 200)
        button.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(button)

        
//        var wx:UIWebView = UIWebView(frame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height))
//        self.view.addSubview(wx)
//        wx.loadRequest(NSURLRequest(URL:NSURL(string:"http://www.baidu.com")))
        
        HttpEngine("http://example.json")
            .fly(.POST, ["key":"value"], ["key":"value"])
            .completed { success, error, result in
                //Your process result code.
        }

    }
    
    class func sayHello() {
        println("say hello")
    }
}