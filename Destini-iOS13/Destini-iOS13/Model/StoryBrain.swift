//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let story: [Story] = [
        Story(text: "길에 갈림길이 보입니다.", choice: ["왼쪽", "오른쪽"])
    ]
    let storyCount: Int

    var currentStory: Int = 0

    init() {
        storyCount = story.count
    }

    func getText() -> String {
        story[currentStory].text
    }

    func getChoice() -> [String] {
        story[currentStory].choice
    }
}
