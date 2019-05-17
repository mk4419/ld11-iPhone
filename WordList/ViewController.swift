//
//  ViewController.swift
//  WordList
//
//  Created by 森大樹 on 2019/04/11.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func back(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func startButtonTapped() {
        let saveData = UserDefaults.standard
        
        if let wordArray = saveData.array(forKey: "WORD") {
            if wordArray.count > 0 {
                self.performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        }
        
        let alert: UIAlertController = UIAlertController (
            title: "単語",
            message: "まずは「単語一覧」をタップして単語登録してください。",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction (
            title: "OK",
            style: .default,
            handler: nil
        ))
        
        self.present(alert, animated: true, completion: nil)
    }

}

