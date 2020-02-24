//
//  Network.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/23/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import Foundation
import Reachability

class Network {
    static let shared = Network()
    var session: URLSession?
    
    private init() {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Accept":"application/json",
                                                      "Content-Type":"application/json"]
        session = URLSession(configuration: sessionConfiguration)
    }
    
    
    public func execute<T: Codable>(_: T.Type, baseRequest: BaseRequest, completion: @escaping (_ response: T?, _ error: Error?) -> Void){
        //handling get method only for now
        if baseRequest.httpMethod == .get {
            guard let url = baseRequest.url else {return}
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: baseRequest.timeout)
            request.httpMethod = HTTPMethod.get.rawValue
            let task: URLSessionTask? = self.session?.dataTask(with: request) { (data, response, error) in
                guard let data = data else {return}
                let object = try? JSONDecoder().decode(T.self, from: data)
                completion(object, error)
            }
            task?.resume()
        }
    }
    
}

