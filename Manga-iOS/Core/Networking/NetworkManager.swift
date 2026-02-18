//
//  NetworkManager.swift
//  Manga-iOS
//
//  Created by Jorge Luis Rivera on 18/02/26.
//

import Foundation
import OSLog

protocol NetworkManager {
    var session: URLSession { get }
}

let networkLogger = Logger(
    subsystem: "com.desayscod.Manga-ios",
    category: "network"
)

extension NetworkManager {

    func getJSON<JSON>(
        _ request: URLRequest,
        type: JSON.Type
    ) async throws(NetworkError) -> JSON where JSON: Decodable {
        networkLogger.debug(
            "Request URL: \(request.url?.absoluteString ?? "Unknown URL", privacy: .public)"
        )
        let (data, httpResponse) = try await session.getData(for: request)
        networkLogger
            .debug("Response StatusCode: \(httpResponse.statusCode)")
        guard httpResponse.statusCode == 200 else {
            networkLogger
                .error("Response error: \(httpResponse.statusCode)")
            throw .status(httpResponse.statusCode)
        }
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw .json(error)
        }
    }
}
