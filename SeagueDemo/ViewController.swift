//
//  ViewController.swift
//  SeagueDemo
//
//  Created by shubham Pandey on 18/09/19.
//  Copyright © 2019 shubham Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var countSignup : Int = 0
     var countSignin : Int = 0
    @IBAction func signupAction_Button(_ sender: Any) {
    
    }
    @IBOutlet weak var TotalSignUp_Label: UILabel!
    @IBOutlet weak var TotalSignIn_Label: UILabel!
   
    
    @IBOutlet weak var LastSignUp_Label: UILabel!
    @IBAction func sendtoViewCOntroller(_ sender : UIStoryboardSegue){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SignUpController
        {
            guard let vc = segue.destination as? SignUpController else{
                return
            }
            vc.signupCounter = {(val: String) -> Void in
                self.countSignup = self.countSignup + 1
                self.TotalSignUp_Label.text = "TotalSignUp : " + String(self.countSignup)
            }
        }

        if segue.destination is SignInController
        {
            guard let vc = segue.destination as? SignInController else{
                return
            }
            vc.signInCounter = {(val: String) -> Void in
                self.countSignin = self.countSignin + 1
                self.TotalSignIn_Label.text = "TotalSignIn : " + String(self.countSignin)
            }
        }
        

}


    
        
        
    
}
