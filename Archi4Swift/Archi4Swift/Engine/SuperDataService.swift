//
//  SuperDataService.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-6.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

@assignment func +=<K, V> (inout left: Dictionary<K, V>, right: Dictionary<K, V>) -> Dictionary<K, V> {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
    return left
}

class SuperDataService
{
    var reqUrl:String!
    var headers:Dictionary<String,String> = Dictionary<String,String>()
    var bodys:Dictionary<String,String> = Dictionary<String,String>()
    var parser:Parser!
    
    init() {
        
    }
    
    //fetch
    func fetch(args:ParamArgs) -> SuperDataService! {
    
        reqUrl = args.url
        self.headers = args.headers
        self.bodys = args.bodys

        return self
    }
    
    func nextParse(parser:Parser) -> SuperDataService {
        
        self.parser = parser
        
        return self
    }
    
    func done(doneClosure:(Bool,NSError?,AnyObject?) -> ()) {
        
        headers += self.getCommonHeaders()
        bodys += self.getCommonBodys()
        
        HttpEngine(url:reqUrl).fly(.GET,headerArgs: headers,bodyArgs: bodys).completed({(success:Bool,error:NSError?,result:AnyObject?) -> () in
            if(success) {
                var parseResult:AnyObject? = self.parser.parseJsonData(result) //这个地方需要处理解析错误的情况
                doneClosure(true,nil,parseResult)
                
            } else {
                doneClosure(false,error,nil)
            }
        })
    }
    
    //util
    func getCommonHeaders() -> Dictionary<String,String> {
        return Dictionary<String,String>()
    }
    
    func getCommonBodys() -> Dictionary<String,String> {
        return Dictionary<String,String>()
    }
}


