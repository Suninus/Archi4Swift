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
        
    }
    didSet {
        println("set name ----")
        self.onPropertyChanged(ModelProperty("name"))
    }
    }
    
    init() {
        
    }
    
    override func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        switch propertyName {
        case "name" :
            self.name = value as String
        default:
            break;
        }
    }
}