//
//  AppointmentModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class AppointmentModel: NSObject {
    var _id = ""
    var appointmentId = ""
    var callStatus = ""
    var clientId = ""
    var complete = false
    var contactName = ""
    var contactNumber = ""
    var contactPerson = ""
    var currentFieldEngineerId = ""
    var currentStatus = ""
    var customerAddress = ""
    var customerName = ""
    var division = ""
    var jobDetail = ""
    var jobID = ""
    var jobType = ""
    var purchaseOrder = ""
    var streetViewUrl = ""
    var telephoneNumber = ""
    var legacyId = ""
    var partsReqInTruckNum = 0
    var partsReqNum = 0
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic.checkValueIfNil(key: "_id", oldValue: self._id)
        self.appointmentId = dic.checkValueIfNil(key: "appointmentId", oldValue: self.appointmentId)
        self.callStatus = dic.checkValueIfNil(key: "callStatus", oldValue: self.callStatus)
        self.clientId = dic.checkValueIfNil(key: "clientId", oldValue: self.clientId)
        self.complete = dic.checkBoolIfNil(key: "complete", oldValue: self.complete)
        self.contactName = dic.checkValueIfNil(key: "contactName", oldValue: self.contactName)
        self.contactNumber = dic.checkValueIfNil(key: "contactNumber", oldValue: self.contactNumber)
        self.contactPerson = dic.checkValueIfNil(key: "contactPerson", oldValue: self.contactPerson)
        self.currentFieldEngineerId = dic.checkValueIfNil(key: "currentFieldEngineerId", oldValue: self.currentFieldEngineerId)
        self.currentStatus = dic.checkValueIfNil(key: "currentStatus", oldValue: self.currentStatus)
        self.customerAddress = dic.checkValueIfNil(key: "customerAddress", oldValue: self.customerAddress)
        self.customerName = dic.checkValueIfNil(key: "customerName", oldValue: self.customerName)
        self.jobDetail = dic.checkValueIfNil(key: "jobDetail", oldValue: self.jobDetail)
        self.jobID = dic.checkValueIfNil(key: "jobID", oldValue: self.jobID)
        self.jobType = dic.checkValueIfNil(key: "jobType", oldValue: self.jobType)
        self.purchaseOrder = dic.checkValueIfNil(key: "purchaseOrder", oldValue: self.purchaseOrder)
        self.streetViewUrl = dic.checkValueIfNil(key: "streetViewUrl", oldValue: self.streetViewUrl)
        self.telephoneNumber = dic.checkValueIfNil(key: "telephoneNumber", oldValue: self.telephoneNumber)
        self.legacyId = dic.checkValueIfNil(key: "legacyId", oldValue: self.legacyId)
        self.partsReqInTruckNum = dic.checkIntIfNil(key: "partsReqInTruckNum", oldValue: self.partsReqInTruckNum)
        self.partsReqNum = dic.checkIntIfNil(key: "partsReqNum", oldValue: self.partsReqNum)
        self.division = dic.checkValueIfNil(key: "division", oldValue: self.division)
    }
    
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
}
