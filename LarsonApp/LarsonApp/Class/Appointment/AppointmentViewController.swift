//
//  AppointmentViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import Firebase

class AppointmentViewController: BaseViewController {
    var tableview : AppointmentsTableView!
    
    var listBlock : ReturnBlock?
    
    private lazy var appointmentListRef : FIRDatabaseReference = FIRDatabase.database().reference().child("engineerApp").child("engineers-appointments").child(DataManager.shareManager.referenceStr)
    private var appointmentListRefHandle: FIRDatabaseHandle?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavView(title: "Appointment List", bolBack: false)
        initUI()
        self.view.showhud()
        
        appointmentListRef.observe(.value, with: { (snapshot) in
            self.view.hidehud()
            if self.tableview != nil {
                var inProgressIndex = 0
                var completeIndex = 0
                var tempModel: AppointmentModel? = nil
                
                let dic = snapshot.value as? NSDictionary
                var arr = [AppointmentModel]()
                for i in 0...(dic?.allValues.count)! - 1
                {
                    let tempDic = dic?.allValues[i] as? NSDictionary
                    let model = AppointmentModel()
                    //                model.initWithDic(dic: tempDic!)
                    model.parseDicToSelf(dic: tempDic!)
                    
                    if model.currentStatus.lowercased() == "new" {
                        arr.insert(model, at: 0)
                        tempModel = model
                        inProgressIndex += 1
                        completeIndex += 1
                    } else if model.currentStatus.lowercased() == "in progress" {
                        arr.insert(model, at: inProgressIndex)
                        inProgressIndex += 1
                        completeIndex += 1
                    } else if model.currentStatus.lowercased() == "completed" {
                        arr.insert(model, at: completeIndex)
                        completeIndex += 1
                    }
                }

                DispatchQueue.main.async {
                    if self.listBlock != nil {
                        if tempModel != nil {
                            self.listBlock!(tempModel as AnyObject)
                        } else {
                            self.listBlock!(AppointmentModel() as AnyObject)
                        }
                    }
                    self.view.hidehud()
                    self.tableview.items = arr
                    self.tableview.reloadData()
                }

            }
        }, withCancel: { (error) in
            self.view.hidehud()
            print(error)
        })
        
//        DataManager.shareManager.fetchAppointList(successHandler: { (obj) in
//            
//            DispatchQueue.main.async {
//                var arrNew = [AppointmentModel]()
//                if self.listBlock != nil {
//                    let arrayList = obj as! [AppointmentModel]
//                    arrNew = arrayList.filter({ (model) -> Bool in
//                        model.currentStatus.lowercased() == "new"
//                    })
//                    if arrNew.count > 0 {
//                        self.listBlock!(arrNew[0] as AnyObject)
//                    } else {
//                        self.listBlock!(AppointmentModel() as AnyObject)
//                    }
//                    
//                }
//                self.view.hidehud()
//                self.tableview.items = obj as! [AppointmentModel]
//                self.tableview.reloadData()
//            }
//            }) { (obj) in
//                self.view.hidehud()
//                print(obj)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    deinit {
        print("#### deinit ####")
        appointmentListRef.removeAllObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//
    }

    func initUI(){
        tableview = AppointmentsTableView(frame:CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64)
 , style: .plain)
        tableview.cellClickBlock = { (model: AnyObject) in
            let appointmentModel = model as! AppointmentModel
            let vc = JobDetailViewController()
            vc.model = appointmentModel
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.tabVC?.jobDetailModel = appointmentModel
            
            self.navigationController?.pushViewController(vc, animated: true)
        }

        self.view.addSubview(tableview)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
