//
//  NetworkManager.swift
//  TheMovieDb
//
//  Created by Reddy Tintaya Conde on 5/11/21.
//

import Foundation

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let MovieAPIKey = "f6cd5c1a9e6c6b965fdcab0fa6ddd38a"
    private let router = Router<MovieApi>()
    
    func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?, _ error: String?) -> Void) {
            router.request(.newMovies(page: page)) { data, response, error in
                
                if error != nil {
                    completion(nil, "Please check your network connection.")
                }
                
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            print(responseData)
                            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                            print(jsonData)
                            let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                            completion(apiResponse.movies, nil)
                        } catch {
                            print(error)
                            completion(nil, NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                        completion(nil, networkFailureError)
                    }
                }
            }
        }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        default: return.failure(NetworkResponse.failed.rawValue)
        }
    }

}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The URL you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}
