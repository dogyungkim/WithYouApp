//
//  EditRewindRequestDTO.swift
//  Data
//
//  Created by 김도경 on 5/24/24.
//  Copyright © 2024 withyou.org. All rights reserved.
//

import Foundation

struct EditRewindRequestDTO : Encodable {
    var mvpCandidateId : Int
    var mood : String
    var qnaList :[RewindQnaRequestDTO]
    var comment : String
}
