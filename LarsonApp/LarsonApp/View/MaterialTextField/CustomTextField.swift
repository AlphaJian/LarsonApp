//
//  CustomTextField.swift
//  BusinessOS
//
//  Created by Jian Zhang on 10/27/15.
//  Copyright © 2015 PwC. All rights reserved.
//

import UIKit

class CustomTextField: UIView, UITextFieldDelegate {
    
    var title : String = ""
    var strValue : String = ""
    var bolEdited : Bool = false
    var bolTextfield : Bool = true
    var isOptional : Bool = false
    
    let editedColor = UIColor(red: 231/255, green: 155/255, blue: 53/255, alpha: 1)
    let uneditedColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
    let fieldColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    
    let editedInterval : CGFloat = 35
    let uneditedInterval : CGFloat = 10
    
    let editedFont : CGFloat = 13
    let uneditedFont : CGFloat = 14
    
    var tapHandler : ButtonTouchUpBlock?
    var finishEditHandler : TextFieldFinishBlock?
    var itemSelectHandler : ReturnBlock?
    var startHandler : TextFieldStartBlock?
    
    var leaveHandler : TextFieldLeaveBlock?
    var returnhandler : TextFieldReturnBlock?
    
    @IBOutlet weak var bottomLineInterval: NSLayoutConstraint!
    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var fieldTF: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    
    func createCustomField(_title : String, _bolTextfield : Bool)
    {
        fieldTF.delegate = self
        fieldTF.textColor = fieldColor
        
        fieldTF.autocorrectionType = UITextAutocorrectionType.no

        title = _title
        bolTextfield = _bolTextfield
        self.titleLbl.text = _title
        errorLbl.isHidden = true
    }
    
    func setText(str : String)
    {
        strValue = str
        fieldTF.text = str
        animationTitleLbl(bol: true)
    }
    
    func showErrorMsg(str : String)-> Void
    {
        errorLbl.isHidden = false
        errorLbl.text = str
    }
    
    func setValueField(str : String)
    {
        self.strValue = str
        self.fieldTF.text = str
        self.animationTitleLbl(bol: true)
    }
    
    func animationTitleLbl(bol : Bool){
        bolEdited = bol
        if bolEdited
        {
//            bottomLineView.backgroundColor = editedColor
            titleLbl.textColor = editedColor
            self.titleLbl.font = UIFont.systemFont(ofSize: self.editedFont)
//            titleLbl.text = title.stringByReplacingOccurrencesOfString("(optional)", withString: "")
            if self.bottomLineInterval.constant != self.editedInterval
            {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.bottomLineInterval.constant = self.editedInterval
                    self.layoutIfNeeded()
                })
            }
        }
        else
        {
//            bottomLineView.backgroundColor = uneditedColor
            titleLbl.textColor = uneditedColor

            titleLbl.text = title

            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.bottomLineInterval.constant = self.uneditedInterval
                self.layoutIfNeeded()
                }, completion: { (bol) -> Void in
                    self.titleLbl.font = UIFont.systemFont(ofSize: self.uneditedFont)
            })
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bolEdited = true
        errorLbl.isHidden = true
        animationTitleLbl(bol: bolEdited)
        
        if self.tapHandler != nil
        {
            self.tapHandler?()
        }
        if startHandler != nil
        {
            startHandler?()
        }
        return bolTextfield
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        strValue = prospectiveText
        if finishEditHandler != nil
        {
            finishEditHandler!(prospectiveText)
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty == true)
        {
            bolEdited = false
        }
        else
        {
            bolEdited = true
        }
        if finishEditHandler != nil
        {
            finishEditHandler!(strValue)
        }
        if leaveHandler != nil
        {
            leaveHandler?(textField.text!)
        }
        animationTitleLbl(bol: bolEdited)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIApplication.shared.keyWindow?.endEditing(true)
        if returnhandler != nil
        {
            returnhandler!()
        }
        return true
    }
    func hidePassword(hide: Bool){
        fieldTF.isSecureTextEntry = hide
        
    }
}
