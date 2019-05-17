//
//  ViewController.swift
//  Calculator
//
//  Created by 森大樹 on 2018/05/27.
//  Copyright © 2018年 森大樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num1: Int = 0
    var num2: Int = 0
    var num3: Int = 0
    var op: Int = 0
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zero() {
        num2 = num2 * 10
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func one() {
        num2 = num2 * 10 + 1
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func two() {
        num2 = num2 * 10 + 2
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func three() {
        num2 = num2 * 10 + 3
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func four() {
        num2 = num2 * 10 + 4
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func five() {
        num2 = num2 * 10 + 5
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func six() {
        num2 = num2 * 10 + 6
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func seven() {
        num2 = num2 * 10 + 7
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func eight() {
        num2 = num2 * 10 + 8
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func nine() {
        num2 = num2 * 10 + 9
        label.text = String(num2)
        switch op {
            case 1: num3 = num1 + num2
            case 2: num3 = num1 - num2
            case 3: num3 = num1 * num2
            case 4: num3 = num1 / num2
            default: break
        }
    }
    
    @IBAction func add() {
        if(op == 0){
            num1 = num2
        }
        else {
            num1 = num3
        }
        label.text = String(num1)
        num2 = 0
        op = 1
    }
    
    @IBAction func sub() {
        if(op == 0){
            num1 = num2
        }
        else {
            num1 = num3
        }
        label.text = String(num1)
        num2 = 0
        op = 2
    }
    
    @IBAction func multi() {
        if(op == 0){
            num1 = num2
        }
        else {
            num1 = num3
        }
        label.text = String(num1)
        num2 = 0
        op = 3
    }
    
    @IBAction func div() {
        if(op == 0){
            num1 = num2
        }
        else {
            num1 = num3
        }
        label.text = String(num1)
        num2 = 0
        op = 4
    }
    
    @IBAction func AllC() {
        num1 = 0
        num2 = 0
        num3 = 0
        op = 0
        label.text = String(num3)
    }
    
    @IBAction func Clear() {
        num2 = 0
        label.text = String(num2)
    }
    
    @IBAction func equal() {
        switch op {
        case 1: num3 = num1 + num2
        case 2: num3 = num1 - num2
        case 3: num3 = num1 * num2
        case 4: num3 = num1 / num2
        default: break
        }
        label.text = String(num3)
    }

}

