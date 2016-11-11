//
//  InputWorkOrderCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/11/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class InputWorkOrderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    var textViewUpdateBlock: ReturnBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.contentTextView.textContainer.lineFragmentPadding = 0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initUI(parameter: (String, String)) {
        self.titleLabel.text = parameter.0
        self.contentTextView.text = parameter.1
    }
    
}

extension InputWorkOrderCell : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.textViewUpdateBlock?(textView.text as AnyObject)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.bottomView.backgroundColor = .blue
        self.titleLabel.textColor = .blue
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.bottomView.backgroundColor = .lightGray
        self.titleLabel.textColor = .darkGray
    }
}
