//
//  main.swift
//  MiniProjectCrawl
//
//  Created by Tomona Sako on 2020/06/28.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func readAndShowFileManager(urlPath : String, numInDir: Int) {
    //    print("url: " + urlPath);
    let url = URL(fileURLWithPath: urlPath);
    let manager = FileManager.default;
    do {
        let list = try manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder);
        for i in 0..<list.count {
            var isDir: ObjCBool = false;
            if manager.fileExists(atPath: list[i].relativePath, isDirectory: &isDir) {
                if isDir.boolValue {
                    print("├" + list[i].lastPathComponent)
                    readAndShowFileManager(urlPath: list[i].relativePath, numInDir: i - 1);
                } else {
                    print (" ├" + list[i].lastPathComponent);
                }
            }}
    } catch {
        return
    }
    //    if !manager.fileExists(atPath: urlPath) {
}

readAndShowFileManager(urlPath: "/Users/tomona_s/Documents/05_CICCC/DataAndAlgorithm/tameshi/", numInDir: 0 );


// in the MiniProjectCrawl
//[file:///Users/tomona_s/Documents/05_CICCC/DataAndAlgorithm/MiniProjectCrawl/MiniProjectCrawl.xcodeproj/, file:///Users/tomona_s/Documents/05_CICCC/DataAndAlgorithm/MiniProjectCrawl/MiniProjectCrawl/]
