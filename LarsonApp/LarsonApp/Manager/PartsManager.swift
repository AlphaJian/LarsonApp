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
            let strId = (item as! NSDictionary).value(forKey: "_id") as! String
            let dic = (item as! NSDictionary).value(forKey: "_source") as! NSDictionary
            let model = PartModel()
            model.parseDicToSelf(dic: dic)
            model._id = strId
            partsArr.append(model)
        }
        
        return partsArr
    }
    
    func parseSiteHistoryDicToModel(dic: NSDictionary) -> NSMutableDictionary
    {
    let modelDic = NSMutableDictionary()
        if dic.value(forKey: "location-equipment") != nil {
        
        let arr =  dic.value(forKey: "location-equipment") as! NSArray
        var equipmentArr = [SiteHistoryEquipModel]()
            for item in arr {
            let model = SiteHistoryEquipModel()
                model.parseDicToSelf(dic: item as! NSDictionary)
                equipmentArr.append(model)
                modelDic.setValue(equipmentArr, forKey: "location-equipment")
            }
        } else {
            let arr = NSArray()
            modelDic.setValue(arr, forKey: "location-equipment")
        }
        if dic.value(forKey: "location-pastNotes") != nil {
            
            let arr =  (dic.value(forKey: "location-pastNotes") as! NSDictionary).allValues
            var NoteArr = [SiteHistoryNotesModel]()
            for item in arr {
                let model = SiteHistoryNotesModel()
                model.parseDicToSelf(dic: item as! NSDictionary)
                NoteArr.append(model)
                modelDic.setValue(NoteArr, forKey: "location-pastNotes")
            }
        } else {
            let arr = NSArray()
            modelDic.setValue(arr, forKey: "location-pastNotes")
        }
        
        if dic.value(forKey: "location-sitehistories") != nil {
            
            let arr =  dic.value(forKey: "location-sitehistories") as! NSArray
            var siteHistoryArr = [SiteHistoryModel]()
            for item in arr {
                let model = SiteHistoryModel()
                model.parseDicToSelf(dic: item as! NSDictionary)
                siteHistoryArr.append(model)
                modelDic.setValue(siteHistoryArr, forKey: "location-sitehistories")
            }
        } else {
            let arr = NSArray()
            modelDic.setValue(arr, forKey: "location-sitehistories")
        }
        
        
        
        return modelDic
    }
    
}
