//
//  CommentNetworkServiceCreae.swift
//  ReminderApp
//
//  Created by Nikita Evdokimov on 12.03.2022.
//

import Foundation

class CommentNetworkService {
    private init() {}
    static func getComments(completion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return
        }
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
