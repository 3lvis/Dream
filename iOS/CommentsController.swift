import UIKit

class CommentsController: UITableViewController {
    func list() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let searchPredicate = NSPredicate(format: "id = \(searchID)")
        guard let post = Post.fetch(searchPredicate).first else { fatalError("Post not found") }

        let predicate = NSPredicate(format: "post = \(post)")
        let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
        let dataSource = Comment.dataSource(predicate, sortDescriptors: [sortDescriptor])
        tableView.dataSource = dataSource
    }

    func sync() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let searchPredicate = NSPredicate(format: "id = \(searchID)")
        guard let post = Post.fetch(searchPredicate).first else { fatalError("Post not found") }

        Comment.sync(post) { error in
            // handle error
        }
    }

    func create() {
        var comment = Comment()
        comment.text = "This is nice"
        comment.create { createdComment, error in
            // handle error
        }
    }

    func update() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let predicate = NSPredicate(format: "id = \(searchID)")
        guard var comment = Comment.fetch(predicate).first else { fatalError("Comment not found") }
        comment.text = "This is really nice"
        comment.update { updatedComment, error in
            // handle error
        }
    }

    func delete() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let predicate = NSPredicate(format: "id = \(searchID)")
        guard let comment = Comment.fetch(predicate).first else { fatalError("Comment not found") }
        comment.delete { error in
            // handle error
        }
    }
}