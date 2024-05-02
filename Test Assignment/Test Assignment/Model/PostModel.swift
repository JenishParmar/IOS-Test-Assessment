//
//  PostModel.swift
//  Test Assignment
//
//  Created by Jenish's MacBook on 02/05/24.
//

import Foundation


//MARK: PostDetail Model
struct PostModel: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
