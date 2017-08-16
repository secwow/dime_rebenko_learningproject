import Foundation
import Alamofire

@objc class RequestManager: NSObject
{
    static func fetchOrganizations(closure: @escaping ([String : AnyObject]) -> Void)
    {
        Alamofire.request("http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json").responseJSON{ response in
                closure(response.value as! [String : AnyObject])
            }
    }
}
