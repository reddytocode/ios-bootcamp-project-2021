//
//  EndPointType.swift
//  TheMovieDb
//
//  Created by Reddy Tintaya Conde on 5/11/21.
//

import Foundation


protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
