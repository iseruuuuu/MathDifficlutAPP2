//
//  ViewController.swift
//  MathDifficlutAPP2
//
//  Created by 井関竜太郎 on 2021/02/15.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var timeDownLabel: UILabel!
    
    
    var answer = 0
    var point = 0
    var time = 60
    var timer:Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンを押して話した時。。。
        button1.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        //ボタンを押して話した時。。。
        button2.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        //ボタンを押して話した時。。。
        button3.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        //ボタンを押して話した時。。。
        button4.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        
        makeNewQuestion()
        setButtonTitle()
        timer = Timer.scheduledTimer(timeInterval: 1,target: self,selector: #selector(countTime), userInfo: nil,repeats: true)
        // timeDownLabel.isHidden = true
    }
    
    @objc func countTime() {
        time -= 1
        timeLabel.text = "残り\(time)秒"
        if time <= 0 {
            //残りが０になったら、
            timer?.invalidate()
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! resultViewController
        nextVC.point = point
    }
    
    
    
    
    
    func makeNewQuestion() {
        
        
        let num = Int.random(in: 1...10)
        
        
        if num == 10 {
            answer = 3628800
        }else if num == 9 {
            answer = 362880
        }else if num == 8 {
            answer = 40320
        }else if num == 7 {
            answer = 5040
        }else if num == 6 {
            answer = 720
        }else if num == 5 {
            answer = 120
        }else if num == 4 {
            answer = 24
        }else if num == 3 {
            answer = 6
        }else if num == 2 {
            answer = 2
        }else if num == 1 {
            answer = 1
        }
        label.text = "\(num)! = "
    }
    
    func setButtonTitle() {
        var answerList = [answer]
        while answerList.count < 4 {
            let randomAnswer = Int.random(in: 0...6000)
            if !answerList.contains(randomAnswer) {
                answerList.append(randomAnswer)
            }
        }
        answerList.shuffle()
        button1.setTitle(String(answerList[0]), for: .normal)
        button2.setTitle(String(answerList[1]), for: .normal)
        button3.setTitle(String(answerList[2]), for: .normal)
        button4.setTitle(String(answerList[3]), for: .normal)
    }
    
    
    //一斉に表示する。。sender->押されたボタン
    @objc func onButton(_ sender:UIButton) {
        let input = Int(sender.currentTitle!)
        if input == answer {
            answerLabel.text = "前回の回答：正解"
            point += 1
            timeDownLabel.isHidden = true
            playSound(name: "maru")
        }else{
            answerLabel.text = "前回の回答：不正解"
            time -= 1
            timeDownLabel.isHidden = false
            timeDownLabel.text = "-1秒"
            playSound(name: "batu")
            
            
        }
        makeNewQuestion()
        setButtonTitle()
    }
    
    
    
    var player:AVAudioPlayer?
    
    func playSound(name:String) {
        let path = Bundle.main.bundleURL.appendingPathComponent(name+".mp3")
        do{
            player = try AVAudioPlayer(contentsOf: path,fileTypeHint: nil)
            player?.play()
        }catch{
            print("error")
        }
    }
    
    
    
}
