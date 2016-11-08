//
//  JobDetailViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class JobDetailViewController: BaseViewController {

    var scrollViewSet : ScrollViewSet?
    
    var partsView : JobPartsTableView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initNavView(title: "Appointment Detail")
        initUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DataManager.shareManager.fetchJobParts(jobId: "-KTTnbrt7qeWyMx02KOU", successHandler: { (obj) in
            DispatchQueue.main.async {
                self.partsView?.dataItems = PartsManager.shareManager.parseJobPartsDicToModel(dic: obj as! NSDictionary)
                self.partsView?.reloadData()
            }
            }) { (obj) in
                print(obj)
        }
    }

    func initUI(){
        scrollViewSet = ScrollViewSet.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64 ))
        self.view.addSubview(scrollViewSet!)
        
        partsView = JobPartsTableView(frame: CGRect(x: 0, y: 0, width: (scrollViewSet?.width())!, height: (scrollViewSet?.height())!), style: .plain)
        scrollViewSet?.addSubview(partsView!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
