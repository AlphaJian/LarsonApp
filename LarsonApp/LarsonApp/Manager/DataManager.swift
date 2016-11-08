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
    
    var ref = FIRDatabase.database().reference()
    var items: NSMutableDictionary = ["0":"Appointment List", "1":"Current Job", "2":"Parts Search", "3":"Chat Help", "4":"Log out", "didSelect": 0]
    class var shareManager : DataManager {
        return single
    }
    
    func insertUser(emial : String, accessToken : String){
        let tempRef = ref.child("engineerApp").child("user-info").childByAutoId()
        tempRef.setValue(["email":emial, "token":accessToken])
//        tempRef.updateChildValues([tempRef.childByAutoId():["email":emial, "token":accessToken]])
    }
    
    func fetchAppointList(successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock){
        ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSDictionary
            var arr = [AppointmentModel]()
            for i in 0...(dic?.allValues.count)! - 1
            {
                let tempDic = dic?.allValues[i] as? NSDictionary
                let model = AppointmentModel()
//                model.initWithDic(dic: tempDic!)
                model.parseDicToSelf(dic: tempDic!)
                arr.append(model)
            }
            successHandler(arr as AnyObject)
        }) { (error) in
            print(error.localizedDescription)
            failHandeler("Can't load appointments" as AnyObject)
        }
    }
    
    func fetchJobParts(jobId : String, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock)
    {
        ref.child("engineerApp").child("appointment-parts").child(jobId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSDictionary
            successHandler(dic!)
        }) { (error) in
            print(error.localizedDescription)
            failHandeler("Can't load parts" as AnyObject)
        }
    }
}
