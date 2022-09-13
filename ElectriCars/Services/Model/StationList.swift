//
//  StationList.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 30/08/22.
//

import Foundation
import Apollo

typealias StationListData = StationListQuery.Data

struct StationList: ModelProcessProtocol {
    var stations: [Station] = []
    
    init(data: StationListData?) {
        data?.stationList?.forEach({ station in
            if let station = station {
                self.stations.append(Station(station))
            }
        })
    }
    
    static func processData(_ data: GraphQLSelectionSet) -> StationList {
        return StationList(data: data as? StationListData)
    }
}

struct Station: Codable {
    
    var id: String
    var name: String?
    var address: String?
    var city: String?
    var country: String?
    var coordinates: [Double]?
    var weekday: [Weekday]?
    
    init(_ station: StationListData.StationList) {
        self.id = station.id 
        self.name = station.name
        self.address = station.address
        self.city = station.city
        self.country = station.country
        self.coordinates = station.location?.coordinates
        self.weekday = []
        station.openingTimes?.regularHours?.forEach({ regularHour in
            let weekday = Weekday(weekday: regularHour?.weekday,
                                  periodBegin: regularHour?.periodBegin,
                                  periodEnd: regularHour?.periodEnd)
            self.weekday?.append(weekday)
        })
        
    }
}

struct Weekday: Codable {
    
    var weekday: Int?
    var periodBegin: String?
    var periodEnd: String?
}
