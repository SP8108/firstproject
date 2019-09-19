//
//  SignUpController.swift
//  SeagueDemo
//
//  Created by shubham Pandey on 18/09/19.
//  Copyright © 2019 shubham Pandey. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
     var signupCounter : ((String) -> Void?)?
    @IBOutlet weak var signUp_Button: UIButton!
    func setupAddTargetIsNotEmptyTextFields() {
        signUp_Button.isHidden = true      //hidden SignUpButton
        name_Label.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
        email_Label.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                     for: .editingChanged)
        contact_Label.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                        for: .editingChanged)
       password_Label.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                              for: .editingChanged)
    }
    @objc func textFieldsIsNotEmpty(sender: UITextField) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let name = name_Label.text, !name.isEmpty,
            let email = email_Label.text, !email.isEmpty,
            let password = password_Label.text, !password.isEmpty,
            let contact = contact_Label.text, !contact.isEmpty

            else
        {
            self.signUp_Button.isHidden = true
            return
        }
        //if all conditions are met , enable signUp button
       signUp_Button.isHidden = false
    }
   
    @IBOutlet weak var password_Label: UITextField!
    @IBOutlet weak var contact_Label: UITextField!
    @IBOutlet weak var email_Label: UITextField!
    @IBOutlet weak var name_Label: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
          setupAddTargetIsNotEmptyTextFields()
    }
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let HomeVc = segue.destination as? HomeScreenController else{return}
        HomeVc.nameValue = name_Label.text
        HomeVc.messageValueSignUp = "Successfully Signed Up"
        signupCounter?(name_Label.text!)
    
    }
}
