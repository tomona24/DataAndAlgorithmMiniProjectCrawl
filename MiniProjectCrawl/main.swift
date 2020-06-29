//
//  main.swift
//  MiniProjectCrawl
//
//  Created by Tomona Sako on 2020/06/28.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func readAndShowFileManager(urlPath : String, numInDir: Int, space: String, counter: inout [Int]) {
    let url = URL(fileURLWithPath: urlPath);
    let manager = FileManager.default;
    let spacing = "| " + space;
    do {
        let list = try manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .includesDirectoriesPostOrder);
        for i in 0..<list.count {
            var isDir: ObjCBool = false;
            if manager.fileExists(atPath: list[i].relativePath, isDirectory: &isDir) {
                if isDir.boolValue {
                    counter[0] = counter[0] + 1
                    if (space.count == 0) {
                        print( "├─" + list[i].lastPathComponent)
                        readAndShowFileManager(urlPath: list[i].relativePath, numInDir: i - 1, space: "  " + space, counter: &counter);
                    } else {
                        print(spacing + "├─" + list[i].lastPathComponent)
                        readAndShowFileManager(urlPath: list[i].relativePath, numInDir: i - 1, space: "  |" + space, counter: &counter);
                    }

                } else {
                    counter[1] = counter[1] + 1
                    if i == (list.count - 1) {
                        if (space.count == 0) {
                            print ("└─" + list[i].lastPathComponent);
                        } else {
                            print (spacing + "└─" + list[i].lastPathComponent);
                        }
                    } else {
                        if (space.count == 0) {
                            print ("├─" + list[i].lastPathComponent);
                        } else {
                            print (spacing + "├─" + list[i].lastPathComponent);
                        }
                    }
                }
            }
        }
    } catch {
        return
    }
}

var counter : [Int] = [0, 0];
print("Type directory path :")
let path: String = readLine()!
print(URL(fileURLWithPath: path).lastPathComponent + " Output :")

readAndShowFileManager(urlPath: path, numInDir: 0, space: "", counter: &counter );

print(String(format:"%d directories, %d files", counter[0], counter[1]));
