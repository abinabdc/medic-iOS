//
//  LoginSession.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import Foundation
public struct LoginSession {
    fileprivate static let defaults = UserDefaults.standard
    
    
    enum userValues: String {
        case username
        case token
        case roles
    }
    //Mark: - Getting Session Details
    static func getUserSessionDetails()->[String:AnyObject]? {
        let dictionary = defaults.object(forKey: "LoginSession") as? [String:AnyObject]
        return dictionary
    }
    //Mark: - Saving Device
    static func saveDeviceToken(_ token: String){
        guard (gettingDeviceToken() ?? "").isEmpty else{
            return
        }
        defaults.removeObject(forKey: "deviceToken")
        defaults.set(token, forKey: "deviceToken")
        defaults.synchronize()
    }
    //Mark: - Getting Token here
    static func gettingDeviceToken()->String? {
        let token = defaults.object(forKey: "deviceToken") as? String
        if token == nil{
            return ""
        }else{return token}
    }
    //Mark: - Setting here user details
    static func setUserSessionDetails(_ dic :[String: AnyObject]) {
        defaults.removeObject(forKey: "LoginSession")
        defaults.set(dic, forKey: "LoginSession")
        defaults.synchronize()
    }
    //Mark: - Removing here all default values
    static func userSessionLogout(){
        defaults.removeObject(forKey: "LoginSession")
        defaults.synchronize()
    }
    static func getUserValues(value: userValues) -> String? {
        let dic = getUserSessionDetails() ?? [:]
        guard let value = dic[value.rawValue] else {
            return ""
        }
        return value as? String
    }
}


// Saving user details
//============================
// Session.setUserSessionDetails(json ?? [:])
// Session.getUserValues(value: .token) ?? ""
