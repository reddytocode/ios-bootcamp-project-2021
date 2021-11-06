//
//  NetworkRouter.swift
//  TheMovieDb
//
//  Created by Reddy Tintaya Conde on 5/11/21.
//

import Foundation


public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()


protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    
    func cancel()
}
