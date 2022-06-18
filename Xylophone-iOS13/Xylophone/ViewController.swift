//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // IBAction: Interface Builder Action
    @IBAction func pressKey(_ sender: UIButton) {
        // Different ways to get the title of the UIButton.
        /*
        print("sender.currentTitle ?? \"\" -> \(sender.currentTitle ?? "")")
        print("sender.titleLabel?.text ?? \"\" -> \(sender.titleLabel?.text ?? "")")
        print("sender.title(for: .normal) ?? \"\" -> \(sender.title(for: .normal) ?? "")")
         */

        // the left of the colon, code is the parameter
        // the right of the colon, sender.currentTitle is the argument
        // parameters is the name of the function
        playSound(code: sender.currentTitle!)
        setButtonOpacity(button: sender, opacity: 0.5)
        setTimer(button: sender)
    }

    // code is the name of a parameter, String is the data type of a parameter
    private func playSound(code: String) {
        guard let url = Bundle.main.url(forResource: code, withExtension: "wav") else {
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else {
                return
            }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    private func setButtonOpacity(button: UIButton, opacity: Double) -> Void {
        button.alpha = opacity
    }

    private func setTimer(button: UIButton) -> Void {
        print("Start")
        let timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { _ in print("End"); button.alpha = 1 })

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            print("End")
//            button.alpha = 1
        }

    }

}

