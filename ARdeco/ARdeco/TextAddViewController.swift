//
//  TextAddViewController.swift
//  ARdeco
//
//  Created by 森大樹 on 2019/04/28.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class TextAddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textView: UITextView!
    @IBOutlet var textField: UITextField!
    
    var decoText: [String] = []
    var checknum: Int = 0
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "decoText") != nil {
            decoText = saveData.object(forKey: "decoText") as! [String]
        }
        if saveData.object(forKey: "checknum") != nil {
            checknum = saveData.integer(forKey: "checknum")
        }
        textView.text = ""
        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textView.text = textField.text
        
        textView.returnKeyType = .done
        
        //キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cansel() {
        self.performSegue(withIdentifier: "cansel", sender: nil)
    }
    
    @IBAction func done() {
        checknum = checknum + 1
        //textView.text = "Test"
        decoText.append(textField.text!)
        saveData.set(checknum, forKey: "checknum")
        saveData.set(decoText, forKey: "decoText")
        for i in 0 ..< checknum {
           print(decoText[i])
            print(checknum)
        }
        print("donebt")
        self.performSegue(withIdentifier: "done", sender: nil)
    }
}
