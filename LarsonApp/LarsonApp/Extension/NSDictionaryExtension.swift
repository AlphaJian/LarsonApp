////
////  NSDictionaryExtension.swift
////  BusinessOS
////
////  Created by Jian Zhang on 11/10/15.
////  Copyright © 2015 PwC. All rights reserved.
////
//
import Foundation
import UIKit
extension NSDictionary {

    func checkValueIfNil(key: String, oldValue : String) -> String {
        if self.object(forKey: key) == nil
        {
            return oldValue
        }
        var value: AnyObject?
        
        value = self.value(forKey: key) as AnyObject?
        
        if (value == nil){
            return ""
        }
        return value as! String
    }
    
    func checkBoolIfNil(key: String, oldValue : Bool) -> Bool {
        if self.object(forKey: key) == nil
        {
            return oldValue
        }
        var value: AnyObject?
        
        value = self.value(forKey: key) as AnyObject?
        
        if (value == nil){
            return false
        }
        return value as! Bool
    }
    
    func checkFloatIfNil(key: String, oldValue : CGFloat) -> CGFloat {
        if self.object(forKey: key) == nil
        {
            return oldValue
        }
        var value: AnyObject?
        
        value = self.value(forKey: key) as AnyObject?
        
        if (value == nil){
            return 0
        }
        return value as! CGFloat
    }
    
    func checkIntIfNil(key: String, oldValue : Int) -> Int {
        if self.object(forKey: key) == nil
        {
            return oldValue
        }
        var value: AnyObject?
        
        value = self.value(forKey: key) as AnyObject?
        
        if (value == nil){
            return 0
        }
        return value as! Int
    }

    func checkTimeIntervalIfNil(key: String, oldValue : TimeInterval) -> TimeInterval {
        if self.object(forKey: key) == nil
        {
            return oldValue
        }
        var value: AnyObject?
        
        value = self.value(forKey: key) as AnyObject?
        
        if (value == nil){
            return 0
        }
        return value as! TimeInterval
    }
}
