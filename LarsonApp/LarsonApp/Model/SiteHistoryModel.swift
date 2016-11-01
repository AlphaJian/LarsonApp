//
//  SiteHistoryModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class SiteHistoryModel: NSObject {
    var _id : String!
    var dateOfServiceCall : String!
    var locationId : String!
    var serviceCallNumber : String!
    var serviceDescription : String!
    var statusOfCall : String!
    var technician : String!
    var typeOfCall : String!
    var typeOfProblem : String!
    
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic["_id"] as! String
        self.dateOfServiceCall = dic["dateOfServiceCall"] as! String
        self.locationId = dic["locationId"] as! String
        self.serviceCallNumber = dic["serviceCallNumber"] as! String
        self.serviceDescription = dic["serviceDescription"] as! String
        self.statusOfCall = dic["statusOfCall"] as! String
        self.technician = dic["technician"] as! String
        self.typeOfCall = dic["typeOfCall"] as! String
        self.typeOfProblem = dic["typeOfProblem"] as! String
    }
}
