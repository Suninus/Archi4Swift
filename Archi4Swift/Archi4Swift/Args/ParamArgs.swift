//
//  ParamArgs.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-6.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class ParamArgs
{
    var url:String!
    var headers:Dictionary<String,String>!
    var bodys:Dictionary<String,String>!
    
    init() {
        self.setArgs()
    }
    
    func setArgs() {
        self.url = String()
        self.headers = Dictionary<String,String>()
        self.bodys = Dictionary<String,String>()
    }
    
}