//
//  ViewController.swift
//  Count3
//
//  Created by 森大樹 on 2019/04/07.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number: Int = 0
    
    @IBOutlet var label: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button1.layer.cornerRadius = 40    //角のR設定
        button2.layer.cornerRadius = 40    //角のR設定
        button3.layer.cornerRadius = 40    //角のR設定
        button4.layer.cornerRadius = 40    //角のR設定
        button5.layer.cornerRadius = 40    //角のR設定
        button6.layer.cornerRadius = 40    //角のR設定
    }
    
    
    //プラスボタンを押すとナンバーを＋1する
    @IBAction func plus() {
        number += 1
        label.text = String(number)
        colour()
    }
    
    //−１をする
    @IBAction func sub() {
        number -= 1
        label.text = String(number)
        colour()
    }
    
    //×２をする
    @IBAction func multi() {
        number *= 2
        label.text = String(number)
        colour()
    }
    
    //÷２をする
    @IBAction func div() {
        number /= 2
        label.text = String(number)
        colour()
    }
    
    //累乗
    @IBAction func pow() {
        number *= number
        label.text = String(number)
        colour()
    }
    
    //平方根
    @IBAction func sqr() {
        number = Int(sqrt(Double(number)))
        label.text = String(number)
        colour()
    }
    
    //numberを０、カラーも戻す
    @IBAction func clear() {
        number = 0
        label.text = String(number)
        colour()
    }
    
    //色を変える
    func colour(){
        if(number <= -10){
            label.textColor = UIColor.blue
        }
        else if(number >= 10){
            label.textColor = UIColor.red
        }
        else{
            label.textColor = UIColor.black
        }
    }

}

