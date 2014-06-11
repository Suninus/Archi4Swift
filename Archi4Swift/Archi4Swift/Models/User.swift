//
//  User.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class User : ModelPropertyNotifyer
{
    var name:String! {
        willSet {
            self.onPropertyChanged(ModelProperty("name"))
        }
        didSet {
            
        }
    }
    
    init() {
        
    }
    
}