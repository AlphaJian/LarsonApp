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
    var createdAt : Int!
    var currentStatus : String!
    var jobCod : Bool!
    var jobId : String!
    var lastModified : String!
    var phoneNumber : String!
    var returnTripNeeded : Bool!
    var serviceDescription : String!
    var siteAddress : String!
    var stationNumber : String!
    var submitted : Bool!
    var techNumber : String!
    var workCompleted : Bool!
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic["_id"] as! String
        self.callNumber = dic["callNumber"] as! String
        self.city = dic["city"] as! String
        self.createdAt = dic["createdAt"] as! Int
        self.currentStatus = dic["currentStatus"] as! String
        self.jobCod = dic["jobCod"] as! Bool
        self.jobId = dic["jobId"] as! String
        self.lastModified = dic["lastModified"] as! String
        self.phoneNumber = dic["phoneNumber"] as! String
        self.returnTripNeeded = dic["returnTripNeeded"] as! Bool
        self.serviceDescription = dic["serviceDescription"] as! String
        self.siteAddress = dic["siteAddress"] as! String
        self.stationNumber = dic["stationNumber"] as! String
        self.submitted = dic["submitted"] as! Bool
        self.techNumber = dic["techNumber"] as! String
        self.workCompleted = dic["workCompleted"] as! Bool
        
    }
   
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
    
    
    
}
