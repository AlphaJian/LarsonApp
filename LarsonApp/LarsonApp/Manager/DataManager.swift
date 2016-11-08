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
//        ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let dic = snapshot.value as? NSDictionary
//            var arr = [AppointmentModel]()
//            for i in 0...(dic?.allValues.count)! - 1
//            {
//                let tempDic = dic?.allValues[i] as? NSDictionary
//                let model = AppointmentModel()
//                //                model.initWithDic(dic: tempDic!)
//                model.parseDicToSelf(dic: tempDic!)
//                arr.append(model)
//            }
//            successHandler(arr as AnyObject)
//        }) { (error) in
//            print(error.localizedDescription)
//            failHandeler("Can't load appointments" as AnyObject)
//        }
        
//        let data = ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").queryOrdered(byChild: "currentStatus")
//        print("data => \(data)")
        var appointmentLists = [AppointmentModel]()
        let firebaseQuery = ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").queryOrdered(byChild: "currentStatus")
        
        
        let group = DispatchGroup()
        let backgroundQueue = DispatchQueue(label: "com.app.queue",
                                            qos: .background,
                                            target: nil)
        var arrNew = [AppointmentModel]()
        var arrProgress = [AppointmentModel]()
        var arrCompleted = [AppointmentModel]()
    
        
        backgroundQueue.async(group: group) { _ in
            group.enter()
            firebaseQuery.queryEqual(toValue: "NEW").observeSingleEvent(of: .value, with: { (snapshot) in
                let dic = snapshot.value as? NSDictionary
                
                for i in 0...(dic?.allValues.count)! - 1
                {
                    let tempDic = dic?.allValues[i] as? NSDictionary
                    let model = AppointmentModel()
                    //                model.initWithDic(dic: tempDic!)
                    model.parseDicToSelf(dic: tempDic!)
                    arrNew.append(model)
                }
                group.leave()
            }, withCancel: { (error) in
                print(error.localizedDescription)
                group.leave()
            })
        }
        backgroundQueue.async(group: group) { _ in
            group.enter()
            firebaseQuery.queryEqual(toValue: "IN PROGRESS").observeSingleEvent(of: .value, with: { (snapshot) in
                let dic = snapshot.value as? NSDictionary
                
                for i in 0...(dic?.allValues.count)! - 1
                {
                    let tempDic = dic?.allValues[i] as? NSDictionary
                    let model = AppointmentModel()
                    //                model.initWithDic(dic: tempDic!)
                    model.parseDicToSelf(dic: tempDic!)
                    arrProgress.append(model)
                }
                group.leave()
            }, withCancel: { (error) in
                print(error.localizedDescription)
                group.leave()
            })
        }
        backgroundQueue.async(group: group) { _ in
            group.enter()
            firebaseQuery.queryEqual(toValue: "COMPLETED").observeSingleEvent(of: .value, with: { (snapshot) in
                let dic = snapshot.value as? NSDictionary
                
                for i in 0...(dic?.allValues.count)! - 1
                {
                    let tempDic = dic?.allValues[i] as? NSDictionary
                    let model = AppointmentModel()
                    //                model.initWithDic(dic: tempDic!)
                    model.parseDicToSelf(dic: tempDic!)
                    arrCompleted.append(model)
                }
                group.leave()
            }, withCancel: { (error) in
                print(error.localizedDescription)
                group.leave()
            })
        }
        group.notify(queue: backgroundQueue) { _ in
            
            appointmentLists.append(contentsOf: arrNew)
            appointmentLists.append(contentsOf: arrProgress)
            appointmentLists.append(contentsOf: arrCompleted)
            
            successHandler(appointmentLists as AnyObject)
        }
//        ref.child("engineerApp").child("engineers-appointments").child("2hVdrYsU4jQzSmaK0xEp154dy6s1").queryOrdered(byChild: "complete").observe(.value, with: { (snapshot) in
//            // Get user value
//            print("snapshot.value => \(snapshot.value)")
//            let dic = snapshot.value as? NSDictionary
//            var arr = [AppointmentModel]()
//
//            for i in 0...(dic?.allValues.count)! - 1
//            {
//                let tempDic = dic?.allValues[i] as? NSDictionary
//                let model = AppointmentModel()
//                //                model.initWithDic(dic: tempDic!)
//                model.parseDicToSelf(dic: tempDic!)
//                arr.append(model)
//            }
//            successHandler(arr as AnyObject)
//        }) { (error) in
//            print(error.localizedDescription)
//            failHandeler("Can't load appointments" as AnyObject)
//        }
    
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
