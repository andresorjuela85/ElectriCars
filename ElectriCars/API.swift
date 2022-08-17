// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Form input to add a new review
public struct ReviewAdd: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - stationId: Station ID for which a review is provided
  ///   - rating: Rating of a review
  ///   - message: Review message
  ///   - locale: Locale of a message
  ///   - ev: ID of the Car that was provided/selected by a user
  ///   - plugType: Plug type that was provided/selected by a user
  ///   - properties: Optional object where you can store custom data you need in your application. This extends the current functionalities we offer
  ///   - tags: Boolean tags for a station review
  public init(stationId: String, rating: Int, message: Swift.Optional<String?> = nil, locale: Swift.Optional<String?> = nil, ev: Swift.Optional<String?> = nil, plugType: Swift.Optional<ConnectorType?> = nil, properties: Swift.Optional<String?> = nil, tags: Swift.Optional<ReviewTagsInput?> = nil) {
    graphQLMap = ["stationId": stationId, "rating": rating, "message": message, "locale": locale, "ev": ev, "plugType": plugType, "properties": properties, "tags": tags]
  }

  /// Station ID for which a review is provided
  public var stationId: String {
    get {
      return graphQLMap["stationId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "stationId")
    }
  }

  /// Rating of a review
  public var rating: Int {
    get {
      return graphQLMap["rating"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rating")
    }
  }

  /// Review message
  public var message: Swift.Optional<String?> {
    get {
      return graphQLMap["message"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "message")
    }
  }

  /// Locale of a message
  public var locale: Swift.Optional<String?> {
    get {
      return graphQLMap["locale"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "locale")
    }
  }

  /// ID of the Car that was provided/selected by a user
  public var ev: Swift.Optional<String?> {
    get {
      return graphQLMap["ev"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ev")
    }
  }

  /// Plug type that was provided/selected by a user
  public var plugType: Swift.Optional<ConnectorType?> {
    get {
      return graphQLMap["plugType"] as? Swift.Optional<ConnectorType?> ?? Swift.Optional<ConnectorType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plugType")
    }
  }

  /// Optional object where you can store custom data you need in your application. This extends the current functionalities we offer
  public var properties: Swift.Optional<String?> {
    get {
      return graphQLMap["properties"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "properties")
    }
  }

  /// Boolean tags for a station review
  public var tags: Swift.Optional<ReviewTagsInput?> {
    get {
      return graphQLMap["tags"] as? Swift.Optional<ReviewTagsInput?> ?? Swift.Optional<ReviewTagsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tags")
    }
  }
}

/// The socket or plug standard of the charging point.
public enum ConnectorType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// The connector type is CHAdeMO, DC
  case chademo
  /// Standard/domestic household, type "A", NEMA 1-15, 2 pins
  case domesticA
  /// Standard/domestic household, type "B", NEMA 5-15, 3 pins
  case domesticB
  /// Standard/domestic household, type "C", CEE 7/17, 2 pins
  case domesticC
  /// Standard/domestic household, type "D", 3 pins
  case domesticD
  /// Standard/domestic household, type "E", CEE 7/5 3 pins
  case domesticE
  /// Standard/domestic household, type "F", CEE 7/4, Schuko, 3 pins
  case domesticF
  /// Standard/domestic household, type "G", BS 1363, Commonwealth, 3 pins
  case domesticG
  /// Standard/domestic household, type "H", SI-32, 3 pins
  case domesticH
  /// Standard/domestic household, type "I", AS 3112, 3 pins
  case domesticI
  /// Standard/domestic household, type "J", SEV 1011, 3 pins
  case domesticJ
  /// Standard/domestic household, type "K", DS 60884-2-D1, 3 pins
  case domesticK
  /// Standard/domestic household, type "L", CEI 23-16-VII, 3 pins
  case domesticL
  /// Standard/Domestic household, type "M", BS 546, 3 pins
  case domesticM
  /// Standard/Domestic household, type "N", NBR 14136, 3 pins
  case domesticN
  /// Standard/Domestic household, type "O", TIS 166-2549, 3 pins
  case domesticO
  /// IEC 60309-2 Industrial connector single phase 16 amperes (usually blue)
  case iec_60309_2Single_16
  /// IEC 60309-2 Industrial connector three phase 16 amperes (usually red)
  case iec_60309_2Three_16
  /// IEC 60309-2 Industrial connector three phase 32 amperes (usually red)
  case iec_60309_2Three_32
  /// IEC 60309-2 Industrial connector three phase 64 amperes (usually red)
  case iec_60309_2Three_64
  /// IEC 62196 Type 1 "SAE J1772"
  case iec_62196T1
  /// Combo Type 1 based, DC
  case iec_62196T1Combo
  /// IEC 62196 Type 2 "Mennekes"
  case iec_62196T2
  /// Combo Type 2 based, DC
  case iec_62196T2Combo
  /// IEC 62196 Type 3A
  case iec_62196T3A
  /// IEC 62196 Type 3C "Scame"
  case iec_62196T3C
  /// On-board bottom-up-pantograph typically for bus charging
  case pantographBottomUp
  /// Off-board top-down-pantograph typically for bus charging
  case pantographTopDown
  /// Tesla connector "Roadster"-type (round, 4 pins)
  case teslaR
  /// Tesla connector "Model-S"-type (oval, 5 pins)
  case teslaS
  /// The connector type is GB_T (Chinese standard), DC
  case gbT
  /// The ChaoJi connector. The new generation charging connector, harmonized between CHAdeMO and GB/T. DC.
  case chaoji
  /// The connector type is NEMA 5-20, 3 pins
  case nema_5_20
  /// The connector type is NEMA 6-30, 3 pins
  case nema_6_30
  /// The connector type is NEMA 6-50, 3 pins
  case nema_6_50
  /// The connector type is NEMA 10-30, 3 pins
  case nema_10_30
  /// The connector type is NEMA 10-50, 3 pins
  case nema_10_50
  /// The connector type is NEMA 14-30, 3 pins, rating of 30 A
  case nema_14_30
  /// The connector type is NEMA 14-50, 3 pins, rating of 50 A
  case nema_14_50
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CHADEMO": self = .chademo
      case "DOMESTIC_A": self = .domesticA
      case "DOMESTIC_B": self = .domesticB
      case "DOMESTIC_C": self = .domesticC
      case "DOMESTIC_D": self = .domesticD
      case "DOMESTIC_E": self = .domesticE
      case "DOMESTIC_F": self = .domesticF
      case "DOMESTIC_G": self = .domesticG
      case "DOMESTIC_H": self = .domesticH
      case "DOMESTIC_I": self = .domesticI
      case "DOMESTIC_J": self = .domesticJ
      case "DOMESTIC_K": self = .domesticK
      case "DOMESTIC_L": self = .domesticL
      case "DOMESTIC_M": self = .domesticM
      case "DOMESTIC_N": self = .domesticN
      case "DOMESTIC_O": self = .domesticO
      case "IEC_60309_2_single_16": self = .iec_60309_2Single_16
      case "IEC_60309_2_three_16": self = .iec_60309_2Three_16
      case "IEC_60309_2_three_32": self = .iec_60309_2Three_32
      case "IEC_60309_2_three_64": self = .iec_60309_2Three_64
      case "IEC_62196_T1": self = .iec_62196T1
      case "IEC_62196_T1_COMBO": self = .iec_62196T1Combo
      case "IEC_62196_T2": self = .iec_62196T2
      case "IEC_62196_T2_COMBO": self = .iec_62196T2Combo
      case "IEC_62196_T3A": self = .iec_62196T3A
      case "IEC_62196_T3C": self = .iec_62196T3C
      case "PANTOGRAPH_BOTTOM_UP": self = .pantographBottomUp
      case "PANTOGRAPH_TOP_DOWN": self = .pantographTopDown
      case "TESLA_R": self = .teslaR
      case "TESLA_S": self = .teslaS
      case "GB_T": self = .gbT
      case "CHAOJI": self = .chaoji
      case "NEMA_5_20": self = .nema_5_20
      case "NEMA_6_30": self = .nema_6_30
      case "NEMA_6_50": self = .nema_6_50
      case "NEMA_10_30": self = .nema_10_30
      case "NEMA_10_50": self = .nema_10_50
      case "NEMA_14_30": self = .nema_14_30
      case "NEMA_14_50": self = .nema_14_50
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .chademo: return "CHADEMO"
      case .domesticA: return "DOMESTIC_A"
      case .domesticB: return "DOMESTIC_B"
      case .domesticC: return "DOMESTIC_C"
      case .domesticD: return "DOMESTIC_D"
      case .domesticE: return "DOMESTIC_E"
      case .domesticF: return "DOMESTIC_F"
      case .domesticG: return "DOMESTIC_G"
      case .domesticH: return "DOMESTIC_H"
      case .domesticI: return "DOMESTIC_I"
      case .domesticJ: return "DOMESTIC_J"
      case .domesticK: return "DOMESTIC_K"
      case .domesticL: return "DOMESTIC_L"
      case .domesticM: return "DOMESTIC_M"
      case .domesticN: return "DOMESTIC_N"
      case .domesticO: return "DOMESTIC_O"
      case .iec_60309_2Single_16: return "IEC_60309_2_single_16"
      case .iec_60309_2Three_16: return "IEC_60309_2_three_16"
      case .iec_60309_2Three_32: return "IEC_60309_2_three_32"
      case .iec_60309_2Three_64: return "IEC_60309_2_three_64"
      case .iec_62196T1: return "IEC_62196_T1"
      case .iec_62196T1Combo: return "IEC_62196_T1_COMBO"
      case .iec_62196T2: return "IEC_62196_T2"
      case .iec_62196T2Combo: return "IEC_62196_T2_COMBO"
      case .iec_62196T3A: return "IEC_62196_T3A"
      case .iec_62196T3C: return "IEC_62196_T3C"
      case .pantographBottomUp: return "PANTOGRAPH_BOTTOM_UP"
      case .pantographTopDown: return "PANTOGRAPH_TOP_DOWN"
      case .teslaR: return "TESLA_R"
      case .teslaS: return "TESLA_S"
      case .gbT: return "GB_T"
      case .chaoji: return "CHAOJI"
      case .nema_5_20: return "NEMA_5_20"
      case .nema_6_30: return "NEMA_6_30"
      case .nema_6_50: return "NEMA_6_50"
      case .nema_10_30: return "NEMA_10_30"
      case .nema_10_50: return "NEMA_10_50"
      case .nema_14_30: return "NEMA_14_30"
      case .nema_14_50: return "NEMA_14_50"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ConnectorType, rhs: ConnectorType) -> Bool {
    switch (lhs, rhs) {
      case (.chademo, .chademo): return true
      case (.domesticA, .domesticA): return true
      case (.domesticB, .domesticB): return true
      case (.domesticC, .domesticC): return true
      case (.domesticD, .domesticD): return true
      case (.domesticE, .domesticE): return true
      case (.domesticF, .domesticF): return true
      case (.domesticG, .domesticG): return true
      case (.domesticH, .domesticH): return true
      case (.domesticI, .domesticI): return true
      case (.domesticJ, .domesticJ): return true
      case (.domesticK, .domesticK): return true
      case (.domesticL, .domesticL): return true
      case (.domesticM, .domesticM): return true
      case (.domesticN, .domesticN): return true
      case (.domesticO, .domesticO): return true
      case (.iec_60309_2Single_16, .iec_60309_2Single_16): return true
      case (.iec_60309_2Three_16, .iec_60309_2Three_16): return true
      case (.iec_60309_2Three_32, .iec_60309_2Three_32): return true
      case (.iec_60309_2Three_64, .iec_60309_2Three_64): return true
      case (.iec_62196T1, .iec_62196T1): return true
      case (.iec_62196T1Combo, .iec_62196T1Combo): return true
      case (.iec_62196T2, .iec_62196T2): return true
      case (.iec_62196T2Combo, .iec_62196T2Combo): return true
      case (.iec_62196T3A, .iec_62196T3A): return true
      case (.iec_62196T3C, .iec_62196T3C): return true
      case (.pantographBottomUp, .pantographBottomUp): return true
      case (.pantographTopDown, .pantographTopDown): return true
      case (.teslaR, .teslaR): return true
      case (.teslaS, .teslaS): return true
      case (.gbT, .gbT): return true
      case (.chaoji, .chaoji): return true
      case (.nema_5_20, .nema_5_20): return true
      case (.nema_6_30, .nema_6_30): return true
      case (.nema_6_50, .nema_6_50): return true
      case (.nema_10_30, .nema_10_30): return true
      case (.nema_10_50, .nema_10_50): return true
      case (.nema_14_30, .nema_14_30): return true
      case (.nema_14_50, .nema_14_50): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ConnectorType] {
    return [
      .chademo,
      .domesticA,
      .domesticB,
      .domesticC,
      .domesticD,
      .domesticE,
      .domesticF,
      .domesticG,
      .domesticH,
      .domesticI,
      .domesticJ,
      .domesticK,
      .domesticL,
      .domesticM,
      .domesticN,
      .domesticO,
      .iec_60309_2Single_16,
      .iec_60309_2Three_16,
      .iec_60309_2Three_32,
      .iec_60309_2Three_64,
      .iec_62196T1,
      .iec_62196T1Combo,
      .iec_62196T2,
      .iec_62196T2Combo,
      .iec_62196T3A,
      .iec_62196T3C,
      .pantographBottomUp,
      .pantographTopDown,
      .teslaR,
      .teslaS,
      .gbT,
      .chaoji,
      .nema_5_20,
      .nema_6_30,
      .nema_6_50,
      .nema_10_30,
      .nema_10_50,
      .nema_14_30,
      .nema_14_50,
    ]
  }
}

/// Boolean tags for a station review
public struct ReviewTagsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - working: Flag which indicates if a station was working when the review was added
  ///   - recommended: Flag which indicates if a user recommended a station when the review was added
  public init(working: Swift.Optional<Bool?> = nil, recommended: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["working": working, "recommended": recommended]
  }

  /// Flag which indicates if a station was working when the review was added
  public var working: Swift.Optional<Bool?> {
    get {
      return graphQLMap["working"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "working")
    }
  }

  /// Flag which indicates if a user recommended a station when the review was added
  public var recommended: Swift.Optional<Bool?> {
    get {
      return graphQLMap["recommended"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recommended")
    }
  }
}

public final class CarListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CarList($size: Int) {
      carList(size: $size) {
        __typename
        id
        naming {
          __typename
          make
          model
          chargetrip_version
        }
        media {
          __typename
          image {
            __typename
            url
          }
          brand {
            __typename
            url
          }
        }
      }
    }
    """

  public let operationName: String = "CarList"

  public var size: Int?

  public init(size: Int? = nil) {
    self.size = size
  }

  public var variables: GraphQLMap? {
    return ["size": size]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("carList", arguments: ["size": GraphQLVariable("size")], type: .list(.object(CarList.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(carList: [CarList?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "carList": carList.flatMap { (value: [CarList?]) -> [ResultMap?] in value.map { (value: CarList?) -> ResultMap? in value.flatMap { (value: CarList) -> ResultMap in value.resultMap } } }])
    }

    /// Get a full list of cars
    public var carList: [CarList?]? {
      get {
        return (resultMap["carList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CarList?] in value.map { (value: ResultMap?) -> CarList? in value.flatMap { (value: ResultMap) -> CarList in CarList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [CarList?]) -> [ResultMap?] in value.map { (value: CarList?) -> ResultMap? in value.flatMap { (value: CarList) -> ResultMap in value.resultMap } } }, forKey: "carList")
      }
    }

    public struct CarList: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CarList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("naming", type: .object(Naming.selections)),
          GraphQLField("media", type: .object(Medium.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, naming: Naming? = nil, media: Medium? = nil) {
        self.init(unsafeResultMap: ["__typename": "CarList", "id": id, "naming": naming.flatMap { (value: Naming) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Cars unique ID
      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Naming of a car
      public var naming: Naming? {
        get {
          return (resultMap["naming"] as? ResultMap).flatMap { Naming(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "naming")
        }
      }

      /// Media of a car
      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public struct Naming: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CarListNaming"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("make", type: .scalar(String.self)),
            GraphQLField("model", type: .scalar(String.self)),
            GraphQLField("chargetrip_version", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(make: String? = nil, model: String? = nil, chargetripVersion: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CarListNaming", "make": make, "model": model, "chargetrip_version": chargetripVersion])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Car manufacturer name
        public var make: String? {
          get {
            return resultMap["make"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "make")
          }
        }

        /// Car model name
        public var model: String? {
          get {
            return resultMap["model"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "model")
          }
        }

        /// Car model version. Added by Chargetrip as an alternative for when a car manufacturer does not provide an version name, or uses the same version name across all trims or consecutive years
        public var chargetripVersion: String? {
          get {
            return resultMap["chargetrip_version"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "chargetrip_version")
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CarListMedia"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .object(Image.selections)),
            GraphQLField("brand", type: .object(Brand.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image? = nil, brand: Brand? = nil) {
          self.init(unsafeResultMap: ["__typename": "CarListMedia", "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "brand": brand.flatMap { (value: Brand) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Latest image of the car
        public var image: Image? {
          get {
            return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "image")
          }
        }

        /// Latest maker logo of the car
        public var brand: Brand? {
          get {
            return (resultMap["brand"] as? ResultMap).flatMap { Brand(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "brand")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarImage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "CarImage", "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Full path URL of a large image
          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct Brand: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarImage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "CarImage", "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Full path URL of a large image
          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }
    }
  }
}

public final class StationListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query StationList {
      stationList {
        __typename
        name
        address
        city
        country
        location {
          __typename
          coordinates
        }
        opening_times {
          __typename
          regular_hours {
            __typename
            weekday
            period_begin
            period_end
          }
        }
      }
    }
    """

  public let operationName: String = "StationList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("stationList", type: .list(.object(StationList.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stationList: [StationList?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "stationList": stationList.flatMap { (value: [StationList?]) -> [ResultMap?] in value.map { (value: StationList?) -> ResultMap? in value.flatMap { (value: StationList) -> ResultMap in value.resultMap } } }])
    }

    /// Get a full list of stations
    public var stationList: [StationList?]? {
      get {
        return (resultMap["stationList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [StationList?] in value.map { (value: ResultMap?) -> StationList? in value.flatMap { (value: ResultMap) -> StationList in StationList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [StationList?]) -> [ResultMap?] in value.map { (value: StationList?) -> ResultMap? in value.flatMap { (value: StationList) -> ResultMap in value.resultMap } } }, forKey: "stationList")
      }
    }

    public struct StationList: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Station"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("address", type: .scalar(String.self)),
          GraphQLField("city", type: .scalar(String.self)),
          GraphQLField("country", type: .scalar(String.self)),
          GraphQLField("location", type: .object(Location.selections)),
          GraphQLField("opening_times", type: .object(OpeningTime.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, address: String? = nil, city: String? = nil, country: String? = nil, location: Location? = nil, openingTimes: OpeningTime? = nil) {
        self.init(unsafeResultMap: ["__typename": "Station", "name": name, "address": address, "city": city, "country": country, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "opening_times": openingTimes.flatMap { (value: OpeningTime) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Name of a charging station
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// Street/block name and house number if available
      public var address: String? {
        get {
          return resultMap["address"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      /// City or town
      public var city: String? {
        get {
          return resultMap["city"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "city")
        }
      }

      /// ISO 3166-1 alpha-3 code for the country of this station
      public var country: String? {
        get {
          return resultMap["country"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "country")
        }
      }

      /// GeoJSON location of a charging station
      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      /// Times when an EVSEs at a location can be accessed for charging
      public var openingTimes: OpeningTime? {
        get {
          return (resultMap["opening_times"] as? ResultMap).flatMap { OpeningTime(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "opening_times")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("coordinates", type: .nonNull(.list(.nonNull(.scalar(Double.self))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(coordinates: [Double]) {
          self.init(unsafeResultMap: ["__typename": "Point", "coordinates": coordinates])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The coordinates array with longitude as first value and latitude as second one
        public var coordinates: [Double] {
          get {
            return resultMap["coordinates"]! as! [Double]
          }
          set {
            resultMap.updateValue(newValue, forKey: "coordinates")
          }
        }
      }

      public struct OpeningTime: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OCPIHours"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("regular_hours", type: .list(.object(RegularHour.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(regularHours: [RegularHour?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "OCPIHours", "regular_hours": regularHours.flatMap { (value: [RegularHour?]) -> [ResultMap?] in value.map { (value: RegularHour?) -> ResultMap? in value.flatMap { (value: RegularHour) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Regular hours, weekday-based. Only to be used if twentyfourseven=false, then this field needs to contain at least one RegularHours object.
        public var regularHours: [RegularHour?]? {
          get {
            return (resultMap["regular_hours"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RegularHour?] in value.map { (value: ResultMap?) -> RegularHour? in value.flatMap { (value: ResultMap) -> RegularHour in RegularHour(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [RegularHour?]) -> [ResultMap?] in value.map { (value: RegularHour?) -> ResultMap? in value.flatMap { (value: RegularHour) -> ResultMap in value.resultMap } } }, forKey: "regular_hours")
          }
        }

        public struct RegularHour: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["OCPIRegularHours"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("weekday", type: .scalar(Int.self)),
              GraphQLField("period_begin", type: .scalar(String.self)),
              GraphQLField("period_end", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(weekday: Int? = nil, periodBegin: String? = nil, periodEnd: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "OCPIRegularHours", "weekday": weekday, "period_begin": periodBegin, "period_end": periodEnd])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Number of days in the week, from Monday (1) till Sunday (7)
          public var weekday: Int? {
            get {
              return resultMap["weekday"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "weekday")
            }
          }

          /// Begin of the regular period, in local time, given in hours and minutes. Must be in 24h format with leading zeros. Example: "18:15". Hour/Minute separator: ":" Regex: ([0-1][0-9]|2[1-3]):[0-5][0-9].
          public var periodBegin: String? {
            get {
              return resultMap["period_begin"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "period_begin")
            }
          }

          /// End of the regular period, in local time, syntax as for period_begin. Must be later than period_begin.
          public var periodEnd: String? {
            get {
              return resultMap["period_end"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "period_end")
            }
          }
        }
      }
    }
  }
}

public final class AddReviewMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddReview($review: ReviewAdd!) {
      addReview(review: $review) {
        __typename
        rating
        message
      }
    }
    """

  public let operationName: String = "AddReview"

  public var review: ReviewAdd

  public init(review: ReviewAdd) {
    self.review = review
  }

  public var variables: GraphQLMap? {
    return ["review": review]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addReview", arguments: ["review": GraphQLVariable("review")], type: .nonNull(.object(AddReview.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addReview: AddReview) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addReview": addReview.resultMap])
    }

    /// Add a new review.
    /// If the `x-token` header is send for a valid user, the review will belong to it, otherwise will be added for an anonymouse user
    public var addReview: AddReview {
      get {
        return AddReview(unsafeResultMap: resultMap["addReview"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addReview")
      }
    }

    public struct AddReview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("rating", type: .scalar(Int.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(rating: Int? = nil, message: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "rating": rating, "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Rating of a review
      public var rating: Int? {
        get {
          return resultMap["rating"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "rating")
        }
      }

      /// Message of a review
      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }
    }
  }
}
