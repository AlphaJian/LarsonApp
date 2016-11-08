//
//  PartModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartModel: NSObject {
    var _id = ""
    var alternateNumber = ""
    var emergencyRequest = false
    var inTruck = 0
    var name = ""
    var needDeliveryService = false
    var number = ""
    var partRequestId = ""
    var price : CGFloat = 0.0
    var qty = 0
    var stock = 0
    var userId = ""
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic.checkValueIfNil(key: "_id", oldValue: self._id)
        self.alternateNumber = dic.checkValueIfNil(key: "alternateNumber", oldValue: self.alternateNumber)
        self.emergencyRequest = dic.checkBoolIfNil(key: "emergencyRequest", oldValue: self.emergencyRequest)
        self.inTruck = dic.checkIntIfNil(key: "inTruck", oldValue: self.inTruck)
        self.name = dic.checkValueIfNil(key: "name", oldValue: self.name)
        self.needDeliveryService = dic.checkBoolIfNil(key: "needDeliveryService", oldValue: self.needDeliveryService)
        self.number = dic.checkValueIfNil(key: "number", oldValue: self.number)
        self.partRequestId = dic.checkValueIfNil(key: "partRequestId", oldValue: self.partRequestId)
        self.price = dic.checkFloatIfNil(key: "price", oldValue: self.price)
        self.qty = dic.checkIntIfNil(key: "qty", oldValue: self.qty)
        self.stock = dic.checkIntIfNil(key: "stock", oldValue: self.stock)
        self.userId = dic.checkValueIfNil(key: "userId", oldValue: self.userId)
    }
    
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
    
}
