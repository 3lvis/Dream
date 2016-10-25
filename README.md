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
let predicate = NSPredicate(format: "createdDate > \(Date())")
let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
let dataSource = Post.dataSource(predicate, sortDescriptors: [sortDescriptor])
tableView.dataSource = dataSource
```

### Syncing posts

```swift
Post.sync { error in
    // handle error
}
```

### Creating a post

```swift
var post = Post()
post.imageURL = URL(string: "/path/to/image.png")
post.create { createdPost, error in
    // handle error
}
```

### Updating a post

```swift
let post = Post.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")
post.imageURL = URL(string: "/path/to/image.png")
post.update { updatedPost, error in
    // handle error
}
```

### Deleting a post

```swift
let post = Post.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")
post.delete { error in
    // handle error
}
```

### Listing all the comments for a Post

```swift
let post = Post.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")

let predicate = NSPredicate(format: "post = \(post)")
let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: true)
let dataSource = Comment.dataSource(predicate, sortDescriptors: [sortDescriptor])
tableView.dataSource = dataSource
```

### Syncing comments

```swift
let post = Post.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")

Comment.sync(post) { error in
    // handle error
}
```

### Creating a comment

```swift
let post = Post.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")

var comment = Comment()
comment.text = "This is nice"
comment.post = post
comment.create { createdComment, error in
    // handle error
}
```

### Updating a comment

```swift
let comment = Comment.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")
comment.text = "This is really nice"
comment.update { updatedComment, error in
    // handle error
}
```

### Deleting a comment

```swift
let comment = Comment.fetch(id: "2b6f0cc904d137be2e1730235f5664094b831186")
comment.delete { error in
    // handle error
}
```

## Expectations

This are some of the things you expect when using Dream

### Offline support

All the items have a `localID`, when they are _synced_ they will also have a `remoteID`.

```swift
// If you create a post in offline mode, the post will
// be saved locally and published when the internet
// connection is available
var post = Post()
post.imageURL = URL(string: "/path/to/image.png")
post.create { createdPost, error in
    if let error = error {
        // handle error
    }

    let predicate = NSPredicate(format: "id = \(post.id)")
    let posts = Post.fetch(predicate)
    XCTAssertEqual(posts.count, 1)
}
```

### Only persisting an object by using `create`

```swift
var post = Post()
post.imageURL = URL(string: "/path/to/image.png")

let predicate = NSPredicate(format: "id = \(post.id)")
let posts = Post.fetch(predicate)
XCTAssertEqual(posts.count, 0)
```

### Retrieving posts

```swift
let posts = Post.fetch()
print(posts)
```

### Retrieving posts using a predicate

```swift
let searchID = "2b6f0cc904d137be2e1730235f5664094b831186"
let predicate = NSPredicate(format: "id = \(searchID)")
let posts = Post.fetch(predicate)
print(posts)
```

### Migrations

The truth lives in the cloud, hence a breaking change will do just that, break everything and start over while migrating as much as it can.
