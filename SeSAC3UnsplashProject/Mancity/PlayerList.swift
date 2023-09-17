//
//  PlayerList.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/15.
//

import Foundation

struct PlayerList {
    
    let forwards = [Player(name: "Haaland", position: "Forwards", backNumber: 9),
                    Player(name: "alvarez", position: "Forwards", backNumber: 19)]

    let midfielders = [Player(name: "De Bruyne", position: "Midfielders", backNumber: 17),
                       Player(name: "Doku", position: "Midfielders", backNumber: 11),
                       Player(name: "Foden", position: "Midfielders", backNumber: 47),
                       Player(name: "Grealish", position: "Midfielders", backNumber: 10),
                       Player(name: "Kovacic", position: "Midfielders", backNumber: 8),
                       Player(name: "Rodrigo", position: "Midfielders", backNumber: 16),
                       Player(name: "Silva", position: "Midfielders", backNumber: 20)]

    let defenders = [Player(name: "Ake", position: "Defenders", backNumber: 6),
                     Player(name: "Dias", position: "Defenders", backNumber: 3),
                     Player(name: "Fvardiol", position: "Defenders", backNumber: 24),
                     Player(name: "Stones", position: "Defenders", backNumber: 5),
                     Player(name: "Walker", position: "Defenders", backNumber: 2)]

    let goalkeepers = [Player(name: "Carson", position: "Goalkeepers", backNumber: 33),
                       Player(name: "Ederson", position: "Goalkeepers", backNumber: 31),
                       Player(name: "Ortega", position: "Goalkeepers", backNumber: 18)]

}

