import UIKit

class RootController: UITableViewController {
    override func viewDidLoad() {

    }

    func list() {
        let predicate = NSPredicate(format: "createdDate > %@", NSDate())
        let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
        let dataSource = Post.dataSource(predicate, sortDescriptors: [sortDescriptor])
        tableView.dataSource = dataSource
    }

    func sync() {
        let changes = [
            ["id" : "2b6f0cc904d137be2e1730235f5664094b831186"]
        ]

        Post.sync(changes) { error in
            // handle error
        }
    }

    func create() {
        var post = Post()
        post.imageURL = NSURL(string: "/path/to/image.png")
        post.create { createdPost, error in
            // handle error
        }
    }

    func update() {
        let predicate = NSPredicate(format: "id = %@", "2b6f0cc904d137be2e1730235f5664094b831186")
        guard var post = Post.fetch(predicate).first else { fatalError("Post not found") }
        post.imageURL = NSURL(string: "/path/to/image.png")
        post.update { updatedPost, error in
            // handle error
        }
    }

    func delete() {
        let predicate = NSPredicate(format: "id = %@", "2b6f0cc904d137be2e1730235f5664094b831186")
        guard var post = Post.fetch(predicate).first else { fatalError("Post not found") }
        post.delete { error in
            // handle error
        }
    }
}