//
//  Network.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import Apollo
import Combine

enum ServiceResponse<T> {
    case success(response: T)
    case failure(error: Error?)
}

enum ServiceError: Error {
    case error
}

final class Network {

    private(set) lazy var apollo: ApolloClient = {

        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["X-CLIENT-ID": "62d084258dc245ed1af56129"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads

        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)

        let url = URL(string: "https://api.chargetrip.io/graphql")!

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)

        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    func fetch<T: ModelProcessProtocol, Query: GraphQLQuery>(of type: T.Type, query: Query) -> AnyPublisher<T, Error> {
        
        return Deferred {
            Future<T, Error> { promise in
                self.apollo.fetch(query: query) { result in
                    
                    switch result {
                    case .success(let graphQLResult):
                        
                        if let data = graphQLResult.data {
                            promise(.success(T.processData(data)))
                        } else {
                            promise(.failure(ServiceError.error))
                        }
                        
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
        request.addHeader(name: "X-CLIENT-ID", value: "62d084258dc245ed1af56129")
        request.addHeader(name: "X-APP-ID", value: "62d084258dc245ed1af5612b")

        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
