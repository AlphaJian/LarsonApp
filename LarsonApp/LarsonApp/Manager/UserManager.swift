//
//  UserManager.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/14/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

let userSingle = UserManager()

class UserManager: NSObject {

    var userModel : UserModel?
    
    class var shareManager: UserManager {
        return userSingle
    }
    
    override init(){
        userModel = UserModel()
    }
    
}
