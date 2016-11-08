//
//  JobPartsTableView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class JobPartsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var dataItems = NSMutableArray()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        //        self.register(QuestionReportTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dic = dataItems[section] as! NSDictionary
        let str = dic.allKeys[0] as! String
        return (dic.value(forKey: str) as! NSArray).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        let dic = dataItems[indexPath.section] as! NSDictionary
        let str = dic.allKeys[0] as! String
        let arr = dic.value(forKey: str) as! NSArray
        let model = arr[indexPath.row] as! PartModel
        cell?.textLabel?.text = model.name
        
        return cell!
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.width(), height: 40))
        let lbl = UILabel(frame: view.bounds)
        let dic = dataItems[section] as! NSDictionary
        lbl.text = dic.allKeys[0] as? String
        view.addSubview(lbl)
        
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
