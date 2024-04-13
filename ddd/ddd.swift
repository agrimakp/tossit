//
//  ddd.swift
//  ddd
//
//  Created by Agrima Purakkal on 10/4/2024.
//

import AppIntents

struct ddd: AppIntent {
    static var title: LocalizedStringResource = "ddd"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
