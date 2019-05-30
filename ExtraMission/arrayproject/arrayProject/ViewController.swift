//
//  ViewController.swift
//  arrayProject
//
//  Created by Tomoyuki Hayakawa on 2019/05/28.
//  Copyright © 2019 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 配列を宣言しましょう
    var array: [Int] = []
    
    // 配列に追加する変数numを宣言しましょう
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 追加するためのIBActionを書こう
    @IBAction func add() {
        // 配列に追加する
        array.append(num)
        // printでコンソールに配列の表示
        print(array)
        // numの加算
        num = num + 1
    }

}

