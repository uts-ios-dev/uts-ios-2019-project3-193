//  OrderDateView.swift
//  ass3
//
//  Created by Xue Zhang on 25/5/19.
//  Copyright © 2019 Xue Zhang. All rights reserved.
//

import UIKit

class OrderDateView: UIViewController {
    
    // MARK:Properties
    @IBOutlet weak var fromAddress: UITextField!
    @IBOutlet weak var toAdddress: UITextField!
    @IBOutlet weak var size: UITextField!
    @IBOutlet weak var orderDate: UIDatePicker!
    //show date
    @IBOutlet weak var datePick: UITextField!
    
    private var dateStr: String! //record datepick value
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // get current date when view load
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd"
        datePick.text = timeFormatter.string(from: date as Date) as String
        
        // add event to orderdate controller when value changed
        orderDate.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    @IBAction func submit(_ sender: UIButton) {
        // checking from address has been input
        if fromAddress.text!.count > 0 {
            // checking to address has been input
            if toAdddress.text!.count > 0{
                // checking size only input number type
                if isPurnFloat(string: size.text!){
                    // checking size input number larger than 0
                    if (size.text! as NSString).floatValue > 0 {
                        // checking datepick is not null
                        if datePick.text!.count > 0{
                            //save detail to userdefaults
                            let array:Array = [fromAddress.text!,toAdddress.text!,size.text!,datePick.text!]
                            UserDefaults.standard.set(array, forKey: "orderInformation")
                            
                            // jump to customer and payment information veiew
                            self.performSegue(withIdentifier: "toCAPI", sender: nil)
                        }else{
                            alert(messages: "Please choose date")
                        }
                    }else{
                        alert(messages: "Please input number larger than 0")
                    }
                }else{
                    alert(messages: "Please input number")
                }
            }else{
                alert(messages: "To address can not be empty")
            }
        }else{
            alert(messages: "From address can not be empty")
        }
    }
    
    // date change event
    // when datepick's value has been changed,then the date shows will be changed
    @objc func dateChanged() {
        
        //update date show label
        let dateFormatter = DateFormatter()
        // set date format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //change date show
        datePick.text = dateFormatter.string(from: orderDate.date)
        
    }
    
    
    func alert(messages: String){
        let alertController = UIAlertController(title: "Error", message: messages,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // verify inputting is number
    func isPurnFloat(string: String) -> Bool {
        
        let scan: Scanner = Scanner(string: string)
        
        var val:Float = 0
        
        return scan.scanFloat(&val) && scan.isAtEnd
        
    }


}

