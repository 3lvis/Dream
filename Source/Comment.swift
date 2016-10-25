import Foundation

struct Comment {
    var id: String?
    var createdAt: Date = Date()
    var text: String?
    var post: Post?

    static func dataSource(_ predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> DREAMDataSource {
        return DREAMDataSource()
    }

    static func sync(_ post: Post, completion: (_ error: NSError?) -> ()) {

    }

    static func fetch(_ predicate: NSPredicate) -> [Comment] {
        return [Comment()]
    }

    func create(_ completion: (_ createdComment: Comment, _ error: NSError?) -> ()) {

    }

    func update(_ completion: (_ updatedComment: Comment, _ error: NSError?) -> ()) {

    }

    func delete(_ completion: (_ error: NSError?) -> ()) {
        
    }
}
