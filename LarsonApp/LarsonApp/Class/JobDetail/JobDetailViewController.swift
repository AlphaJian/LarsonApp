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
    
    var siteHistoryTableView : SiteHistoryTableView?

    var workOrderTableView : WorkOrderTableView?
    var nextPartSearchVC : PartSearchViewController?
    var timeSheetTab : TimeSheetView?
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

        fetchSiteHistoryData()
 
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
        initSiteHistory()
        initWorkOrderTab()
        initTimeSheetTab()
    }
    
    func initDetailTab(){
        jobDetailView = Bundle.main.loadNibNamed("JobDetailView", owner: self, options: nil)?[0] as? JobDetailView
        jobDetailView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: LCDH - 128)
        self.scrollViewSet?.scrollView?.addSubview(jobDetailView!)
        
        
    }

    func initPartTab(){
        partsView = JobPartsTableView(frame: CGRect(x: LCDW, y: 0, width: (scrollViewSet?.width())!, height: (scrollViewSet?.scrollView?.height())!), style: .plain)
        scrollViewSet?.scrollView?.addSubview(partsView!)
        
        partsView?.buttonTapHandler = {
            self.nextPartSearchVC = PartSearchViewController()
            self.nextPartSearchVC?.bolTabVC = false
            self.navigationController?.pushViewController(self.nextPartSearchVC!, animated: true)
        }
        partsView?.partDeleteHandler = {[unowned self](indexPath, partModel) -> Void in
            let childStr = (self.partsView?.dataItems[indexPath.section] as! NSDictionary).allKeys[0] as! String
            DataManager.shareManager.deleteJobParts(jobId: (self.model?._id)!, childStr: childStr, partId: partModel._id, successHandler: { (obj) in
                self.fetchPartsData()
                }, failHandeler: { (obj) in
            })
        }
    }
    func initTimeSheetTab(){
        timeSheetTab = Bundle.main.loadNibNamed("TimeSheetView", owner: self, options: nil)?[0] as? TimeSheetView
        timeSheetTab?.frame = CGRect(x: LCDW * 4, y: 0, width: (scrollViewSet?.width())!, height: (scrollViewSet?.height())!-64)
        PartsManager.shareManager.createInitialTimeSheet(startTime: Date(), jobsite: (model?.customerAddress)!, desc: (model?.jobDetail)!)
        timeSheetTab?.initUI(timeSheetArr: PartsManager.shareManager.timeSheetArr!)
        scrollViewSet?.scrollView?.addSubview(timeSheetTab!)
        
        timeSheetTab?.addHandler = {
            let vc = EditEventViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func initSiteHistory(){
    siteHistoryTableView = SiteHistoryTableView(frame: CGRect(x: LCDW * 2, y: 0, width: LCDW, height: (scrollViewSet?.height())!), style: .plain)
    scrollViewSet?.scrollView?.addSubview(siteHistoryTableView!)
        
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
        workOrderTableView?.vc = self
        scrollViewSet?.scrollView?.addSubview(workOrderTableView!)
        
    }
    
    func fetchPartsData(){
        DataManager.shareManager.fetchJobParts(jobId: (model?._id)!, successHandler: { (obj) in
            DispatchQueue.main.async {
                self.partsView?.dataItems = PartsManager.shareManager.parseJobPartsDicToModel(dic: obj as! NSDictionary)
                self.partsView?.reloadData()
            }
        }) { (obj) in
            DispatchQueue.main.async {
                self.partsView?.dataItems = NSMutableArray()
                self.partsView?.reloadData()
            }
            
        }
    }
    
    func fetchSiteHistoryData(){
        DataManager.shareManager.fetchSiteHistory (jobId: "ey4upM6hWsNiB6C4e", successHandler: { (obj) in
            DispatchQueue.main.async {
                var dicaa = NSMutableDictionary()
                dicaa = PartsManager.shareManager.parseSiteHistoryDicToModel(dic: obj as! NSDictionary)
                print(dicaa)
                self.siteHistoryTableView?.dataItems = dicaa
                self.siteHistoryTableView?.reloadData()
            }
        }) { (obj) in
            print(obj)
        }
    }
    
  
    func fetchWorkOrderData() {
        DataManager.shareManager.fetchWorkOrder(appointmentModel: self.model!, successHandler: { (obj) in
            
        }, failHandeler: { (obj) in
            print(obj)
        })
        self.workOrderTableView?.model = self.model
        self.workOrderTableView?.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
