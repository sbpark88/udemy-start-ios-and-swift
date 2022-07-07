//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet var choiceButtons: [UIButton]!

    var storyBrain: StoryBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadStory()
    }

    @IBAction func pressChoiceButton(_ sender: Any) {

    }

    private func loadStory() {
        storyLabel.text = storyBrain.getText()
        let choice = storyBrain.getChoice()
        choiceButtons.enumerated().forEach { (index: Int, button: UIButton) in
            button.setTitle(choice[index], for: .normal)
        }
    }
}
