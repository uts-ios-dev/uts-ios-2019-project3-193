//
//  SignInView.swift
//  ass3
//
//  Created by Shirley yamg on 30/5/19.
//  Copyright © 2019 Shirley yamg . All rights reserved.
//

import UIKit

class SignInView: UIViewController {
    
    // MARK:Properties
    @IBOutlet weak var regUsername: UITextField!
    @IBOutlet weak var regPassword: UITextField!
    @IBOutlet weak var regRePassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // the sign in button function
    @IBAction func register(_ sender: UIButton) {
        // judge username has been inputted
        if regUsername.text!.count > 0{
            // judge the format of username is valid
            if validateEmail(email: regUsername.text!){
                // judge password and repassword have been inputted
                if regPassword.text!.count > 0 && regRePassword.text!.count > 0 {
                    // checking password and repassword are same
                    if checkPassword(){
                        // checking username has not been registered
                        if checkLogin(){
                            // saving username and password
                           UserDefaults.standard.set(regPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines), forKey: regUsername.text!)
                            
                            self.performSegue(withIdentifier: "toMapView", sender: nil)
                        }else{
                            alert(messages: "yong hu ming yi cun zai")
                        }
                    }else{
                        alert(messages: "mi ma bu tong")
                    }
                }else{
                    alert(messages: "Please enter password")
                }
            }else{
                alert(messages: "Invalid username format")
            }
        }else{
            alert(messages: "Please enter user name")
        }
        
    }

    // alert information function
    func alert(messages: String){
        let alertController = UIAlertController(title: "Error", message: messages,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // verify email format
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex);
        return emailTest.evaluate(with: email)
        
    }
    
    // checking password and repassword
    func checkPassword() -> Bool {
        // get password
        let rpassword = NSString(string:regPassword.text!)
        // get repassword
        let rrpassword = NSString(string:regRePassword.text!)
        // compare two password are same
        if rpassword.compare(rrpassword as String).rawValue == 0 {
            return true;
        }else{
            return false;
        }
    }
    
    // verify username has not been registered
    func checkLogin() -> Bool{
        let userPassword = UserDefaults.standard.string(forKey: regUsername.text!)

        if userPassword != nil {
            return false;
        }else{
            return true;
        }
    }
}
