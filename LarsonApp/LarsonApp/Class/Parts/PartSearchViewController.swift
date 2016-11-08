//
//  PartSearchViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartSearchViewController: BaseViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initNav()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initNav()
    {
        let navSearchView = Bundle.main.loadNibNamed("NavSearchView", owner: self, options: nil)?[0] as? NavSearchView
        navSearchView?.frame = CGRect(x: 0, y: 0, width: LCDW, height: 64)
        self.view.addSubview(navSearchView!)
        
        navSearchView?.btnTappedHandler = {
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
