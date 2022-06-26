//
//  LoginResponseModel.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import Foundation
import ObjectMapper

struct LoginResponseModel : Mappable {
    var status : Bool?
    var message : String?
    var data : LoginDetailResponse?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }

}

struct LoginDetailResponse : Mappable {
    var username : String?
    var token : String?
    var roles : [String]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        username <- map["username"]
        token <- map["token"]
        roles <- map["roles"]
    }

}
