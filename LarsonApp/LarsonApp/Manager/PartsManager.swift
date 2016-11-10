//
//  PartsManager.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

let singlePart = PartsManager()


class PartsManager: NSObject {
    
    class var shareManager : PartsManager {
        return singlePart
    }
    
    func parseJobPartsDicToModel(dic : NSDictionary) -> NSMutableArray
    {
        let partArr = NSMutableArray()
        for item in dic.allKeys {
            let partDic = NSMutableDictionary()
            let tempdic = dic.object(forKey: item) as! NSDictionary
            let arr = NSMutableArray()
            for subItem in tempdic.allKeys
            {
                let partDic = tempdic.value(forKey: subItem as! String) as! NSDictionary
                let model = PartModel()
                model.parseDicToSelf(dic: partDic)
                arr.add(model)
            }
            partDic.setValue(arr, forKey: item as! String)
            partArr.add(partDic)
        }
        
        return partArr
    }
    
    func parsePartsDicToModel(dic : NSDictionary) -> [PartModel]
    {
        var partsArr = [PartModel]()
        let arr = dic.value(forKey: "hits") as! NSArray
        for item in arr
        {
            let dic = (item as! NSDictionary).value(forKey: "_source") as! NSDictionary
            let model = PartModel()
            model.parseDicToSelf(dic: dic)
            partsArr.append(model)
        }
        
        return partsArr
    }
}
