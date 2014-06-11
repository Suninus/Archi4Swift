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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createBindView()
    }
    
    func createBindView() {
        
        var bindLB = BindableUILabel(frame:CGRectZero)
        var user = User()
        
        var binding = Binding()
    }
}