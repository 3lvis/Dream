![Dream](https://github.com/NSElvis/Dream/blob/master/Images/cover-v1.png)

[![Work in progress](https://img.shields.io/badge/status-work%20in%20progress-blue.svg)](https://github.com/NSElvis/Dream)

UI and UX has always been the main differentiator between apps, persistency and networking on the other side are just boilerplate, apps are meant to be the fancy glass on front of the great structure that your backend engineers build.

When making apps I don’t want to think on those things, persistency and networking should be already a solved problem.

This is how I think it should work.

You and your backend engineer agree on an structure, then you open the data modeler, create your tables, wire up their relationships, press a “Generate” button and BOOM! You are ready to start making the best app ever.

That is my Dream.

## Model

![model](https://github.com/NSElvis/Dream/blob/master/Images/model-v7.png)

## App

![app](https://github.com/NSElvis/Dream/blob/master/Images/app-v3.png)

## API

### Syncing Posts

```objc
[Post sync:^(NSError *error) {
    if (error) {
        // handle error
    }
}];
```

### Creating a Post

```objc
[post create:^(Post *createdPost, NSError *error) {
    if (error) {
        // handle error
    }
}];
```

### Updating a Post

```objc
[post update:^(Post *updatedPost, NSError *error) {
    if (error) {
        // handle error
    }
}];
```

### Deleting a Post

```objc
[post delete:^(NSError *error) {
    if (error) {
        // handle error
    }
}];
```
