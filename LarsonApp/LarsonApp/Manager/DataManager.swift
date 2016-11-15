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

    var items: NSMutableDictionary = ["0":"Appointment List", "1":"Current Job", "2":"Parts Management", "3":"Chat Help", "4":"Log Out", "didSelect": 0]
    
    var referenceStr = "o8GCshuaUieenxLhcI8ampnaZC63"
    
    
    class var shareManager : DataManager {
        return single
    }
    
    func insertUser(emial : String, accessToken : String){
        let tempRef = ref.child("engineerApp").child("user-info").childByAutoId()
        tempRef.setValue(["email":emial, "token":accessToken])
        //        tempRef.updateChildValues([tempRef.childByAutoId():["email":emial, "token":accessToken]])
    }
    
    func insertPartRequest(appointmentId : String, dic : NSDictionary, successHandler : @escaping ReturnBlock)
    {
        let tempRef = ref.child("engineerApp").child("appointment-parts").child(appointmentId).child("requested").child(dic["_id"] as! String)
        tempRef.setValue(dic) { (err, ref) in
            successHandler(NSNull.self)
        }
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

    }
    
    func fetchWorkOrder(appointmentModel: AppointmentModel, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock) {
        let detailRef = ref.child("engineerApp/appointment-workorders").child(appointmentModel.appointmentId)
        detailRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let workOrderModel: WorkOrdersModel = WorkOrdersModel()
            if snapshot.exists() {
                let dic = snapshot.value as? NSDictionary
                workOrderModel.parseDicToSelf(dic: dic!)
                successHandler(workOrderModel)
            } else {
                //FIX: fake ID
                workOrderModel._id = "sho93uKy2Cby2AQLFDbU1J3a6863"
                workOrderModel.callNumber = appointmentModel.jobID
                workOrderModel.createdAt = NSDate().timeIntervalSince1970
                workOrderModel.lastModified = NSDate().timeIntervalSince1970
                workOrderModel.siteAddress = appointmentModel.customerAddress
                workOrderModel.city = appointmentModel.zipCode
                workOrderModel.phoneNumber = appointmentModel.telephoneNumber
                workOrderModel.stationNumber = appointmentModel.stationNumber
                workOrderModel.techNumber = appointmentModel.techNumber
                workOrderModel.serviceDescription = appointmentModel.jobDetail
                workOrderModel.currentStatus = appointmentModel.currentStatus
                workOrderModel.submitted = false
                workOrderModel.returnTripNeeded = false
                workOrderModel.workCompleted = false
                workOrderModel.jobCod = false
                detailRef.setValue(workOrderModel.parseSelfToDic())
            }
        }, withCancel: { (error) in
        
        })
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
    
    func fetchSiteHistory(jobId : String, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock)
    {
        let siteHistoryData = NSMutableDictionary()
        
        ref.child("engineerApp").child("location-equipment").child(jobId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSArray
            if dic == nil
            {
                failHandeler("No Parts Here" as AnyObject)
            }
            else
            {
                siteHistoryData.setValue(dic, forKey: "location-equipment")
                successHandler(siteHistoryData)
            }
        }) { (error) in
            print(error.localizedDescription)
            failHandeler("Can't load parts" as AnyObject)
        }
        
        ref.child("engineerApp").child("location-pastNotes").child(jobId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSDictionary
            if dic == nil
            {
                failHandeler("No Parts Here" as AnyObject)
            }
            else
            {
                siteHistoryData.setValue(dic, forKey: "location-pastNotes")
                successHandler(siteHistoryData)
            }
        }) { (error) in
            print(error.localizedDescription)
            failHandeler("Can't load parts" as AnyObject)
        }
        
        ref.child("engineerApp").child("location-sitehistories").child(jobId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let dic = snapshot.value as? NSArray
            if dic == nil
            {
                failHandeler("No Parts Here" as AnyObject)
            }
            else
            {
                siteHistoryData.setValue(dic, forKey: "location-sitehistories")
                successHandler(siteHistoryData)
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
    
    func upsertTimeSheet(strTime : String, jobId : String, arr : NSMutableArray, successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock)
    {
        let subRef = ref.child("engineerApp").child("user-timesheet").child("o8GCshuaUieenxLhcI8ampnaZC63").child(strTime).child(jobId)
        for i in 0...arr.count - 1 {
            let tempRef = subRef.childByAutoId()
            let tempStr = subRef.description()
            let model = arr[i] as! TimesheetModel
            let requestId = StringUtil.getSpecWordToEnd(oldStr: tempRef.description(), middleStr: tempStr)
            model._id = requestId
            tempRef.setValue(model.parseSelfToDic())
        }
    }
}
