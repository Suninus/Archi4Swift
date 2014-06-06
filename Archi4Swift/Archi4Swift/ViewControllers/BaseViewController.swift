//
//  BaseViewController.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-5.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController
{
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName:nibNameOrNil,bundle:nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
}