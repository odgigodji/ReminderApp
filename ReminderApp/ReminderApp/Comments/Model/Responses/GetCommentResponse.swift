//
//  GetCommentResponse.swift
//  ReminderApp
//
//  Created by Nikita Evdokimov on 12.03.2022.
//

import Foundation

struct GetCommentResponse {
    //MARK: -typealias
    typealias JSON = [String: AnyObject]
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else {
            throw NetworkError.failInternetError
        }
        
        var comments = [Comment]()
        for dictionary in array{
            guard let comment = Comment(dict: dictionary)   else { continue }
            comments.append(comment)
        }
        self.comments = comments
    }
}
