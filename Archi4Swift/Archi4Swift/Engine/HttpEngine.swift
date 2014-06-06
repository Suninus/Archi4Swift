//
//  HttpEngine.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-5.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

enum HttpMethod {
    case POST
    case GET
}

class HttpEngine : NSObject,NSURLConnectionDataDelegate
{

    //properties
    var request:NSMutableURLRequest!
    var connection:NSURLConnection!
    var resultData:NSMutableData!
    var completedClosure:(Bool,NSError?,AnyObject?) -> () = {(_,_,_) ->() in}
    
    //method
    init(var url:NSString) {
        self.request = NSMutableURLRequest(URL:NSURL(string:url),cachePolicy:.UseProtocolCachePolicy,timeoutInterval: 10)
    }
    
    func fly(method:HttpMethod,headerArgs:Dictionary<String,String>,bodyArgs:Dictionary<String,String>) -> HttpEngine!{
        
        //method
        switch method {
            case .POST:
                self.request!.HTTPMethod = "POST"
            case .GET:
                self.request!.HTTPMethod = "GET"
            default:
                self.request!.HTTPMethod = "POST"
        }
        
        //header
        self.request!.allHTTPHeaderFields = headerArgs
        
        //body
        var bodyStr:String = String()
        
        for (key, value) in bodyArgs {
            bodyStr += "\(key)=\(value)"
        }
        
//        println("body string --- \(bodyStr)")
        
        self.request!.HTTPBody = bodyStr.dataUsingEncoding(NSUTF8StringEncoding)
        
        self.connection = NSURLConnection(request:self.request,delegate:self,startImmediately:false)
        
        return self;
    }
    
    func completed(clsoure:(Bool,NSError?,AnyObject?) -> ()) {
        self.completedClosure = clsoure
        self.connection.start()
    }
    
    //connection delegate
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        self.resultData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        self.resultData!.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var error: NSError? = nil
        
//        println(NSString(data: resultData,encoding: NSUTF8StringEncoding))
        
        var result:AnyObject! = NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.MutableContainers, error: &error)
        
        if(error == nil) {
            completedClosure(true,nil,result)
        } else {
            completedClosure(false,error,nil)
        }
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        completedClosure(false,error,nil)
    }
}