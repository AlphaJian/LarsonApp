//
//  AppointmentModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class AppointmentModel: NSObject {
    var _id : String!
    var appointmentId : String!
    var callStatus : String!
    var clientId : String!
    var complete : Bool!
    var contactName : String!
    var contactNumber : String!
    var contactPerson : String!
    var currentFieldEngineerId : String!
    var currentStatus : String!
    var customerAddress : String!
    var customerName : String!
    var division : String!
    var jobDetail : String!
    var jobID : String!
    var jobType : String!
    var purchaseOrder : String!
    var streetViewUrl : String!
    var telephoneNumber : String!
    var legacyId : String!
    var partsReqInTruckNum: Int!
    var partsReqNum: Int!
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic["_id"] as! String
        self.appointmentId = dic["appointmentId"] as! String
        self.callStatus = dic["callStatus"] as! String
        self.clientId = dic["clientId"] as! String
        self.complete = dic["complete"] as! Bool
        self.contactName = dic["contactName"] as! String
        self.contactNumber = dic["contactNumber"] as! String
        self.contactPerson = dic["contactPerson"] as! String
        self.currentFieldEngineerId = dic["currentFieldEngineerId"] as! String
        self.currentStatus = dic["currentStatus"] as! String
        self.customerAddress = dic["customerAddress"] as! String
        self.customerName = dic["customerName"] as! String
        self.jobDetail = dic["jobDetail"] as! String
        self.jobID = dic["jobID"] as! String
        self.jobType = dic["jobType"] as! String
        self.purchaseOrder = dic["purchaseOrder"] as! String
        self.streetViewUrl = dic["streetViewUrl"] as! String
        self.telephoneNumber = dic["telephoneNumber"] as! String
        self.legacyId = dic["legacyId"] as! String
        self.partsReqInTruckNum = dic["partsReqInTruckNum"] as! Int
        self.partsReqNum = dic["partsReqNum"] as! Int
    }
    
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
}
