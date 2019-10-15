//
//  SecondViewController.swift
//  todo
//
//  Created by mohamed haggag on 8/3/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var addtodoTF: UITextField!
    @IBOutlet weak var addBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addtodoTF.delegate=self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func addpressed(_ sender: Any) {
        
       let itemobject = UserDefaults.standard.object(forKey: "taskarr")
    var taskarr :[String]
        
       if let  tasks = itemobject as? [String]{
            taskarr = tasks

            taskarr.append(addtodoTF.text!)
        
            
        }
        else
        {
            taskarr = [addtodoTF.text] as! [String]
        }
        UserDefaults.standard.set(taskarr, forKey: "taskarr")
        print (taskarr)
        addtodoTF.text = ""
        
        
    }
    
    
}

