//
//  RewindQnaRequestDTO.swift
//  Data
//
//  Created by 김도경 on 5/24/24.
//  Copyright © 2024 withyou.org. All rights reserved.
//

import Foundation

struct RewindQnaRequestDTO : Encodable {
    var questionId : Int
    var answer : String
}