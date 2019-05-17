//
//  ViewController.swift
//  Nabeatsu
//
//  Created by nagata on 2017/06/19.
//  Copyright © 2017年 Life is Tech!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var faceLabel: UILabel!
    @IBOutlet var descripLabel: UILabel!
    @IBOutlet var nowfaceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        descripLabel.text = "２以下または2の倍数でない時\n ・・・賢くなる（<(｀^´)>）\n5の倍数かつ３以上の２の倍数の時\n ・・・犬になる（U・ω・U）\n3の倍数または３がつく数字かつ5の倍数でないかつ３以上の２の倍数の時\n ・・・アホになる（ﾍ(ﾟ∀ﾟﾍ)ｱﾋｬ）\nそれ以外の時\n ・・・ノーマル（(゜o゜)）"
    }
    
    
    
    func isAho() -> Bool {
        // 問題1: 3の倍数かどうか調べる
        if number % 3 == 0 && number % 7 != 0 {
            return true
        }
        
        // 問題2: 1の位が3かどうか調べる
        if number % 10 == 3 && number % 7 != 0 {
            return true
        }
        
        // 問題3: 10の位が3かどうか調べる
        if number / 10 % 10 == 3 && number % 7 != 0 {
            return true
        }

        // 問題4: 3がつくかどうか調べる
        var checkNum: Int = number
        while (checkNum >= 10) {
            if checkNum % 10 == 3 && number % 7 != 0 {
                return true
            }
            else{
                checkNum /= 10
            }
        }
        
        return false
    }
    
    func isDog() -> Bool {
        
        //５の倍数か調べる
        if number % 5 == 0 {
            return true
        }
        
        return false
    }
    
    func isSmart() -> Bool {
        if number <= 2 {
            if number == 1 {
                return false
            }
            return true
        }
        else{
            for i in 2..<number {
                if number % i == 0 {
                    return false
                }
            }
            return true
        }
    }
    
    @IBAction func plusButton(){
        number = number + 1
        countLabel.text = String(number)
        
        if isSmart() == true { //賢くなる
            faceLabel.text = "<(｀^´)>"
            nowfaceLabel.text = "賢くなる"
        }
        else if isDog() == true && isSmart() == false { //犬になる
            faceLabel.text = "U・ω・U"
            nowfaceLabel.text = "犬になる"
        }
        else if isAho() == true && isDog() == false && isSmart() == false { //アホになる
            faceLabel.text = "ﾍ(ﾟ∀ﾟﾍ)ｱﾋｬ"
            nowfaceLabel.text = "アホになる"
        }
        else { //普通
            faceLabel.text = "(゜o゜)"
            nowfaceLabel.text = "ノーマル"
        }
    }
    
    @IBAction func clear(){
        number = 0
        countLabel.text = String(number)
        faceLabel.text = "(゜o゜)"
        nowfaceLabel.text = "ノーマル"
    }
}

