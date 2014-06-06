//
//  HomeDetailViewController.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-6.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class HomeDetailViewController : BaseViewController
{
    var wInfo:WeatherInfo!
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName:nil,bundle:nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = wInfo.city
        
        
    }
}