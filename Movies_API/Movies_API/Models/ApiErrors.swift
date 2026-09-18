//
//  ApiErrors.swift
//  Movies_API
//
//  Created by Bandisile Mazomba on 2026/09/01.
//

import Foundation

public enum ApiError: Error {
    case noDataAvailable
    case unableToDecodeData
    case invalidURL
}
