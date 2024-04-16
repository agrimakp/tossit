//
//  TossItWatchExt.swift
//  TossItWatchExt
//
//  Created by Agrima Purakkal on 16/4/2024.
//

import AppIntents

struct TossItWatchExt: AppIntent {
    static var title: LocalizedStringResource = "TossItWatchExt"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
