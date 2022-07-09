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
        choiceButtons.forEach { button in
            button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
        }
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.setNextStory(choiceNumber: sender.tag)
        updateUI()
    }

    private func updateUI() {
        storyLabel.text = storyBrain.getText()
        let choices: [Story.Choice] = storyBrain.getChoice()
        choiceButtons.enumerated().forEach { (index: Int, button: UIButton) in
            button.setTitle(choices[index].choice, for: .normal)
        }
    }
}
