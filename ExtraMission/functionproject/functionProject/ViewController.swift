//
//  ViewController.swift
//  functionProject
//
//  Created by Tomoyuki Hayakawa on 2019/05/29.
//  Copyright © 2019 Tomoyuki Hayakawa. All rights reserved.
//

//概要説明
//関数の引数と戻り値わかっていますか？ちゃんと扱えますか？
//Addボタンを押すと１カウントしてラベルに表示する
//ただし
// @IBAction func plus() {
//     number = number + 1
// }
//とするのではなく関数を使い，関数に値を渡して実装してください
//例
// @IBAction func plus() {
//     関数呼び出し
//     ラベルに表示
// }

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var countNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBtn() {
        // 関数を呼び出す引数Int型戻り値Int型
    }
    
    // 加算用関数 引数 Int型 戻り値 Int型


}

