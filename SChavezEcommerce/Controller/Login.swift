//
//  Login.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 12/01/23.
//

import Foundation
import FirebaseAuth
import UIKit

class Login : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func Login(email : String, password : String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else {
              
              return }
            self?.performSegue(withIdentifier: "login", sender: self)
        }
    }
}
