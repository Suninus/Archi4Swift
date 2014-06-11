//
//  Binding.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class Binding
{
    func bind(vpn:UIView,vp:Any,mpn:ModelPropertyNotifyer,mp:ModelProperty) {
        
        mpn.propertyChanged = { notifyer,property in
            var name = property.propertyName
            
            var index = 0
            
            for var i=0; i < reflect(notifyer).count; ++i {
                
                var str = reflect(notifyer)[i].0 + "----" + reflect(notifyer)[i].1.summary
                
                if (name == reflect(notifyer)[i].0) {
                    index = i
                    break
                }
            }
            var propertyValue = reflect(notifyer)[index].1.summary
        }
    }
    
}