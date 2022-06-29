//
//  PostData.swift
//  NewsPortal
//
//  Created by shy attoun on 18/05/2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post : Decodable , Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url : String?
}
