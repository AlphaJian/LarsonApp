//
//  InvoicesModel.swift
//  LarsonApp
//
//  Created by appledev110 on 10/28/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class InvoicesModel: NSObject {
    var amountDue : Float!
    var amountEquipment : Int!
    var amountLabor : Int!
    var amountMaterial : Float!
    var amountOther : Int!
    var amountSubContractor : Float!
    var amountTax : Float!
    var clientSignatureName : String!
    var createdAt : Int!
    var customerName : String!
    var invoiceUrl : String!
    var isSubmitted : Bool!
    var lastModified : Int!
    var signatureUrl : String!
    
    
    func parseDicToSelf(dic : NSDictionary) {
        self.amountDue = dic["amountDue"] as! Float
        self.amountEquipment = dic["amountEquipment"] as! Int
        self.amountLabor = dic["amountLabor"] as! Int
        self.amountMaterial = dic["amountMaterial"] as! Float
        self.amountOther = dic["amountOther"] as! Int
        self.amountSubContractor = dic["amountSubContractor"] as! Float
        self.amountTax = dic["amountTax"] as! Float
        self.clientSignatureName = dic["clientSignatureName"] as! String
        self.createdAt = dic["createdAt"] as! Int
        self.customerName = dic["customerName"] as! String
        self.invoiceUrl = dic["invoiceUrl"] as! String
        self.isSubmitted = dic["isSubmitted"] as! Bool
        self.lastModified = dic["lastModified"] as! Int
        self.signatureUrl = dic["signatureUrl"] as! String
     }
    
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
}
