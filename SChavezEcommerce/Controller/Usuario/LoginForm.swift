//
//  LoginForm.swift
//  SChavezEcommerce
//
//  Created by MacbookMBA10 on 13/01/23.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginForm: UIViewController{
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var AccederButton: UIButton!
    @IBOutlet weak var RegistrarButton: UIButton!
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        
    }
    
    @IBAction func RegistrarButton(_ sender: UIButton) {
        
       /*/ let email = correofield.text!
        let password = passwordfield.text!*/
        
        if let email = EmailTextField.text, let password = PasswordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in


        if let result = result, error == nil {
            self.performSegue(withIdentifier: "Login2", sender: self)
           // self.navigationController?.pushViewController(LoginForm(email:result.user.email, provider: .init()),
         //animated: true)
           // self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
            //self.navigationController?.pushViewController(LoginForm: "RegistrarForm", animated: true)
            let  alertController = UIAlertController(title: "Mensaje", message: "Usuario Registrado Correctamente", preferredStyle: .alert)

            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.EmailTextField.text = ""
            self.PasswordTextfield.text = ""

          self.present(alertController, animated: true, completion: nil)
        } else{
          let  alertController = UIAlertController(title: "Advertencia", message: "Error este usuario ya esta registrado", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))

        self.present(alertController, animated: true, completion: nil)

       // }
        }
        }

        }

    }
    
    @IBAction func AccederButon(_ sender: UIButton) {
        
         
         if let email = EmailTextField.text, let password = PasswordTextfield.text{
             Auth.auth().signIn(withEmail: email, password: password){
                 (result, error) in
         if let result = result, error == nil {
             self.performSegue(withIdentifier: "SegundaVista", sender: self)
             let  alertController = UIAlertController(title: "Mensaje", message: "Acceso correcto", preferredStyle: .alert)

           alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
         
             self.EmailTextField.text = ""
             self.PasswordTextfield.text = ""

           self.present(alertController, animated: true, completion: nil)
            
         } else{
           let  alertController = UIAlertController(title: "Error", message: "Error al accesar", preferredStyle: .alert)

         alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))

         self.present(alertController, animated: true, completion: nil)

         }
         }

         }
   
    }
    
}
