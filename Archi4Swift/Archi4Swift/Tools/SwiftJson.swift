//
//  JsonSwift.swift
//  Archi4Swift
//
//  Created by AFI on 14/6/15.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

extension String
{
    func objectFromJsonString() -> AnyObject? {
        return JsonDecoder().objectWithJsonString(self);
    }
    
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    
    subscript (r: Range<Int>) -> String {
        var start = advance(startIndex, r.startIndex)
            var end = advance(startIndex, r.endIndex)
            return substringWithRange(Range(start: start, end: end))
    }
    
    func length() -> Int {
        return countElements(self)
    }
}

enum JKTokenType : Int
{
    case JKTokenTypeInvalid     = 0
    case JKTokenTypeNumber      = 1
    case JKTokenTypeString      = 2
    case JKTokenTypeObjectBegin = 3
    case JKTokenTypeObjectEnd   = 4
    case JKTokenTypeArrayBegin  = 5
    case JKTokenTypeArrayEnd    = 6
    case JKTokenTypeSeparator   = 7
    case JKTokenTypeComma       = 8
    case JKTokenTypeTrue        = 9
    case JKTokenTypeFalse       = 10
    case JKTokenTypeNull        = 11
    case JKTokenTypeWhiteSpace  = 12
}

enum JKTokenValue : Int
{
    case JKValueTypeNone             = 0
    case JKValueTypeString           = 5
    case JKValueTypeLongLong         = 7
    case JKValueTypeUnsignedLongLong = 11
    case JKValueTypeDouble           = 13
}

struct JKParseToken {
    
    var type:JKTokenType!
    var value:JKTokenValue!
    
    init() {
        
    }
}

struct JKParseState {
    
    //    JKParseOptionFlags  parseOptionFlags;
    //    JKConstBuffer       stringBuffer;
    //    size_t              atIndex, lineNumber, lineStartIndex;
    //    size_t              prev_atIndex, prev_lineNumber, prev_lineStartIndex;
    //    JKParseToken        token;
    //    JKObjectStack       objectStack;
    //    JKTokenCache        cache;
    //    JKObjCImpCache      objCImpCache;
    //    NSError            *error;
    //    int                 errorIsPrev;
    //    BOOL                mutableCollections;
    var jsonStr:String!
    var atIndex = 0,lineNumber = 0,lineStartIndex = 0
    var prev_atIndex = 0,prev_lineNumber = 0,prev_lineStartIndex = 0
    var token:JKParseToken!
    
    
    init() {
        
    }
};


class JsonDecoder
{
    var parseState = JKParseState()
    
    init() {
        
    }
    
    func objectWithJsonString(json:String) -> AnyObject? {
        parseState.jsonStr = json
        return self.parseState(parseState)
    }
    
    //Parse
    func parseState(parseState:JKParseState) -> AnyObject? {
        
        //在解析期间状态机启到了所有的控制开关的作用
        //1.解析顶层的token
        //2.如果遇到对象类型，则解析对象(string,array)
        //3.最终返回顶层的对象结构就可以了
        
        var stopParsing = 0
        while(stopParsing == 0) {
            stopParsing = self.parseToken(parseState)
            
            switch parseState.token.type! {
            case .JKTokenTypeObjectBegin:
                println(" get the object result")
            case .JKTokenTypeArrayBegin:
                println(" get the array result")
            default:
                break
            }
        }
        
        var currentStr:String? = nil
        //        if(currentCharacter == '"') {
        //            if(JK_EXPECT_T((stopParsing = jk_parse_string(parseState)) == 0)) {
        //                jk_set_parsed_token(parseState, parseState->token.tokenPtrRange.ptr, parseState->token.tokenPtrRange.length, JKTokenTypeString, 0UL);
        //            }
        //        }
        return nil
    }
    
    func parseToken(parseState:JKParseState) -> Int {
        return 0;
    }
    
    func parseString() {
        
    }
    
    func parseDictionary() {
        
    }
    
    func parseArray() {
        
    }
    
    func parseNumber(parseState:JKParseState) {
        var startString = self.currentParseString(parseState)
        var endString = self.endParseString(parseState)
//        var atNumberString = nil
        
        
    }
    
    //Util
    func setParseToken() {
        
    }
    
    func currentParseString(parseState:JKParseState) -> String {
        return parseState.jsonStr[parseState.atIndex]
    }
    
    func endParseString(parseState:JKParseState) -> String {
        return parseState.jsonStr[(parseState.jsonStr.length() - 1)]
    }
}

