import Foundation

struct Post {
    var id: String?
    var createdAt: NSDate = NSDate()
    var likesCount: Int = 0
    var imageURL: NSURL?

    static func dataSource(predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> DREAMDataSource {
        return DREAMDataSource()
    }

    static func sync(completion: (error: NSError?) -> ()) {
        
    }

    static func fetch(predicate: NSPredicate) -> [Post] {
        return [Post()]
    }

    func create(completion: (createdPost: Post, error: NSError?) -> ()) {
        
    }

    func update(completion: (updatedPost: Post, error: NSError?) -> ()) {

    }

    func delete(completion: (error: NSError?) -> ()) {
        
    }
}