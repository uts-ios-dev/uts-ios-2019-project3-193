//
//  CustomerAndPaymentInformation.swift
//  ass3
//
//  Created by Vicky Shi on 25/5/19.
//  Copyright © 2019 Vicky Shi. All rights reserved.
//

import UIKit

class CustomerAndPaymentInformation: UIViewController {
    
    // MARK:Properties
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //weight change event
        weight.addTarget(self, action: #selector(weightChange), for: .editingChanged)
    }
    
    @IBAction func comfirm(_ sender: UIButton) {
        // verify first name has been inputted
        if firstName.text!.count > 0{
            // verifty last name has been inputted
            if lastName.text!.count > 0{
                //verify phone number has been inputted
                if phone.text!.count > 0{
                    // verify weight has been inputted
                    if weight.text!.count > 0{
                        if price.text!.count > 0{
                            self.performSegue(withIdentifier: "toCAPI", sender: nil)
                        }else{
                            alert(messages: "Please input price")
                            
                        }
                    }else{
                        alert(messages: "Please input weight")
                        
                    }
                }else{
                    alert(messages: "Please input phone number")
                }
            }else{
                alert(messages: "Please input last name")
            }
        }else{
            alert(messages: "Please input first name")
        }
    }
    
    func alert(messages: String){
        let alertController = UIAlertController(title: "Error", message: messages,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // weight change event
    // when weight value has been changed, price will be changed
    @objc func weightChange() {

        //update date show label
        if isPurnFloat(string: weight.text!){
            if let inputWeight = Double(weight.text!){
                let sumPrice = inputWeight * 1.2
                price.text = sumPrice.description
            }
        }else{
            weight.text = ""
            alert(messages: "Pleas input number!")
        }
    }
    
    // judge inputting is number
    func isPurnFloat(string: String) -> Bool {
        
        let scan: Scanner = Scanner(string: string)
        
        var val:Float = 0
        
        return scan.scanFloat(&val) && scan.isAtEnd
        
    }
}
