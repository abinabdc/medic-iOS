//
//  LoginViewModel.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper



class LoginViewModel{
    func requestForLogin(Username: String, Password: String, success: @escaping (LoginResponseModel) -> Void, fail: @escaping (String) -> Void) {
        
        
        let params: [String: Any] = [
            "Username" : Username,
            "Password" : Password,
        ]
        
        let url = BASE_URL + LOGIN_EP
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseObject(completionHandler: { (response: DataResponse<LoginResponseModel>) in
            print(url)
            switch response.result {
            case .success(let value):
                print("cooking ", value)
                //            let responseModel = Mapper<LoginResponseModel>().map(JSONString: value)
                success(value)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}

