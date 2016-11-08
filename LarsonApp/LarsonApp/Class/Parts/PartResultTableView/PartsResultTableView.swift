//
//  PartsResultTableView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartsResultTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var dataItems = [PartModel]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "JobPartsTableViewCell", bundle: nil) , forCellReuseIdentifier: "JobPartsTableViewCell")
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobPartsTableViewCell") as! JobPartsTableViewCell
        
        let dic = dataItems[indexPath.section] as! NSDictionary
        let str = dic.allKeys[0] as! String
        let arr = dic.value(forKey: str) as! NSArray
        let model = arr[indexPath.row] as! PartModel
        cell.initUI(model: model, index: indexPath)
        
        return cell
    }

}
