import Foundation

struct Post {
    var id: String?
    var createdAt: Date = Date()
    var likesCount: Int = 0
    var imageURL: URL?
    var comments = [Comment]()

    static func dataSource(_ predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> DREAMDataSource {
        return DREAMDataSource()
    }

    static func sync(_ completion: (_ error: NSError?) -> ()) {
        
    }

    static func fetch(_ predicate: NSPredicate? = nil) -> [Post] {
        return [Post()]
    }

    func create(_ completion: (_ createdPost: Post, _ error: NSError?) -> ()) {
        
    }

    func update(_ completion: (_ updatedPost: Post, _ error: NSError?) -> ()) {

    }

    func delete(_ completion: (_ error: NSError?) -> ()) {
        
    }
}
