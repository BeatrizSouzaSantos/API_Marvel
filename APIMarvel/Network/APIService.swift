//
//  APIService.swift
//  APIMarvel
//
//  Created by beatiz de souza santos on 13/05/21.
//

import UIKit
import Alamofire
import CryptoKit
import Kingfisher

class ApiServices {
    
    class ApiServices {
        
        public static let get = HTTPMethod(rawValue: "GET")
        let baseURL: String = "http://gateway.marvel.com/v1public/chacters"
        let privateKey = "d79529e145892f3e5abc15713ef5b7e53c17c7f9"
        let publicKey = "f745dc0bac069b1ebabaad8ec70c5ce5"
        let ts = String(Date().timeIntervalSince1970)

        //MARK: - Request
        
        public func apiRequest() {
            
            let parameters = ["ts" : ts, "hash" : self.getMD5(), "apyKey" : publicKey]
        
            let request = AF.request(baseURL, parameters: parameters)
            request.responseJSON { (data) in print(data)
            let characters = try! JSONDecoder().decode(Character.self, from: data.data!)
                print(Characters.data.results)
        }
    }
        
      //MARK: - MD5
        private func getMD5 () ->  String {
            let apiData = ts + privateKey + publicKey
            guard let data = apiData.data(using: .utf8) else {return String() }
            let apiHash = Insecure.MD5.hash(data: data)
            return apiHash.map { String(format: "%02hhx", $0) }.joined()
    
    }

}

}
