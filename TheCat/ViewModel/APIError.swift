//
//  APIError.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizationDescription: String {
        // user feedback
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, Someting went wrong."
        case .badResponse(_):
            return "Sorry, the connection to our server failed."
        case .url(let error):
            return error?.localizedDescription ?? "Sorry, Someting went wrong."
        }
    }
    
    var description: String {
        // info for debuging
        switch self {
        case .badURL:
            return "Invalid URL"
        case .badResponse(let statusCode):
            return "bad response with status code \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .unknown:
            return "unknown error"
        }
    }
}
