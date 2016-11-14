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
    var cellHeight : CGFloat = kSiteHisCellHeight
    var isOpen : Bool = false
    
   
    
    
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
   
    func getCellHeight(){
        if isOpen {
            self.cellHeight = 50 + 60 * 5 + 20
        } else {
            self.cellHeight = kSiteHisCellHeight
        }
    }
    
}

class SiteHistoryNotesModel: NSObject {
    var content: String!
    var date: Int = 0
    var flag: Bool!
    var cellHeight : CGFloat = kSiteHisCellHeight
    var isOpen : Bool = false
    var contentLabelHeight : CGFloat!
    
    func parseDicToSelf(dic : NSDictionary) {
        self.content = dic["content"] as! String
        self.date = dic["date"] as! Int
        self.flag = dic["flag"] as! Bool
        let str = NSMutableAttributedString(string: content)
        str.addAttribute(NSFontAttributeName, value:UIFont.systemFont(ofSize: 13.0), range:NSRange(location:0,length: content.characters.count))
        
        self.contentLabelHeight = StringUtil.getAttributeString(str: str, width: LCDW - 80)
        
    }

    func getCellHeight(){
        
        
        if isOpen {
            self.cellHeight = 90 + contentLabelHeight
        } else {
            self.cellHeight = kSiteHisCellHeight
        }
    }
}


class SiteHistoryEquipModel: NSObject {
    var clientId: String!
    var installDate: String!
    var manufacturerID: String!
    var name: String!
    var warranty: String!
    var wennsoftModelNumber: String!
    var wennsoftSerialNumber: String!
    var cellHeight : CGFloat = kSiteHisCellHeight
    var isOpen : Bool = false
    
    
    func parseDicToSelf(dic : NSDictionary) {
        self.clientId = dic["clientId"] as! String
        self.installDate = dic["installDate"] as! String
        self.manufacturerID = dic["manufacturerID"] as! String
        self.name = dic["name"] as! String
        self.warranty = dic["warranty"] as! String
        self.wennsoftModelNumber = dic["wennsoftModelNumber"] as! String
        self.wennsoftSerialNumber = dic["wennsoftSerialNumber"] as! String
    }
    
    func getCellHeight(){
        if isOpen {
            self.cellHeight = 50 + 60 * 5 + 20
        } else {
            self.cellHeight = kSiteHisCellHeight
        }
    }

    
}

