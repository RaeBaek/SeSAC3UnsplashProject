//
//  SettingList.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/17.
//

import UIKit

struct AttentionList {
    let fistList = [Content(image: "moon.fill", title: "방해 금지 모드", color: UIColor(red: 178/255, green: 96/255, blue: 234/255, alpha: 1), state: "켬"),
                    Content(image: "bed.double.fill", title: "수면", color: UIColor(red: 240/255, green: 151/255, blue: 55/255, alpha: 1), state: nil),
                    Content(image: "iphone", title: "업무", color: UIColor(red: 104/255, green: 206/255, blue: 103/255, alpha: 1), state: "09:00 ~ 18:00"),
                    Content(image: "person.fill", title: "개인 시간", color: UIColor(red: 59/255, green: 130/255, blue: 247/255, alpha: 1), state: "설정")]
    
    let secondList = [Content(image: nil, title: "모든 기기에서 공유", color: nil, state: nil)]
    
}

struct SettingList {
    let allSet = [Setting(title: "공지사항"),
                  Setting(title: "실험실"),
                  Setting(title: "버전 첨부")]
    
    let personalSet = [Setting(title: "개인/보안"),
                  Setting(title: "알림"),
                       Setting(title: "채팅"),
                  Setting(title: "멀티프로필")]
    
    let etc = [Setting(title: "고객센터/도움말")]
}
