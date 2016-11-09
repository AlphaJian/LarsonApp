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
    
    var cellTapHandler : CellTouchUpBlock?

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "PartsResultTableViewCell", bundle: nil) , forCellReuseIdentifier: "PartsResultTableViewCell")
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartsResultTableViewCell") as! PartsResultTableViewCell
        cell.clearCell()
        let model = dataItems[indexPath.row] 
        cell.initUI(partmodel: model, index: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellTapHandler != nil
        {
            cellTapHandler!(indexPath, dataItems[indexPath.row])
        }
    }

}
