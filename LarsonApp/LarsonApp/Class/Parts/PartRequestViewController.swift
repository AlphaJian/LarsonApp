//
//  PartRequestViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/9/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartRequestViewController: BaseViewController {

    var partModel : PartModel?
    
    var partRequestView : PartRequestContainerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavView(title: "Part Request", bolBack: true)
        initUI()
    }
    
    func initUI(){
        partRequestView = Bundle.main.loadNibNamed("PartRequestContainerView", owner: self, options: nil)?[0] as? PartRequestContainerView
        partRequestView?.frame = CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64)
        partRequestView?.initUpper(model: self.getBaseTabVC().jobDetailModel)
        partRequestView?.initPart(model: partModel!)
        self.view.addSubview(partRequestView!)
        
        partRequestView?.requestHandler = {(part, jobId) -> Void in
            DataManager.shareManager.insertPartRequest(appointmentId: jobId as! String, dic: (part as! PartModel).parseSelfToDic(), successHandler: { (obj) in
                let destinationVC = self.navigationController?.viewControllers[1] as! JobDetailViewController
                
                let _ = self.navigationController?.popToViewController(destinationVC, animated: true)
                destinationVC.fetchPartsData()

            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
