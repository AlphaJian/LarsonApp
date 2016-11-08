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
    var model : AppointmentModel?
    var jobDetailView : JobDetailView?
    var titleArr = ["aaa","bbbb","cccc","dddd","eee","ffff"]
    
    var partsView : JobPartsTableView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataManager.shareManager.fetchAppointList(successHandler: { (obj) in
            print(obj)
            DispatchQueue.main.async {
                self.model = (obj as! [AppointmentModel])[0]
                self.initUI()
            }
        }) { (obj) in
            print(obj)
        }

        initNavView(title: "Appointment Detail")
        //initUI()
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
        

        for i in 0...titleArr.count - 1 {
            
            let scrollView = UIScrollView.init(frame: CGRect(x: CGFloat(i) * LCDW, y: 0, width: LCDW, height: LCDH - 128))
            
            self.scrollViewSet?.scrollView?.addSubview(scrollView)
            
            if i == 0 {
                jobDetailView = Bundle.main.loadNibNamed("JobDetailView", owner: self, options: nil)?[0] as? JobDetailView
                jobDetailView?.initUI(model: model!)
                scrollView.contentSize.height = (jobDetailView?.frame.height)!
                scrollView.addSubview(jobDetailView!)
            }
            
            
        }
        
        
//        
//        partsView = JobPartsTableView(frame: CGRect(x: 0, y: 0, width: (scrollViewSet?.width())!, height: (scrollViewSet?.height())!), style: .plain)
//        scrollViewSet?.addSubview(partsView!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
