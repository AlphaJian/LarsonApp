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
        partRequestView?.initUpper(appointmentModel: self.getBaseTabVC().jobDetailModel)
        partRequestView?.initPart(partModel: partModel!)
        self.view.addSubview(partRequestView!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
