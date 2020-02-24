//
//  BaseRequest.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/24/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "Delete"
    case put = "PUT"
}

public class BaseRequest {
    var apiName: API?
    var parameters: [String: Any]?
    var headers: [String: String]?
    var queryParams: [String: String]?
    var httpMethod: HTTPMethod = .get
    var identifier: String = ""
    var classType: AnyClass?
    var timeout: TimeInterval = 20
    
    var url: URL? {
        return url(api: apiName, queryParams: queryParams ?? [:])
    }
    
    private func url(api: API?, queryParams: [String: String] = [:])->URL?{
        var queryItems: [URLQueryItem] = []
        for (key,value) in queryParams {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        var components = URLComponents()
        components.host = host
        components.scheme = scheme
        components.path = apiPrefix + (api?.rawValue ?? "")
        components.queryItems = queryItems
        return components.url
    }
}
