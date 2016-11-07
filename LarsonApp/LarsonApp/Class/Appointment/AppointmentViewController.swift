//
//  AppointmentViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class AppointmentViewController: BaseViewController {
    var tableview : AppointmentsTableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initNavView(title: "Appointment List")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        DataManager.shareManager.fetchAppointList(successHandler: { (obj) in
//            print(obj)
//            DispatchQueue.main.async {
//                self.tableview.items = obj as! [AppointmentModel]
//                self.tableview.reloadData()
//            }
//            }) { (obj) in
//                print(obj)
//        }
    }

    func initUI(){
        tableview = AppointmentsTableView(frame:CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64)
 , style: .plain)
        self.view.addSubview(tableview)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
