//
//  objects.swift
//  sight_reading
//
//  Created by Sunny Kong on 2024-02-22.
//

import Foundation


enum ButtonTitles {
    static let values = ["C", "D", "E", "F", "G", "A", "B"]
}
enum signatures{
    static let sharp = ["C","G","D","A","E","B","F#","C#"]
    static let flat = ["C","F","B♭","E♭","A♭","D♭","G♭","C♭"]
}

enum NoteType {
    case none
    case sharp
    case flat
    
    mutating func toggle() {
        switch self {
        case .none:
            self = .sharp
        case .sharp:
            self = .flat
        case .flat:
            self = .none
        }
    }
}
