//
//  History.swift
//  clippy
//
//  Created by Thayallan Srinathan on 2019-08-15.
//  Copyright © 2019 Clippy. All rights reserved.
//

import AppKit

class History {
    private let sizeKey = "historySize"
    
    private var storageKey: String {
        if ProcessInfo.processInfo.arguments.contains("ui-testing") {
            return "historyUITests"
        } else {
            return "history"
        }
    }
    
    init() {
        UserDefaults.standard.register(defaults: [sizeKey: 999])
        if ProcessInfo.processInfo.arguments.contains("ui-testing") {
            clear()
        }
    }
    
    func all() -> [String] {
        guard var savedHistory = UserDefaults.standard.array(forKey: storageKey) as? [String] else {
            return []
        }
        
        let maxSize = UserDefaults.standard.integer(forKey: sizeKey)
        while savedHistory.count > maxSize {
            savedHistory.remove(at: maxSize - 1)
        }
        
        return savedHistory
    }
    
    func add(_ string: String) {
        var history = all()
        let maxSize = UserDefaults.standard.integer(forKey: sizeKey)
        
        if let index = history.firstIndex(of: string) {
            history.remove(at: index)
        } else if history.count == maxSize {
            history.remove(at: maxSize - 1)
        }
        
        let newContents = [string] + history
        UserDefaults.standard.set(newContents, forKey: storageKey)
    }
    
    func removeRecent() {
        var history = all()
        if !history.isEmpty {
            history.removeFirst()
            UserDefaults.standard.set(history, forKey: storageKey)
        }
    }
    
    func clear() {
        UserDefaults.standard.set([], forKey: storageKey)
    }
}
