//
//  SignInController.swift
//  SeagueDemo
//
//  Created by shubham Pandey on 18/09/19.
//  Copyright © 2019 shubham Pandey. All rights reserved.
//

import UIKit

class SignInController: UIViewController {
     var signInCounter : ((String) -> Void?)?
    @IBOutlet weak var signIn_Button: UIButton!
    @IBOutlet weak var password_label: UITextField!
    @IBOutlet weak var email_label: UITextField!
    func setupAddTargetIsNotEmptyTextFields() {
        signIn_Button.isHidden = true       //hidden SignInButton
        email_label.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                              for: .editingChanged)
        password_label.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                 for: .editingChanged)
    }
    @objc func textFieldsIsNotEmpty(sender: UITextField) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let email = email_label.text, !email.isEmpty,
            let password = password_label.text, !password.isEmpty
        else
        {
            self.signIn_Button.isHidden = true
            return
        }
        
        //if all conditions are met , enable signIn button
        signIn_Button.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupAddTargetIsNotEmptyTextFields()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let HomeVc = segue.destination as? HomeScreenController else{return}
        HomeVc.messageValueSignIn = "Successfully Signed In"
         signInCounter?(email_label.text!)
        
    }


}
