//
//  ViewController.swift
//  ARdeco
//
//  Created by 森大樹 on 2019/04/24.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func camera() {
        UserDefaults.standard.removeObject(forKey: "checknum")
        UserDefaults.standard.removeObject(forKey: "decoText")
        print("camerabt")
        self.performSegue(withIdentifier: "camera", sender: nil)
    }
}

