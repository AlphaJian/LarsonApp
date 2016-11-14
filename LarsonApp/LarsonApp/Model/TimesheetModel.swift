//
//  TimesheetModel.swift
//  LarsonApp
//
//  Created by appledev110 on 10/28/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TimesheetModel: NSObject {
    var _id = ""
    var desc = ""
    var endTime = ""
    var jobSite = ""
    var payCode = ""
    var startTime = ""
    var totalTime = 0
    var transactionType = ""
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic.checkValueIfNil(key: "_id", oldValue: self._id)
        self.desc = dic.checkValueIfNil(key: "description", oldValue: self.desc)
        self.endTime = dic.checkValueIfNil(key: "endTime", oldValue: self.endTime)
        self.jobSite = dic.checkValueIfNil(key: "jobSite", oldValue: self.jobSite)
        self.payCode = dic.checkValueIfNil(key: "payCode", oldValue: self.payCode)
        self.startTime = dic.checkValueIfNil(key: "startTime", oldValue: self.startTime)
        self.totalTime = dic.checkIntIfNil(key: "totalTime", oldValue: self.totalTime)
        self.transactionType = dic.checkValueIfNil(key: "transactionType", oldValue: self.transactionType)
    }
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    func parseSelfToDic() -> NSDictionary{
        return ["_id" : _id, "description" : desc, "endTime" : endTime, "jobSite" : jobSite, "payCode" : payCode,
                "startTime" : startTime, " totalTime" : totalTime, "transactionType" : transactionType]
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
}
