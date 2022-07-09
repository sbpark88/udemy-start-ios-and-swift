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
        Story(text: """
                    당신의 차는 휴대전화 수신이 되지 않는 구불구불한 길 한가운데에서 타이어를 날렸습니다. \
                    히치하이킹을 하기로 합니다. 녹슨 픽업트럭이 당신 옆에 멈춥니다. \
                    영혼 없는 눈을 가진 챙이 넓은 모자를 쓴 남자가 당신을 위해 조수석 문을 열고 묻습니다. \"탈래요?\"
                    """,
                choices: [Story.Choice("네 탈게요. 도와주셔서 감사합니다.", 2),
                          Story.Choice("그가 살인자인지 먼저 물어보는 것이 좋습니다.", 1)]
        ),
        Story(text: """
                    그는 질문에 당황하지 않고 천천히 고개를 끄덕였다.
                    """,
                choices: [Story.Choice("적어도 그는 정직합니다. 차에 탑니다.", 2),
                          Story.Choice("잠깐, 나는 타이어를 바꿀 줄 알아요.", 3)]
        ),
        Story(text: """
                    운전을 시작하자 낯선 사람은 자신과 어머니의 관계에 관해 이야기하기 시작합니다. 그는 이야기할수록 점점 더 화를 냅니다. \
                    그는 당신에게 글로브 박스를 열어달라고 요청합니다. 안에는 피 묻은 칼, 잘린 두 손가락, Elton John의 카세트테이프가 있습니다. \
                    그는 글로브 박스에 손을 뻗습니다.
                    """,
                choices: [Story.Choice("나는 엘튼 존을 좋아합니다! 그에게 카세트테이프를 건네주세요.", 5),
                          Story.Choice("그 사람 또는 내가 죽습니다! 칼을 들고 그를 찌릅니다.", 4)]
        ),
        Story(text: """
                    뭐? 경찰 같으니라고! \
                    당신은 교통사고가 성인의 사고 사망의 두 번째 원인이라는 것을 알고 있습니까?
                    """,
                choices: [Story.Choice("The", 0),
                          Story.Choice("End", 0)]
        ),
        Story(text: """
                    가드레일을 부수고 아래 들쭉날쭉한 바위를 향해 돌진하는 순간, 자신이 타고 있는 차를 운전하던 누군가를 찌르고 있다는 불편한 진실을 깨닫는다.
                    """,
                choices: [Story.Choice("The", 0),
                          Story.Choice("End", 0)]
        ),
        Story(text: """
                    당신은 '오늘 밤 사랑을 느낄 수 있나요'의 구절을 읊으면서 살인자와 유대감을 갔습니다. 그는 다음 마을에 당신을 내려줍니다. \
                    당신이 가기 전에 시체를 버릴 만한 좋은 곳을 아느냐고 물었고 당신은 '부두를 이용해 보세요.'라고 대답합니다.
                    """,
                choices: [Story.Choice("The", 0),
                          Story.Choice("End", 0)]
        )
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
