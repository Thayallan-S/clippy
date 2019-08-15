//
//  HistoryMenuItem.swift
//  clippy
//
//  Created by Thayallan Srinathan on 2019-08-15.
//  Copyright © 2019 Clippy. All rights reserved.
//

import Cocoa

class HistoryMenuItem: NSMenuItem {
    typealias Callback = (HistoryMenuItem) -> Void
    
    private let showMaxLength = 50
    
    public var fullTitle: String?
    private var onSelected: [Callback] = []
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String, onSelected: @escaping Callback) {
        super.init(title: title, action: #selector(onSelect(_:)), keyEquivalent: "")
        self.onSelected = [onSelected]
        self.target = self
        self.fullTitle = title
        self.title = humanizedTitle(title)
    }
    
    @objc
    func onSelect(_ sender: NSMenuItem) {
        for hook in onSelected {
            hook(self)
        }
    }
    
    private func humanizedTitle(_ title: String) -> String {
        let trimmedTitle = title.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedTitle.count > showMaxLength {
            let index = trimmedTitle.index(trimmedTitle.startIndex, offsetBy: showMaxLength)
            return "\(trimmedTitle[...index])..."
        } else {
            return trimmedTitle
        }
    }
}
