//
//  PosModel.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/05.
//

import Foundation
import CoreGraphics
import SwiftUI


struct PosTree : Identifiable, Hashable {
    
    // 포스빌의 특정 나무.
    let isSpecial: Bool
    let info: String // 스스로 어떤정보인지 알 수 있도록
    let species: String //종 이름 -> 나중에 찾을 수 있도록
    let coolPOV: String //감상포인트
    let locationDetail: String
    let img: String
    var id: UUID

    init( isSpecial: Bool, info: String, species: String, coolPOV: String, locationDetail: String, img: String){
        self.isSpecial = isSpecial
        self.info = info
        self.species = species
        self.coolPOV = coolPOV
        self.locationDetail = locationDetail
        self.img = img
        self.id = UUID.init()
    }
}

struct PosLocation {
    let tallTrees : [PosTree] // 스스로 어떤정보인지 알 수 있도록
    let smallTrees : [PosTree] // 스스로 어떤정보인지 알 수 있도록
    let grasses : [PosTree] // 초본
    let coord : CGPoint

//    외않뒈
//    func specialTreeList(){
//        var specialList : [PosTree]
//
//        ForEach(self.tallTrees){ tree in
//            if( tree.isSpecial) {
//                specialList.append(tree)
//            }
//        }
//    }
    
}
let defaultTree: PosTree = PosTree(isSpecial: true, info: "메모용 정보", species: "식물을 선택해주세요.", coolPOV: "송쿨 관점에서 경관에 대한 평가, 감상을 들려드립니다.", locationDetail: "디테일한 위치설명.", img: "treeSample")

let spotList  = [
    "동문 맞은편 오솔길" :
        PosLocation(
            tallTrees: [PosTree(isSpecial: true, info: "보호수", species: "소나무", coolPOV: "몇백년이 되었을까 궁금하게한다.", locationDetail: "숲쪽을 바라보면 울타리 안", img: "treeSample"),
                        PosTree(isSpecial: true, info: " ", species: "메타세콰이어", coolPOV: "메타세콰이어를 멀리서보면 뾰족한 창 속으로 들어가는 느낌이 난다. 높고 뾰족한 그 나무는 주변의 낮은 나무들과 조화하면서 율동감을 준다. 더 높은곳을 향하지만 경쾌해지는 발걸음에는 이들이 우리를 마중나와있기 때문일지도 모르겠다.", locationDetail: "오솔길을 따라 자라고있다.", img: "treeSample"),
                        PosTree(isSpecial: true, info: " ", species: "은행나무", coolPOV: "이곳의 은행나무는 꽤나 큰편입니다. 다른곳보다 훨씬요. 그래서 가을이 기다려지게하는 나무입니다. 기다려보지요.", locationDetail: "오솔길을 따라가면 나옵니다.", img: "treeSample")
        ],
            smallTrees: [PosTree(isSpecial: false, info: " ", species: "a ", coolPOV: " ", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),
                         PosTree(isSpecial: false, info: " ", species: "b ", coolPOV: " ", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")
                        ],
            grasses: [PosTree(isSpecial: true, info: " ", species: "제비꽃", coolPOV: "앞만, 하늘만 바라보고 가다가 잠시멈춰 아래를 바라보자. 작고 귀여운 보라색 꽃들이 봐주길 기다리고있다.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")],
            coord: CGPoint(x: 10, y: 10))
    ,
    "동문 맞은편" :
        PosLocation(
            tallTrees: [PosTree(isSpecial: true, info: "뭐있지?", species: "소나무", coolPOV: "몇백년이 되었을까 궁금하게한다.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),
                        PosTree(isSpecial: true, info: " ", species: "메타세콰이어", coolPOV: "메타세콰이어를 멀리서보면 뾰족한 창 속으로 들어가는 느낌이 난다. 높고 뾰족한 그 나무는 주변의 낮은 나무들과 조화하면서 율동감을 준다. 더 높은곳을 향하지만 경쾌해지는 발걸음에는 이들이 우리를 마중나와있기 때문일지도 모르겠다.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")
        ],
            smallTrees: [PosTree(isSpecial: false, info: " ", species: "장미", coolPOV: " ", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),
                         PosTree(isSpecial: false, info: " ", species: "b ", coolPOV: " ", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")
                        ],
            grasses: [PosTree(isSpecial: true, info: " ", species: "제비꽃", coolPOV: "깜찍하다", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),],
            coord: CGPoint(x: 100, y: 10))
    ,
    "도서관 맞은편" :
        PosLocation(
            tallTrees: [PosTree(isSpecial: true, info: "보호수", species: "소나무", coolPOV: "몇백년이 되었을까 궁금하게한다.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),
                        PosTree(isSpecial: true, info: " ", species: "메타세콰이어", coolPOV: "메타세콰이어를 멀리서보면 뾰족한 창 속으로 들어가는 느낌이 난다. 높고 뾰족한 그 나무는 주변의 낮은 나무들과 조화하면서 율동감을 준다. 더 높은곳을 향하지만 경쾌해지는 발걸음에는 이들이 우리를 마중나와있기 때문일지도 모르겠다.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),
                        PosTree(isSpecial: true, info: " ", species: "은행나무", coolPOV: "이곳의 은행나무는 꽤나 큰편입니다. 다른곳보다 훨씬요. 그래서 가을이 기다려지게하는 나무입니다. 기다려보지요.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")
        ],
            smallTrees: [PosTree(isSpecial: false, info: " ", species: "a ", coolPOV: " ", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample"),
                         PosTree(isSpecial: false, info: " ", species: "b ", coolPOV: " ", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")
                        ],
            grasses: [PosTree(isSpecial: true, info: " ", species: "제비꽃", coolPOV: "앞만, 하늘만 바라보고 가다가 잠시멈춰 아래를 바라보자. 작고 귀여운 보라색 꽃들이 봐주길 기다리고있다.", locationDetail: "숲쪽을 바라보면 울타리 안에 있다.", img: "treeSample")],
            coord: CGPoint(x: 10, y: 10))
    ,
]

// TODO: 디코더블 인코더블 해셔블 찾아보기
struct PosTrail: Hashable {
    let name: String //트레일 이름
    let info: String //트레일 정보
    let distance: Float //트레일 정보
    let spotList: [String] // 로케이션값들
    let treeList: String // 로케이션값들
//  graphicInfo는 스팟리스트에 있는걸로 충분한가?
    init( name: String, info: String, distance: Float, spotList: [String], treeList: String){
        self.name = name
        self.info = info
        self.distance = distance
        self.spotList = spotList
        self.treeList = treeList
    }
}


let trailList: [PosTrail] = [
    PosTrail(name: "밥 먹으러 가는 길에는", info: "매일 걷는 길, 그 주변에는 어떤 식물이 살고있을까?", distance: 0.4, spotList: ["동문 맞은편 오솔길","동문 맞은편", "도서관 맞은편"],treeList: "이팝나무 아카시나무 자작나무 가이츠카 향나무..."),
    PosTrail(name: "흰 꽃을 따라", info: "이팝나무가 꽃이피고 있어요. 이팝나무만 따라걸어도 멋진 산책길이 나오지요.", distance: 2.1, spotList: ["도서관 맞은편",],treeList: "이팝나무 아카시나무 자작나무 가이츠카 향나무..."),
    PosTrail(name: "다음 코스는 뭐가 있을까?", info: "어떤 식물이 살고있을까요? 어떤 식물을 보고싶나요?", distance: 1.1, spotList: ["동문 맞은편 오솔길",],treeList: "이팝나무 아카시나무")
]
