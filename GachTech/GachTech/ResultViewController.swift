//
//  ResultViewController.swift
//  GachTech
//
//  Created by 森大樹 on 2019/04/11.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //一番後ろの背景画像
    @IBOutlet var haikeiImageView: UIImageView!
    
    //モンスターを表示する画像
    @IBOutlet var monsterImageView: UIImageView!
    
    //モンスター画像を保存しておく配列
    var monsterArray: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //0~9の間でランダムに数字を発生させる
        let number = Int.random(in: 0 ..< 10)
        
        //モンスターの画像を10枚追加する
        monsterArray = [UIImage(named: "monster001.png")!,
                        UIImage(named: "monster002.png")!,
                        UIImage(named: "monster003.png")!,
                        UIImage(named: "monster004.png")!,
                        UIImage(named: "monster005.png")!,
                        UIImage(named: "monster006.png")!,
                        UIImage(named: "monster007.png")!,
                        UIImage(named: "monster008.png")!,
                        UIImage(named: "monster009.png")!,
                        UIImage(named: "monster010.png")!]
        
        //ランダムに選んだモンスターを表示させる
        monsterImageView.image = monsterArray[number]
        if number == 9 {
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        }
        else if number > 6 {
            haikeiImageView.image = UIImage(named: "bg_red.png")
        }
        else {
            haikeiImageView.image = UIImage(named: "bg_blue.png")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //アニメーションの中でもtransform(変形)させるキーパスを設定
        let animation = CABasicAnimation(keyPath: "transform")
        
        //アニメーションの開始時の数値
        animation.fromValue = NSNumber(value: 0)
        
        //アニメーション終了時の数値(M_PIとは角度の180度)
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        //Z軸を中心としてアニメーションにする
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        //アニメーションの速さを指定する
        animation.duration = 5
        
        //アニメーションを何回繰り返すか決める(今回の場合は無限に繰り返す)
        animation.repeatCount = Float.infinity
        
        //どのレイヤーをアニメーションさせるか指定する
        haikeiImageView.layer.add(animation, forKey: nil)
    }
    
    @IBAction func modoru() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
