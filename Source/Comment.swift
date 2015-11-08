import Foundation

struct Comment {
    var id: String?
    var createdAt: NSDate = NSDate()
    var text: String?

    static func dataSource(predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> DREAMDataSource {
        return DREAMDataSource()
    }

    static func sync(post: Post, completion: (error: NSError?) -> ()) {

    }

    static func fetch(predicate: NSPredicate) -> [Comment] {
        return [Comment()]
    }

    func create(completion: (createdComment: Comment, error: NSError?) -> ()) {

    }

    func update(completion: (updatedComment: Comment, error: NSError?) -> ()) {

    }

    func delete(completion: (error: NSError?) -> ()) {
        
    }
}