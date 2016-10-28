//
//  DataManager.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import FirebaseDatabase

let single = DataManager()

class DataManager: NSObject {
    
    var ref = FIRDatabase.database().reference()
    
    var tt = 0
    class var shareManager : DataManager {
        return single
    }
    
    func test(){
        ref.child("engineerApp").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            print("4")
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as! String
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
