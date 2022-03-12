//
//  ViewController.swift
//  ReminderApp
//
//  Created by Nikita Evdokimov on 05.03.2022.
//

import UIKit

class CommentsViewController : UIViewController {
//    let label = UILabel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(label)
//        label.initLabel(on: view)
//        // Do any additional setup after loading the view.
//    }
//}
//
//extension UILabel {
//    func initLabel(on view: UIView) {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
//        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
//
//        self.text = "hesl"
//    }
    
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }
}

extension CommentsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        
        return cell
    }
}

extension CommentsViewController : UITableViewDelegate {}



