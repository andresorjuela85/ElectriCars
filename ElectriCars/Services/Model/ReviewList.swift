//
//  ReviewList.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 8/09/22.
//

import Foundation
import Apollo

typealias ReviewListData = ReviewListQuery.Data

struct ReviewList: ModelProcessProtocol {
    var reviews: [Review] = []
    
    init(data: ReviewListData?) {
        
        data?.reviewList?.forEach({ review in
            self.reviews.append(Review(review))
        })
    }
    
    static func processData(_ data: GraphQLSelectionSet) -> ReviewList {
        return ReviewList(data: data as? ReviewListData)
    }
}

struct Review: Codable {
    
    var rating: Int?
    var message: String?
    
    init(_ review: ReviewListData.ReviewList) {
        self.rating = review.rating
        self.message = review.message
    }
}
