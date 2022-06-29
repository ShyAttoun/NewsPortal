//
//  NetworkManager.swift
//  NewsPortal
//
//  Created by shy attoun on 18/05/2022.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData(){
    if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
        let session = URLSession(configuration: .default)
        let task   = session.dataTask(with: url) { (data, response, error )in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data{
                    do {
                        let results =  try decoder.decode(Results.self, from: safeData)
                        self.posts = results.hits
                    } catch {
                        print(error)
                    }
                }
                }
            }
            task.resume()
        }
    }
}
