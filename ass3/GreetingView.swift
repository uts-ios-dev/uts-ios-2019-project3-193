//
//  ViewController.swift
//  ass3
//
//  Created by Vicky Shi on 2019/5/20.
//  Copyright © 2019 Vicky Shi. All rights reserved.
//

import UIKit

class GreetingView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func enter(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "toLoginView", sender: nil)
        //When user enters his username, and clicks on the Start button, it will go to the timer page.
        
    }
}

