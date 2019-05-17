//
//  ViewController.swift
//  GachTech
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
    
    @IBAction func gacha() {
        self.performSegue(withIdentifier: "result", sender: nil)
    }
}

