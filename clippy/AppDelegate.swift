//
//  AppDelegate.swift
//  clippy
//
//  Created by Thayallan Srinathan on 2019-08-15.
//  Copyright © 2019 Clippy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let clipboard = Clipboard()
    let history = History()
    let hotKey = GlobalHotKey()
    
    var clippy: Clippy
    
    override init() {
        self.clippy = Clippy(history: history, clipboard: clipboard)
        super.init()
    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        clippy.start()
        hotKey.handler = { self.clippy.popUp() }
    }
}


