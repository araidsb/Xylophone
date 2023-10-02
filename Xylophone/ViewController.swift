//
//  ViewController.swift
//  Xylophone
//
//  Created by Арай Дуйсебекова on 02.10.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("\(sender.title(for: .normal)!) button was pressed")
        
        play(fileName: sender.title(for: .normal)!)
        sender.alpha = 0.5

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                sender.alpha = 1.0
            }
        
    }
    
    func play(fileName: String) {
        let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "wav")!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
            
        }catch {
            print("there was some error. The error was \(error)")
        }
        audioPlayer.play()
        
    }
    
}


