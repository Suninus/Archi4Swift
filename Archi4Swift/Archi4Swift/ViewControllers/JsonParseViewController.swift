//
//  JsonParseViewController.swift
//  Archi4Swift
//
//  Created by AFI on 14/6/15.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class JsonParseViewController : BaseViewController
{
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName:nil,bundle:nil)
    }
    
    convenience init() {
        self.init(nibName:nil,bundle:nil)
    }
    
    override func viewDidLoad()  {
        
        self.parseArray()
        self.parseDictionary()
        self.parseComplex()
    }
    
    func parseArray() {
        
    }
    
    func parseDictionary() {
        
        var json = "{\"name\": \"sunyanfei\"}"
        
        var jsonObj : AnyObject? = json.objectFromJsonString()
        
        println(" parse result json obj \(jsonObj)")
    }
    
    func parseComplex() {
        
    }
}