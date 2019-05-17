//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by 森大樹 on 2019/04/12.
//  Copyright © 2019 DaikiMori. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet var rankingLable1: UILabel!
    @IBOutlet var rankingLable2: UILabel!
    @IBOutlet var rankingLable3: UILabel!
    
    let defaluts: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rankingLable1.text = String(defaluts.integer(forKey: "score1"))
        rankingLable2.text = String(defaluts.integer(forKey: "score2"))
        rankingLable3.text = String(defaluts.integer(forKey: "score3"))
        // Do any additional setup after loading the view.
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
