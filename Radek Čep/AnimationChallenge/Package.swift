// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AnimationChallenge",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "AnimationChallenge",
      targets: ["AnimationChallenge"]
    ),
  ],
  targets: [
    .target(
      name: "AnimationChallenge",
      dependencies: []
    )
  ]
)
