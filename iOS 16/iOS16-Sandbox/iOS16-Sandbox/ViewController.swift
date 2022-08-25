//
//  ViewController.swift
//  iOS16-Sandbox
//
//  Created by 杨帆 on 2022/8/25.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Home
        let homeDirectory = URL.homeDirectory
        print(homeDirectory)

        // Documents
        let documentsURL = URL.documentsDirectory
        print(documentsURL)

        // Library
        var libraryDirectory = URL.libraryDirectory
        libraryDirectory.append(path: "abc", directoryHint: .inferFromPath)
        print(libraryDirectory)
        let newURL = libraryDirectory.appending(path: "abc", directoryHint: .inferFromPath)
        print(newURL)

        // Caches
        let cachesDirectory = URL.cachesDirectory
        print(cachesDirectory)

        // tmp
        let temporaryDirectory = URL.temporaryDirectory
        print(temporaryDirectory)
    }
}

