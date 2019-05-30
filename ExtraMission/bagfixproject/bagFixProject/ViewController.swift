//
//  ViewController.swift
//  bagFixProject
//
//  Created by Tomoyuki Hayakawa on 2019/05/28.
//  Copyright © 2019 Tomoyuki Hayakawa. All rights reserved.
//

//概要説明
//バグ取りをしよう！
//プラスボタンとマイナスボタンがあるシンプルなカウントアプリです．
//正常に動作するようにしましょう！

import UIKit

class ViewController: UIViewController {
    
    @IBAction var label: UILabel!
    
    var countNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func plus() {
        countNum = countNum +1
        label.text = countNum
    }
    
    @IBAction func minus() {
        countNum = countNum - 1
        label.text = countNum
    }

}

