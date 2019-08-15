//
//  About.swift
//  clippy
//
//  Created by Thayallan Srinathan on 2019-08-15.
//  Copyright © 2019 Clippy. All rights reserved.
//

import Cocoa

class About {
    private let familyCredits = NSAttributedString(
        string: "Thanks to everyone supporting the product   ",
        attributes: [NSAttributedString.Key.foregroundColor: NSColor.labelColor]
    )
    
    private var kossCredits: NSMutableAttributedString {
        let string = NSMutableAttributedString(string: "",
                                               attributes: [NSAttributedString.Key.foregroundColor: NSColor.labelColor])
        string.addAttribute(.link, value: "", range: NSRange(location: 0, length: 0))
        return string
    }
    
    private var credits: NSMutableAttributedString {
        let credits = NSMutableAttributedString(string: "A Product by Thayallan Srinathan",
                                                attributes: [NSAttributedString.Key.foregroundColor: NSColor.labelColor])
        credits.append(kossCredits)
        credits.append(NSAttributedString(string: "\n"))
        credits.append(familyCredits)
        credits.setAlignment(.center, range: NSRange(location: 0, length: credits.length))
        return credits
    }
    
    @objc
    func openAbout(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        NSApp.orderFrontStandardAboutPanel(options: [NSApplication.AboutPanelOptionKey.credits: credits])
    }
}

