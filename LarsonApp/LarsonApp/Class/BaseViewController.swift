//
//  BaseViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var navHeaderView : NavHeaderView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initNavView(title : String){
        navHeaderView = Bundle.main.loadNibNamed("NavHeaderView", owner: self, options: nil)?[0] as? NavHeaderView
        navHeaderView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: 64)
        navHeaderView?.initUI(str: title, bolBack: false)
        self.view.addSubview(navHeaderView!)
        navHeaderView?.testBtnHandler = {
            
        }
        navHeaderView?.opertionBtnHandler = {
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
