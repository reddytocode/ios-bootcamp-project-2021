//
//  HTTPTask.swift
//  TheMovieDb
//
//  Created by Reddy Tintaya Conde on 5/11/21.
//

import Foundation

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParamenters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}

public typealias HTTPHeaders = [String: String]

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
