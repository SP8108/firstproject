//
//  HomeScreenController.swift
//  SeagueDemo
//
//  Created by shubham Pandey on 18/09/19.
//  Copyright © 2019 shubham Pandey. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController {
    var nameValue : String!
    var messageValueSignUp : String!
     var messageValueSignIn : String!
    @IBOutlet weak var message_Label: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       if let signupvalue = nameValue
       {
        nameLabel.text = signupvalue
        message_Label.text = messageValueSignUp
        }
       else{
        nameLabel.text = " "
        message_Label.text = messageValueSignIn
        }
        
      
    }
   

 

}
