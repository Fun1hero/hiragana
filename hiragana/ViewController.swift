//
//  ViewController.swift
//  hiragana
//
//  Created by Admin on 2/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//
// JP - 20

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    let pickerDataLanguages = AVSpeechSynthesisVoice.speechVoices()
    let synthesizer = AVSpeechSynthesizer()
    
    var order = ""
    var jpSymb = ""
    var indx = 0
    let hiraganaSequence = ["a","i","u","e","o","ka","ki","ku","ke","ko","sa","shi","su","se","so","ta","chi","tsu","te","to","na","hi","fu","he","ho","ma","mi","mu","me","mo","ya","yu","yo","ra","ri","ru","re","ro","wa","wo","n"]
    let hiraganaSequenceToRead = ["あ","い","う","え","お","か","き","く","け","こ","さ","し","す","せ","そ","た","ち","つ","て","と","な","ひ","ふ","へ","ほ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
    
    @IBOutlet weak var singleHieroglyph: UIImageView!
    @IBOutlet weak var pairToHieroglyph: UILabel!
    @IBOutlet weak var showAnswer: UISwitch!
    @IBOutlet weak var orderSet: UISwitch!
    @IBOutlet weak var spellOnOff: UISwitch!
    @IBAction func fromBegining(_ sender: Any) {
        indx = 0
        orderSet.isOn = false
    }
    @IBAction func showAnswerAction(_ sender: Any) {
        if showAnswer.isOn
        {
            if order != ""
            {
                pairToHieroglyph.text = "\(order) (\(jpSymb))"
            }
        }
        else
        {
            pairToHieroglyph.text = ""
        }
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        mainStuff()
        if showAnswer.isOn
        {
            pairToHieroglyph.text = "\(order) (\(jpSymb))"//order + " " jpSymb
        }
        else
        {
            pairToHieroglyph.text = ""
        }
        if spellOnOff.isOn
        {
            speak(textToSpeack: jpSymb)
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    func speak(textToSpeack: String) {
        let utterance = AVSpeechUtterance(string: textToSpeack)
        utterance.volume = 1.0
        utterance.rate = 0.25
        //print(pickerDataLanguages[20].language)
        utterance.voice = pickerDataLanguages[20]
        synthesizer.speak(utterance)
    }
    
    func mainStuff()
    {
        if !orderSet.isOn
        {
            if indx < hiraganaSequence.count
            {
                order = hiraganaSequence[indx]
                jpSymb = hiraganaSequenceToRead[indx]
                //singleCharacter.image = UIImage(named: order)
                singleHieroglyph.loadGif(name: order)
                indx += 1
            }
            else
            {
                indx = 0
            }
        }
        else
        {
            let rnd = Int(arc4random_uniform(UInt32(hiraganaSequence.count)))
            order = hiraganaSequence[rnd]
            jpSymb = hiraganaSequenceToRead[rnd]
            singleHieroglyph.loadGif(name: order)
            //singleCharacter.image = UIImage(named: "/All hiragana/" + order)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        singleHieroglyph.isUserInteractionEnabled = true
        singleHieroglyph.addGestureRecognizer(tapGestureRecognizer)
        //print(pickerDataLanguages.count)
        //for index in 0...pickerDataLanguages.count
        //{
        //    print("\(index) \(pickerDataLanguages[index].language)")
        //}
        // Do any additional setup after loading the view, typically from a nib.
        //speak()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

