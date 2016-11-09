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
    
    var listBlock : ReturnBlock?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavView(title: "Appointment List")
        initUI()
        self.view.showhud()
        DataManager.shareManager.fetchAppointList(successHandler: { (obj) in
            
            DispatchQueue.main.async {
                var arrNew = [AppointmentModel]()
                if self.listBlock != nil {
                    let arrayList = obj as! [AppointmentModel]
                    arrNew = arrayList.filter({ (model) -> Bool in
                        model.currentStatus.lowercased() == "new"
                    })
                    if arrNew.count > 0 {
                        self.listBlock!(arrNew[0] as AnyObject)
                    } else {
                        self.listBlock!(AppointmentModel() as AnyObject)
                    }
                    
                }
                self.view.hidehud()
                self.tableview.items = obj as! [AppointmentModel]
                self.tableview.reloadData()
            }
            }) { (obj) in
                self.view.hidehud()
                print(obj)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }

    func initUI(){
        tableview = AppointmentsTableView(frame:CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64)
 , style: .plain)
        tableview.cellClickBlock = { (model: AnyObject) in
            let appointmentModel = model as! AppointmentModel
            let vc = JobDetailViewController()
            vc.model = appointmentModel
            self.navigationController?.pushViewController(vc, animated: true)
        }

        self.view.addSubview(tableview)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
