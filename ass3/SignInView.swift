//
//  SignInView.swift
//  ass3
//
//  Created by Shirley yamg on 30/5/19.
//  Copyright © 2019 Vicky Shi. All rights reserved.
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
    
    @IBAction func register(_ sender: UIButton) {

        if regUsername.text!.count > 0{
            if validateEmail(email: regUsername.text!){
                if regPassword.text!.count > 0 && regRePassword.text!.count > 0 {
                    if checkPassword(){
                        if checkLogin(){
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

    func alert(messages: String){
        let alertController = UIAlertController(title: "Error", message: messages,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex);
        return emailTest.evaluate(with: email)
        
    }
    
    func checkPassword() -> Bool {
        let rpassword = NSString(string:regPassword.text!)
        let rrpassword = NSString(string:regRePassword.text!)
        if rpassword.compare(rrpassword as String).rawValue == 0 {
            return true;
        }else{
            return false;
        }
    }
    
    func checkLogin() -> Bool{
        let userPassword = UserDefaults.standard.string(forKey: regUsername.text!)

        if userPassword != nil {
            return false;
        }else{
            return true;
        }
    }
}
