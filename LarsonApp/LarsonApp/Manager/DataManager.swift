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
    
    var referenceStr = "o8GCshuaUieenxLhcI8ampnaZC63"
    
    
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
        let firebaseQuery = ref.child("engineerApp").child("engineers-appointments").child(self.referenceStr).queryOrdered(byChild: "currentStatus")
        
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
                if dic != nil {
                    for i in 0...(dic?.allValues.count)! - 1
                    {
                        let tempDic = dic?.allValues[i] as? NSDictionary
                        let model = AppointmentModel()
                        //                model.initWithDic(dic: tempDic!)
                        model.parseDicToSelf(dic: tempDic!)
                        arrNew.append(model)
                    }
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
                if dic != nil {
                    for i in 0...(dic?.allValues.count)! - 1
                    {
                        let tempDic = dic?.allValues[i] as? NSDictionary
                        let model = AppointmentModel()
                        //                model.initWithDic(dic: tempDic!)
                        model.parseDicToSelf(dic: tempDic!)
                        arrProgress.append(model)
                    }
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
                if dic != nil {
                    for i in 0...(dic?.allValues.count)! - 1
                    {
                        let tempDic = dic?.allValues[i] as? NSDictionary
                        let model = AppointmentModel()
                        //                model.initWithDic(dic: tempDic!)
                        model.parseDicToSelf(dic: tempDic!)
                        arrCompleted.append(model)
                    }
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
    }
    
    func fetchJobParts(jobId : String, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock)
    {
        ref.child("engineerApp").child("appointment-parts").child(jobId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSDictionary
            if dic == nil
            {
                failHandeler("No Parts Here" as AnyObject)
            }
            else
            {
                successHandler(dic!)
            }
        }) { (error) in
            print(error.localizedDescription)
            failHandeler("Can't load parts" as AnyObject)
        }
    }
    
    func searchParts(keywords : String, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock)
    {
        ref.child("search").child("response").observe(.childAdded, with: { (snapshot) in
            print(snapshot)
        })
        let tempRef = ref.child("search").child("request").childByAutoId()
        let tempStr = ref.child("search").child("request").description()
        let requestId = StringUtil.getSpecWordToEnd(oldStr: tempRef.description(), middleStr: tempStr)
        
        tempRef.setValue(["index":kPartSearchIndex,"query":"ab","size":kPartSearchSize,"type":kPartSearchType]) { (error, ref) in
            self.fetchRes(req: requestId, successHandler: successHandler, failHandeler: failHandeler)
        }
    }
    
    func fetchRes(req : String, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock){
        ref.child("search").child("response").child(req).observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? NSDictionary
            successHandler(dic!)
        })
    }
    
    func deleteJobParts(jobId : String, childStr : String, partId : String, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock){
        deleteDataRequest(ref:ref.child("engineerApp").child("appointment-parts").child(jobId).child(childStr).child(partId)
            , successHandler: successHandler, failHandeler: failHandeler)
    }
    
    func deleteDataRequest(ref : FIRDatabaseReference, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock){
        ref.removeValue()
        successHandler(NSNull.self)
    }
}
