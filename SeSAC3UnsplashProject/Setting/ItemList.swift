//
//  SetList.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/15.
//

import UIKit

struct ItemList: Hashable {
    let firstSection = [Item(image: "이미지", title: "홍길동", detail: "AppleID, iCloud+, 미디어 및 구입 항목", mode: nil, stateTitle: nil)]
    
    let secondSection = [Item(image: "airplane", title: "에어플레인 모드", detail: nil, mode: nil, stateTitle: nil),
                        Item(image: "wifi", title: "Wi-Fi", detail: nil, mode: nil, stateTitle: "연결 안 됨"),
                        Item(image: "wave.3.right", title: "Bluetooth", detail: nil, mode: nil, stateTitle: "켬"),
                         Item(image: "antenna.radiowaves.left.and.right", title: "셀룰러", detail: nil, mode: nil, stateTitle: "끔"),
                        Item(image: "personalhotspot", title: "개인용 핫스팟", detail: nil, mode: nil, stateTitle: nil)]
    
    let thirdSection = [Item(image: "bell.badge.fill", title: "알림", detail: nil, mode: nil, stateTitle: nil),
                        Item(image: "speaker.wave.3.fill", title: "사운드 및 햅틱", detail: nil, mode: nil, stateTitle: nil),
                        Item(image: "moon.fill", title: "집중모드", detail: nil, mode: nil, stateTitle: nil),
                        Item(image: "hourglass", title: "스크린 타임", detail: nil, mode: nil, stateTitle: nil)]
    
    let fourthSection = [Item(image: "textformat.size", title: "디스플레이 및 밝기", detail: nil, mode: nil, stateTitle: nil), Item(image: "faceid", title: "Face ID 및 암호", detail: nil, mode: nil, stateTitle: nil),
                         Item(image: "sos", title: "긴급 구조 요청", detail: nil, mode: nil, stateTitle: nil),
                         Item(image: "battery.100", title: "배터리", detail: nil, mode: nil, stateTitle: nil),
                        Item(image: "hand.raised", title: "개인정보 보호 및 보안", detail: nil, mode: nil, stateTitle: nil)]
}
