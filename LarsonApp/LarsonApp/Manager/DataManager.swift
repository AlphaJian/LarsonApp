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
    
    func fetchAppointList(){
        ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSDictionary
            let arr = [AppointmentModel]()
            for i in 0...(dic?.allValues.count)! - 1
            {
                let tempDic = dic?.allValues[i] as? NSDictionary
                let model = AppointmentModel()
                
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
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
