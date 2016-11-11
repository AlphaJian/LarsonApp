//
//  JobDetailViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class JobDetailViewController: BaseViewController, UIScrollViewDelegate {
    
    var scrollViewSet : ScrollViewSet?
    var model : AppointmentModel?
    var jobDetailView : JobDetailView?
    var workOrderView : WorkOrderScrollView?
 //   var titleArr = ["aaa","bbbb","cccc","dddd","eee","ffff"]
    var scrollView : UIScrollView?
    var workOrderTableView : WorkOrderTableView?
    
    var partsView : JobPartsTableView?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initNavView(title: "Appointment Detail", bolBack: false)
        initUI()
        loadData()
        fetchPartsData()
        fetchWorkOrderData()
    }
    
    func loadData(){
        if model != nil
        {
            self.jobDetailView?.initUI(model: self.model!)
        }
        
    }
    
    func initUI(){
        scrollViewSet = ScrollViewSet.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64 ))
        self.view.addSubview(scrollViewSet!)
        
        initDetailTab()
        initPartTab()
        initWorkOrderTab()
    }
    
    func initDetailTab(){
        scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: LCDW, height: LCDH - 128))
        scrollView?.delegate = self
        
        
        self.scrollViewSet?.scrollView?.addSubview(scrollView!)
        jobDetailView = Bundle.main.loadNibNamed("JobDetailView", owner: self, options: nil)?[0] as? JobDetailView
        scrollView?.contentSize.height = (jobDetailView?.frame.height)!
        scrollView?.addSubview(jobDetailView!)
        
        jobDetailView?.mapMovingHandler = {
            self.scrollViewSet?.scrollView?.isScrollEnabled = false
            self.scrollView?.isScrollEnabled = false
        }
        jobDetailView?.movingHandler = {
            DispatchQueue.main.async {
                self.scrollViewSet?.scrollView?.isScrollEnabled = true
                self.scrollView?.isScrollEnabled = true
            }
        }
        
    }

    func initPartTab(){
        partsView = JobPartsTableView(frame: CGRect(x: LCDW, y: 0, width: (scrollViewSet?.width())!, height: (scrollViewSet?.height())!), style: .plain)
        scrollViewSet?.scrollView?.addSubview(partsView!)
        
        partsView?.buttonTapHandler = {
            let vc = PartSearchViewController()
            vc.bolTabVC = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
        partsView?.partDeleteHandler = {[unowned self](indexPath, partModel) -> Void in
            let childStr = (self.partsView?.dataItems[indexPath.section] as! NSDictionary).allKeys[0] as! String
            DataManager.shareManager.deleteJobParts(jobId: (self.model?._id)!, childStr: childStr, partId: partModel._id, successHandler: { (obj) in
                self.fetchPartsData()
                }, failHandeler: { (obj) in
                    
            })
        }
    }
    
    func initWorkOrderTab() {
//        workorderScrollView = UIScrollView.init(frame: CGRect(x: LCDW * 3, y: 0, width: LCDW, height: LCDH - 128))
//        workorderScrollView?.delegate = self
//        
//        
//        self.scrollViewSet?.scrollView?.addSubview(workorderScrollView!)
//        
//        
//        workOrderView = Bundle.main.loadNibNamed("WorkOrderScrollView", owner: self, options: nil)?[0] as? WorkOrderScrollView
//        workorderScrollView?.contentSize.height = (workOrderView?.frame.height)!
        workOrderTableView = WorkOrderTableView(frame: CGRect(x: LCDW*3, y: 0, width: (scrollViewSet?.width())!, height: (scrollViewSet?.height())!-64), style: .plain)
        scrollViewSet?.scrollView?.addSubview(workOrderTableView!)
    }
    
    func fetchPartsData(){
        DataManager.shareManager.fetchJobParts(jobId: (model?._id)!, successHandler: { (obj) in
            DispatchQueue.main.async {
                self.partsView?.dataItems = PartsManager.shareManager.parseJobPartsDicToModel(dic: obj as! NSDictionary)
                self.partsView?.reloadData()
            }
        }) { (obj) in
            print(obj)
        }
    }
    
    func fetchWorkOrderData() {
        self.workOrderTableView?.model = self.model
        self.workOrderTableView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("aaaaaa")
    }
    
    
    
}
