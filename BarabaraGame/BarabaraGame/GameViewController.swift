//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by 森大樹 on 2019/04/12.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer!
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]
    var dx: [CGFloat] = [1.0, 0.5, -1.0]
    
    func start() {
        resultLabel.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        timer.fire()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2.0, width/2.0, width/2.0]
        self.start()

        // Do any additional setup after loading the view.
    }
    
    @objc func up() {
        for i in 0..<3 {
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i]
        }
        imageView1.center.x = positionX[0]
        imageView2.center.x = positionX[1]
        imageView3.center.x = positionX[2]
    }
    
    @IBAction func stop() {
        if timer.isValid == true {
            timer.invalidate()
        }
        let highScoer1: Int = defaults.integer(forKey: "Score1")
        let highScoer2: Int = defaults.integer(forKey: "Score2")
        let highScoer3: Int = defaults.integer(forKey: "Score3")
        
        if score > highScoer1 {
            defaults.set(score, forKey: "score1")
            defaults.set(highScoer1, forKey: "score2")
            defaults.set(highScoer2, forKey: "score3")
        }
        else if score > highScoer2 {
            defaults.set(score, forKey: "score2")
            defaults.set(highScoer2, forKey: "score3")
        }
        else if score > highScoer3 {
            defaults.set(score, forKey: "score3")
        }
    }
    
    @IBAction func retry() {
        score = 1000
        positionX = [width/2, width/2, width/2]
        if timer.isValid == false {
            self.start()
        }
    }
    
    @IBAction func toTop() {
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
