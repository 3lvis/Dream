![Dream](https://github.com/3lvis/Dream/blob/master/Images/cover-v2.png)

[![Work in progress](https://img.shields.io/badge/status-work%20in%20progress-blue.svg)](https://github.com/3lvis/Dream)

UI and UX has always been the main differentiator between apps, persistency and networking on the other side are just boilerplate, apps are meant to be the fancy glass on front of the great structure that your backend engineers build.

When making apps I don’t want to think on those things, persistency and networking should be already a solved problem.

This is how I think it should work: you and your backend engineer agree on an structure, then you open the data modeler, create your tables, wire up their relationships, press a “Generate” button and *boom*! You are ready to start making the best app ever.

**That** is my Dream.

## Model

![model](https://github.com/3lvis/Dream/blob/master/Images/model-v8.png)

## App

![app](https://github.com/3lvis/Dream/blob/master/Images/app-v4.png)

## API

### Listing all the posts

Listing all the posts created in the last month should be this easy.

```swift
let predicate = NSPredicate(format: "createdDate > \(NSDate())")
let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
let dataSource = Post.dataSource(predicate, sortDescriptors: [sortDescriptor])
tableView.dataSource = dataSource
```

### Syncing Posts

```swift
Post.sync { error in
    // handle error
}
```

### Creating a Post

```swift
var post = Post()
post.imageURL = NSURL(string: "/path/to/image.png")
post.create { createdPost, error in
    // handle error
}
```

### Updating a Post

```swift
let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
let predicate = NSPredicate(format: "id = \(searchID)")
guard var post = Post.fetch(predicate).first else { fatalError("Post not found") }
post.imageURL = NSURL(string: "/path/to/image.png")
post.update { updatedPost, error in
    // handle error
}
```

### Deleting a Post

```swift
let predicate = NSPredicate(format: "id = %@", "2b6f0cc904d137be2e1730235f5664094b831186")
guard let post = Post.fetch(predicate).first else { fatalError("Post not found") }
post.delete { error in
    // handle error
}
```
### Listing all the comments for a Post

```objc
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"post == %@", post];
NSSortDescriptor *sortedDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdDate"
                                                                   ascending:YES];
DREAMDataSource *dataSource = [Comment dataSourceForPredicate:predicate
                                          sortedByDescriptors:@[sortedDescriptor]];
tableView.dataSource = self.dataSource;
```

### Syncing Comments

```objc
[Comment sync:^(NSError *error) {
    if (error) {
        // handle error
    }
}];
```

### Creating a Comment

```objc
[comment create:^(Comment *createdComment, NSError *error) {
    if (error) {
        // handle error
    }
}];
```

### Deleting a Comment

```objc
[comment delete:^(NSError *error) {
    if (error) {
        // handle error
    }
}];
```

## Expectations

This are some of the things you expect when using Dream

### Offline support

All the items have a `localID`, when they are _synced_ they will also have a `remoteID`.

```objc
// If you create a post in offline mode, the post will
// be saved locally and published when the internet
// connection is available
[post create:^(Post *createdPost, NSError *error) {
    if (error) {
        // handle error
    }

    // Retrieving a post should work
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"createdPost == %@", createdPost];
    NSInteger resultCount = [Post resultCountForPredicate:predicate];
    XCTAssertEqual(resultCount, 1);
}];
```

### Only persisting an object by using `create`

```objc
Post *insertedPost = [Post new];
insertedPost.remoteID = @1;
insertedPost.title = "Hello World!";

// This post hasn't been saved, so it shouldn't be persisted
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"insertedPost == %@", insertedPost];
NSInteger resultCount = [Post resultCountForPredicate:predicate];
XCTAssertEqual(resultCount, 0);
```

### Retreiving posts

```objc
NSArray *posts = [Post posts];
```

### Retreiving posts using a predicate

```objc
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"createdPost == %@", createdPost];
NSArray *posts = [Post postsForPredicate:predicate];
```

### Migrations

The truth lives in the cloud, hence a breaking change will do just that, break everything and start over while migrating as much as it can.
