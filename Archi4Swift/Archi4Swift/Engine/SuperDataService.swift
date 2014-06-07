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
    var reqUrl:String? = nil
    var parser:Parser? = nil
    var headers:Dictionary<String,String> = Dictionary<String,String>()
    var bodys:Dictionary<String,String> = Dictionary<String,String>()
    
    init() {
        
    }
    
    //fetch
    func fetch(args:ParamArgs) -> SuperDataService! {
    
        self.reqUrl = args.url
        
        if let tempHeaders = args.headers {
            self.headers = tempHeaders
        }

        if let tempBodys = args.bodys {
            self.bodys = tempBodys
        }
        
        return self
    }
    
    func nextParse(parser:Parser) -> SuperDataService {
        
        self.parser = parser
        
        return self
    }
    
    func done(doneClosure:(Bool,NSError?,AnyObject?) -> ()) {
        
        headers += self.getCommonHeaders()
        bodys += self.getCommonBodys()
        
        var verifyResult = self.verifyParams() //verifyParams
        if verifyResult.canFly {
            
            HttpEngine(url:verifyResult.url!).fly(.GET,headerArgs: headers,bodyArgs: bodys).completed({(success:Bool,error:NSError?,result:AnyObject?) -> () in
                
                if(success) {
                    
                    var parseResult:AnyObject? = verifyResult.parser!.parseJsonData(result) //TODO::when parse error to deal
                    doneClosure(true,nil,parseResult)
                    
                } else {
                    doneClosure(false,error,nil)
                    
                }
            })
        } else {
            
            var error = NSError(domain: "parameter is error", code: -1000, userInfo:nil) //TODO::ErrorSystem
            doneClosure(false,error,nil)
            
        }
    }
    
    //util
    func getCommonHeaders() -> Dictionary<String,String> {
        return Dictionary<String,String>()
    }
    
    func getCommonBodys() -> Dictionary<String,String> {
        return Dictionary<String,String>()
    }
    
    func verifyParams() -> (canFly:Bool,url:NSString?,parser:Parser?) {
        
        if self.reqUrl != nil && self.parser != nil {
            return (true,self.reqUrl!,self.parser!)
        } else {
            return (false,nil,nil)
        }
        
    }
}


