# Rapid

![Swift 5.9]

[Swift 5.9]: https://img.shields.io/badge/Swift-5.9-%23f05138?logo=swift

A host of utilities to make Swift swifter.

 - [Using Rapid](#using-rapid)
 - [Features](/Features.md)
 - [License](/License.md)

## Using Rapid

### Using in a Swift package

 1. Add Rapid as a dependency to your Package.swift:
 
    ```swift
    .package(
        url: "https://github.com/kaascevich/Rapid.git",
        branch: "main"
    )
    ```
 2. Add Rapid as a dependency to each of your targets:
 
    ```swift
    .product(
        name: "Rapid",
        package: "Rapid"
    )
    ```
    
### Using in an Xcode project

 1. Choose *File* → *Add Package Dependencies...*
 2. [Copy this link](https://github.com/kaascevich/Rapid.git), and paste it into the search bar.
 3. Click *Add Package*.
 4. Choose the target you want to add Rapid to, and then click *Add Package* again.

