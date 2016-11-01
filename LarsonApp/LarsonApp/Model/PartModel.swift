//
//  PartModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartModel: NSObject {
    var _id : String!
    var alternateNumber : String!
    var emergencyRequest : Bool!
    var inTruck : Int!
    var name : String!
    var needDeliveryService : Bool!
    var number : String!
    var partRequestId : String!
    var price : CGFloat!
    var qty : Int!
    var stock : Int!
    var userId : String!
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic["_id"] as! String
        self.alternateNumber = dic["alternateNumber"] as! String
        self.emergencyRequest = dic["emergencyRequest"] as! Bool
        self.inTruck = dic["inTruck"] as! Int
        self.name = dic["name"] as! String
        self.needDeliveryService = dic["needDeliveryService"] as! Bool
        self.number = dic["number"] as! String
        self.partRequestId = dic["partRequestId"] as! String
        self.price = dic["price"] as! CGFloat
        self.qty = dic["qty"] as! Int
        self.stock = dic["stock"] as! Int
        self.userId = dic["userId"] as! String
    }
    
}
