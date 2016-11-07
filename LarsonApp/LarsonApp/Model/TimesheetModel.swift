//
//  TimesheetModel.swift
//  LarsonApp
//
//  Created by appledev110 on 10/28/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TimesheetModel: NSObject {
    var _id : String!
    var desc : String!
    var endTime : String!
    var jobSite : String!
    var payCode : String!
    var startTime : String!
    var totalTime : Int!
    var transactionType : String!
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic["_id"] as! String
        self.desc = dic["desc"] as! String
        self.endTime = dic["endTime"] as! String
        self.jobSite = dic["jobSite"] as! String
        self.payCode = dic["payCode"] as! String
        self.startTime = dic["startTime"] as! String
        self.totalTime = dic["totalTime"] as! Int
        self.transactionType = dic["transactionType"] as! String
    }
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
}
