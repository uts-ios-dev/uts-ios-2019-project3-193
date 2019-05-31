//
//  LoginView.swift
//  ass3
//
//  Created by Vicky Shi on 2019/5/20.
//  Copyright © 2019 Vicky Shi. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    // MARK:Properties
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func loginIn(_ sender: UIButton) {
        if inputUsername.text!.count > 0{
            if validateEmail(email: inputUsername.text!) == true {
                if inputPassword.text!.count > 0{
                    if checkLogin(uName: inputUsername.text!, uPassword: inputPassword.text!){
                        self.performSegue(withIdentifier: "toMapView", sender: nil)
                    }else{
                        alert(messages: "Username or Password is wrong!")
                    }
                }else{
                    alert(messages: "Password is not entered!")
                }
                
            }else{
                
                alert(messages: "Username is wrong format!")
                
            }
            
            //When user enters his username, and clicks on the Start button, it will go to the timer page.
        }else{
            alert(messages: "Username is not entered!")
        }
        
        
        if let userName = inputUsername.text {
            UserDefaults.standard.set(userName.trimmingCharacters(in: .whitespacesAndNewlines), forKey: "usernameKey")
            //Save username inputted in the username label to a key called "usernameKey".
            //Also, if the username contains any spaces at the begining or end, the spaces will be trimmed.
        }
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "toSignInView", sender: nil)
        
    }
    
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex);
            return emailTest.evaluate(with: email)
        
    }
    
    func alert(messages: String){
        let alertController = UIAlertController(title: "Error", message: messages,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func checkLogin(uName: String, uPassword: String) -> Bool{
        let userPassword = UserDefaults.standard.string(forKey: uName)
        
        if userPassword != nil {
            if userPassword == uPassword{
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
}
