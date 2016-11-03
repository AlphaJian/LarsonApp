//
//  DataManager.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

let single = DataManager()

class DataManager: NSObject {
    
//    var ref = FIRDatabase.database().reference()
    
    var tt = 0
    class var shareManager : DataManager {
        return single
    }
    
    func fetchAppointList(successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock){
//        ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let dic = snapshot.value as? NSDictionary
//            var arr = [AppointmentModel]()
//            for i in 0...(dic?.allValues.count)! - 1
//            {
//                let tempDic = dic?.allValues[i] as? NSDictionary
//                let model = AppointmentModel()
//                model.parseDicToSelf(dic: tempDic!)
//                arr.append(model)
//            }
//            successHandler(arr as AnyObject)
//        }) { (error) in
//            print(error.localizedDescription)
//            failHandeler("Can't load appointments" as AnyObject)
//        }
    }
}
