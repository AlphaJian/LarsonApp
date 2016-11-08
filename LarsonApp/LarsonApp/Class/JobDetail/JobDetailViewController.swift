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
    }

    func initUI(){
        scrollViewSet = ScrollViewSet.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64 ))
        self.view.addSubview(scrollViewSet!)
        
        for i in 0...titleArr.count - 1 {
            
            let scrollView = UIScrollView.init(frame: CGRect(x: CGFloat(i) * LCDW, y: 0, width: LCDW, height: LCDH - 128))
            
            scrollView.backgroundColor = StringUtil.getColorWithRGB(red: 30 * CGFloat(i), green: 20 * CGFloat(i), blue: 155)
            
            self.scrollViewSet?.scrollView?.addSubview(scrollView)
            
            if i == 0 {
                jobDetailView = Bundle.main.loadNibNamed("JobDetailView", owner: self, options: nil)?[0] as? JobDetailView
                jobDetailView?.initUI(model: model!)
                scrollView.contentSize.height = (jobDetailView?.frame.height)!
                scrollView.addSubview(jobDetailView!)
            }
            
            
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
