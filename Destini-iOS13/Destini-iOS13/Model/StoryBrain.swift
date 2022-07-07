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
        Story(text: "길에 갈림길이 보입니다.", choices: [Story.Choice("왼쪽으로", 1), Story.Choice("오른쪽으로", 2)]),
        Story(text: "호랑이를 만났습니다.", choices: [Story.Choice("도와달라 소리치기", 0), Story.Choice("죽은 척 하기", 0)]),
        Story(text: "보물 상자를 찾았습니다.", choices: [Story.Choice("열어보기", 0), Story.Choice("함정 확인하기", 0)])
    ]

    let storyCount: Int

    var currentStory: Int = 0

    init() {
        storyCount = story.count
    }

    func getText() -> String {
        story[currentStory].text
    }

    func getChoice() -> [Story.Choice] {
        story[currentStory].choices
    }

    mutating func setNextStory(choiceNumber: Int) {
        currentStory = story[currentStory].choices[choiceNumber].goTo
    }
}
