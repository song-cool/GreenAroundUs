//
//  treeModel.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/05.
//

import Foundation
var treebook = [
    "졸참나무" : TreeSpecies(
        name: "졸참나무",
        scientificName: "Quercus serrata",
        detail: "이름",
        link: "https://ko.wikipedia.org/wiki/%EC%A1%B8%EC%B0%B8%EB%82%98%EB%AC%B4",
        seasonal: "계절적 특징은 이런저런게 있지",
        seasonalDetail: ["이미지 유알엘","잎과 열매"],
        story: "한국 전역에 널리 분포하는데, 주로 양지쪽의 산기슭이나 산중턱에서 자란다. 잎은 달걀을 거꾸로 세워 놓은 모양의 긴 타원형이며 잎 뒤에는 털이 나 있다. 참나무 종류 중에서 잎이 가장 작다. 5~6월경에 수꽃 이삭이 꼬리 모양으로 길게 늘어지며, 암꽃 이삭은 짧고 1~2개가 새로 나온 가지의 위쪽 잎겨드랑이에 달린다. 열매는 견과로서 원기둥 모양의 긴 타원형이며, 깍정이는 접시 모양이고 겉면에 작은 비늘조각이 빽빽하게 붙어 있다."
    ),
    "소나무" : TreeSpecies(
        name: "소나무",
        scientificName: "학명",
        detail: "간단한 설명을 준비중입니다",
        link: "https//www.naver.com",
        seasonal: "계절적 특이점",
        seasonalDetail: ["이름"],
        story: "이야기를 수집하는 중입니다. 가볍게 읽어보면 좋아요!"
    ),
    "은행나무" : TreeSpecies(
        name: "은행나무",
        scientificName: "Ginko Biloba",
        detail: "겉씨식물에 속하는 낙엽성 교목으로 정원이나 가로수로 심긴다. 줄기는 곧고 가지는 위쪽을 향하여 비스듬이 자라 높이가 20~35 m 정도에 달한다. 부채 모양의 잎은 가을에 노랗게 단풍이 든다. 다양한 질병과 곤충에 저항성이 커서 오래 산다. 은행나무는 양지바르고 물이 잘 빠지는 곳에서 잘 자란다.",
        link: "https//www.naver.com",
        seasonal: "은행나무는 노란 단풍이 매력적입니다. 물든 잎이 떨어지는걸 보면 가을이 왔구나 알 수 있습니다.",
        seasonalDetail: ["이름"],
        story: "은행나무는 신생대 에오세 시대에 번성했던 식물로 2억7천만 년 전의 화석으로 발견된다. 은행나무문에서 유일하게 현존하는 식물이다. 우리나라에서 가장 오래된 은행나무는 용문사에 있는데 수령이 1,100~1,500년으로 추정된다. 높이는 42 m이며, 줄기 아래 부분의 둘레 길이는 약 15 m에 달한다."
    ),
    "나무이름" : TreeSpecies(
        name: "나무이름",
        scientificName: "학명",
        detail: "간단한 설명을 준비중입니다",
        link: "https//www.naver.com",
        seasonal: "계절적 특이점",
        seasonalDetail: ["이름"],
        story: "이야기를 수집하는 중입니다. 가볍게 읽어보면 좋아요!"
    )
]
let defualtTreeSpecies : TreeSpecies = TreeSpecies(
    name: "나무도감에 등록되지 않았습니다.",
    scientificName: "학명",
    detail: "간단한 설명을 준비중입니다",
    link: "https//www.naver.com",
    seasonal: "특징들을 공부하고 있습니다.",
    seasonalDetail: ["이름"],
    story: "이야기를 수집하는 중입니다. 가볍게 읽어보면 좋아요!!"
)

struct TreeSpecies {

    let name : String //이름
    let scientificName : String //종
    let detail : String // 간단한 설명
    let link : String // 자세한정보 링크
    let seasonal : String //계절적 특징의 내용
    let seasonalDetail : [String] // 계절적 특징의 정보들(배열로 받아옴), 이미지와 텍스트로 구성 //이거는 또 따로 만들어야함.
    let story : String //해당 식물종 이야기
    
    init(name: String, scientificName: String, detail: String, link: String, seasonal: String, seasonalDetail: [String], story: String) {
        self.name = name
        self.scientificName = scientificName
        self.detail = detail
        self.link = link
        self.seasonal = seasonal
        self.seasonalDetail = seasonalDetail
        self.story = story
    }
}


//스토리라는 형태의 모델로 정리.
struct Story {
    //스토리 페이지라는 값을 갖음.
    let pages: [StoryPage]

    subscript(_ pageIndex: Int) -> StoryPage {
        return pages[pageIndex]
    }
}

// 스트링변수와 옵션을 위해 배열을 갖음

struct StoryPage {
    let text: String
    
    let choices: [Choice]
    
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}
//선택지는 작성될 내용과 목적지로할 아이디를 받습니다.
struct Choice {
    let text: String
    let destination: Int
}

//
//
//StoryPage( // 7
//    """
//    There is so much available to decorate with; your cake keeps getting better and better. You notice some of your neighbors are using some decorations you didn’t see on the table. What do you do?
//    """,
//    choices: [
//        Choice(text: "Pop over to your neighbor’s bench and ask where they got their toppings.", destination: 16),
//        Choice(text: "Keep working away, your cake will be great even without the specialty item.", destination: 20),
//    ]
//),
