//
//  UserModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class UserModel: NSObject, NSCoding {


    var google_email : String?
    var google_imageURL : URL?
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        google_email = aDecoder.decodeObject(forKey: "google_email") as? String
        google_imageURL = aDecoder.decodeObject(forKey: "google_imageURL") as? URL
    }
    
    override init() {
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(google_email, forKey: "google_email")
        aCoder.encode(google_imageURL, forKey: "google_imageURL")
    }

}
