import Foundation

import Alamofire

final class MovieInfoService {
    
    static let shared = MovieInfoService()
    
    private init() {}
    
    func Movie(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURL
        //let url = Config.baseURL + 지움
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        let dataRequest = AF.request(url,
                                     method: .get,
                                    // encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
//            dump(response)
          //  print(response.response?.statusCode, "ddd")
            switch response.result {
            case .success:
                print("😜😜😜😜😜")
                guard let statusCode = response.response?.statusCode else { return }
                
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(MovieInfo.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
    
    
}
