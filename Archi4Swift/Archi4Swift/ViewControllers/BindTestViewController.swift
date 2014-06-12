//
//  BindTestViewController.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class BindTestViewController : UIViewController
{
    var user:User!

    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName:nil,bundle:nil)
    }
    
    convenience init() {
        self.init(nibName:nil,bundle:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createBindView()
    }
    
    func createBindView() {
    
        var userLB = UILabel(frame:CGRectMake(60,100,200,100))
        userLB.backgroundColor = UIColor.greenColor()
        self.view.addSubview(userLB)
        
        var userBindLB = BindableUILabel(view:userLB)
        user = User()
        
        var binding = Binding()
        binding.bind(userBindLB, ViewProperty("text"), user, ModelProperty("name"))
        
        var btn : UIButton = UIButton.buttonWithType(.System) as UIButton
        btn.frame = CGRectMake(60,userLB.frame.origin.y + userLB.frame.size.height + 10,200,100)
        btn.setTitle("Binding", forState: .Normal)
        btn.addTarget(self, action: Selector("btnClick"), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func btnClick() {
        println("bnt click ----")
        
        user.name = "sunyanfei"
    }
}