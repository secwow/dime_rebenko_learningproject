import Foundation
import Alamofire

@objc class RequestManager: NSObject
{
    static func fetchOrganizations(closure: @escaping ([String : AnyObject]) -> Void)
    {
        Alamofire.request("http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json").responseJSON{ response in
                let result = try? JSONSerialization.jsonObject(with: response.data!, options: [])
                closure(result as! [String : AnyObject])
            }
    }
}
