import UIKit

class PostsController: UITableViewController {
    func list() {
        let predicate = NSPredicate(format: "createdDate > \(NSDate())")
        let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
        let dataSource = Post.dataSource(predicate, sortDescriptors: [sortDescriptor])
        tableView.dataSource = dataSource
    }

    func sync() {
        Post.sync { error in
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

    func offlineCreate() {
        // If you create a post in offline mode, the post will
        // be saved locally and published when the internet
        // connection is available
        var post = Post()
        post.imageURL = NSURL(string: "/path/to/image.png")
        post.create { createdPost, error in
            if let _ = error {
                // handle error
            }

            // let predicate = NSPredicate(format: "id = \(post.id)")
            // let posts = Post.fetch(predicate)
            // XCTAssertEqual(posts.count, 1)
        }
    }

    func onlyPersistWithCreate() {
        var post = Post()
        post.imageURL = NSURL(string: "/path/to/image.png")

        // let predicate = NSPredicate(format: "id = \(post.id)")
        // let posts = Post.fetch(predicate)
        // XCTAssertEqual(posts.count, 0)
    }

    func retreivingPosts() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let predicate = NSPredicate(format: "id = \(searchID)")
        let posts = Post.fetch(predicate)
        print(posts)
    }

    func update() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let predicate = NSPredicate(format: "id = \(searchID)")
        guard var post = Post.fetch(predicate).first else { fatalError("Post not found") }
        post.imageURL = NSURL(string: "/path/to/image.png")
        post.update { updatedPost, error in
            // handle error
        }
    }

    func delete() {
        let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
        let predicate = NSPredicate(format: "id = \(searchID)")
        guard let post = Post.fetch(predicate).first else { fatalError("Post not found") }
        post.delete { error in
            // handle error
        }
    }
}