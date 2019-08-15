//
//  Keys.swift
//  clippy
//
//  Created by Thayallan Srinathan on 2019-08-15.
//  Copyright © 2019 Clippy. All rights reserved.
//

import HotKey

class Keys {
    private static let keysToSkip = [
        Key.home,
        Key.pageUp,
        Key.pageDown,
        Key.end,
        Key.leftArrow,
        Key.rightArrow,
        Key.escape,
        Key.tab,
        Key.f1,
        Key.f2,
        Key.f3,
        Key.f4,
        Key.f5,
        Key.f6,
        Key.f7,
        Key.f8,
        Key.f9,
        Key.f10,
        Key.f11,
        Key.f12,
        Key.f13,
        Key.f14,
        Key.f15,
        Key.f16,
        Key.f17,
        Key.f18,
        Key.f19
    ]
    
    static func shouldPassThrough(_ key: Key) -> Bool {
        return keysToSkip.contains(key)
    }
}
