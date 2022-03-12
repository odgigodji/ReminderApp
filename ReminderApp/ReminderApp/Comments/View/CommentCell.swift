//
//  CommentCell.swift
//  ReminderApp
//
//  Created by Nikita Evdokimov on 11.03.2022.
//

import Foundation
import UIKit

class CommentCell : UITableViewCell {
    
    @IBOutlet weak var  label: UILabel!
    @IBOutlet weak var  textView: UITextView!
    
    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
