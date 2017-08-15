import Foundation
import Alamofire

@objc class RequestManager: NSObject
{
    static func fetchOrganizations(String : AnyObject)
    {
        
        Alamofire.request("http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json").responseJSON
        { response in
            print(response.result.value as! String);
        }
        
    }
}
