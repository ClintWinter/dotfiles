#!/usr/bin/env swift

import Cocoa

// setbuf(stdout, nil);

var isAppearanceDark: Bool {
    if #available(macOS 11.0, *) {
        return NSAppearance.currentDrawing().bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
    } else {
        return NSAppearance.current.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
    }
}

print(isAppearanceDark ? "Dark" : "Light")
