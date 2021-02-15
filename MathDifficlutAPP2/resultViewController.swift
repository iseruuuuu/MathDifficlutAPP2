//
//  resultViewController.swift
//  MathDifficlutAPP2
//
//  Created by 井関竜太郎 on 2021/02/15.
//

import UIKit

class resultViewController: UIViewController {
    
    
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var recordText: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    
    
    var point = 0
    var rank = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordText.text = "あなたの得点は\(point)点"
        UserDefaults.standard.register(defaults: ["record":0])
        let highScire = UserDefaults.standard.integer(forKey: "record")
        
        if highScire < point {
            UserDefaults.standard.setValue(point, forKey: "record")
            UserDefaults.standard.setValue(rank, forKey: "record2")
            highScore.text = "ハイスコア：\(point)点"
            
            if 0...9 ~= point {
                rank = 7
                nextLabel.text = "次のランクまで\(10-point)点"
            }else if 10...19 ~= point {
                rankLabel.text = "あなたのランク: ６級"
                rank = 6
                nextLabel.text = "次のランクまで\(20-point)点"
            }else if 20...29 ~= point {
                rankLabel.text = "あなたのランク: ５級"
                rank = 5
                nextLabel.text = "次のランクまで\(30-point)点"
            }else if 30...39 ~= point {
                rankLabel.text = "あなたのランク: ４級"
                rank = 4
                nextLabel.text = "次のランクまで\(40-point)点"
            }else if 40...49 ~= point {
                rank = 3
                rankLabel.text = "あなたのランク: ３級"
                nextLabel.text = "次のランクまで\(50-point)点"
            }else if 50...55 ~= point {
                rank = 2
                rankLabel.text = "あなたのランク: ２級"
                nextLabel.text = "次のランクまで\(55-point)点"
            }else if 56...59 ~= point {
                rank = 1
                rankLabel.text = "あなたのランク: １級"
                nextLabel.text = "次のランクまで\(60-point)点"
            }else if 60 < point {
                rank = 0
                rankLabel.text = "あなたのランク: MAX級"
                nextLabel.text = "あなたはマスターです。"
                
            }
            
            
        }else{
            highScore.text = "ハイスコア：\(highScire)点"
            if 0...9 ~= highScire {
                rankLabel.text = "あなたのランク: ７級"
                rank = 7
                nextLabel.text = "次のランクまで\(10-point)点"
            }else if 10...19 ~= highScire {
                rankLabel.text = "あなたのランク: ６級"
                rank = 6
                nextLabel.text = "次のランクまで\(20-point)点"
            }else if 20...29 ~= highScire {
                rankLabel.text = "あなたのランク: ５級"
                rank = 5
                nextLabel.text = "次のランクまで\(30-point)点"
            }else if 30...39 ~= highScire {
                rankLabel.text = "あなたのランク: ４級"
                rank = 4
                nextLabel.text = "次のランクまで\(40-point)点"
            }else if 40...49 ~= highScire {
                rank = 3
                rankLabel.text = "あなたのランク: ３級"
                nextLabel.text = "次のランクまで\(50-point)点"
            }else if 50...55 ~= highScire {
                rank = 2
                rankLabel.text = "あなたのランク: ２級"
                nextLabel.text = "次のランクまで\(55-point)点"
            }else if 56...59 ~= highScire {
                rank = 1
                rankLabel.text = "あなたのランク: １級"
                nextLabel.text = "次のランクまで\(60-point)点"
            }else if 60 < highScire {
                rank = 0
                rankLabel.text = "あなたのランク: MAX級"
                nextLabel.text = "あなたはマスターです。"
                
            }
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "title", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "title" {
            let next = segue.destination as! TitleViewController
            next.hightScore = point
            next.rank = rank
            next.playing = true
        }
    }
    
    
    
}
