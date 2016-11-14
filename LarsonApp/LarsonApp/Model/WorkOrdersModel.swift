//
//  WorkOrdersModel.swift
//  LarsonApp
//
//  Created by appledev110 on 10/28/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class WorkOrdersModel: NSObject {
    var _id : String!
    var callNumber : String!
    var city : String!
    var createdAt : TimeInterval!
    var currentStatus : String!
    var jobCod : Bool!
    var jobId : String!
    var lastModified : TimeInterval!
    var phoneNumber : String!
    var returnTripNeeded : Bool!
    var serviceDescription : String!
    var siteAddress : String!
    var stationNumber : String!
    var submitted : Bool!
    var techNumber : String!
    var workCompleted : Bool!
    var parts : [PartModel]!
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic.checkValueIfNil(key: "_id", oldValue: self._id)
        self.callNumber = dic.checkValueIfNil(key: "callNumber", oldValue: self.callNumber)
        self.city = dic.checkValueIfNil(key: "city", oldValue: self.city)
        self.createdAt = dic["createdAt"] as! TimeInterval
        self.currentStatus = dic.checkValueIfNil(key: "currentStatus", oldValue: self.currentStatus)
        self.jobCod = dic.checkBoolIfNil(key: "jobCod", oldValue: self.jobCod)
        self.jobId = dic.checkValueIfNil(key: "jobId", oldValue: self.jobId)
        self.lastModified = dic.checkTimeIntervalIfNil(key: "lastModified", oldValue: self.lastModified)
        self.phoneNumber = dic.checkValueIfNil(key: "phoneNumber", oldValue: self.phoneNumber)
        self.returnTripNeeded = dic.checkBoolIfNil(key: "returnTripNeeded", oldValue: self.returnTripNeeded)
        self.serviceDescription = dic.checkValueIfNil(key: "serviceDescription", oldValue: self.serviceDescription)
        self.siteAddress = dic.checkValueIfNil(key: "siteAddress", oldValue: self.siteAddress)
        self.stationNumber = dic.checkValueIfNil(key: "stationNumber", oldValue: self.stationNumber)
        self.submitted = dic.checkBoolIfNil(key: "submitted", oldValue: self.submitted)
        self.techNumber = dic.checkValueIfNil(key: "techNumber", oldValue: self.techNumber)
        self.workCompleted = dic.checkBoolIfNil(key: "workCompleted", oldValue: self.workCompleted)
        var partsArr = [PartModel]()
        for partDic in (dic.object(forKey: "parts") as! [NSDictionary]) {
            let partModel = PartModel()
            partModel.parseDicToSelf(dic: partDic)
            partsArr.append(partModel)
        }
        
    }
   
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
    
    
    
}
