//
//  EditEventViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/14/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class EditEventViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavView(title: "New Event", bolBack: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
