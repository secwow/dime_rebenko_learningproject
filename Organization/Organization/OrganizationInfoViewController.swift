import UIKit
import BigInt
import SVProgressHUD

class OrganizationInfoViewController: UIViewController
{
    private var salarySum: Int32 = 0
    public var organization: Organization?
    public var delegate: DataAccessProtocol?
    public let tableMixingNotificationName = "tableRandomize";
    public let reloadTableWithOrganizationName = "reloadWithOrganization";
    public var organizations: [Organization]?
    public var orgTable: UITableView?
    
    @IBAction func showDialog(_ sender: Any)
    {
        guard let empls = self.organization?.empls else
        {
            return
        }
        
        let employees = empls.array.map{$0 as! Employee}
        salarySum = employees.reduce(0, {result, employee in result + employee.salary})
        let dialog = UIAlertController(title: "Salart sum \(salarySum)", message: "salary summ", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        dialog.addAction(confirmButton)
        self.present(dialog, animated: true)
    }

    @IBAction func fetchOrganization(_ sender: Any)
    {
        RequestManager.fetchOrganizations(closure: jsonHandler)
    }
    
    func jsonHandler(dictionary : [String : AnyObject])
    {
        guard self.delegate != nil else
        {
            return
        }
        
        for org in dictionary["organizations"] as! NSArray
        {
           var currentOrganization: Organization?
           for (key, value) in org as! NSDictionary
            {
                
                if key as! String == "name"
                {
                    currentOrganization = self.delegate?.saveOrganization(value as! String)
                }
                
                if key as! String == "employees"
                {
                    guard let org = currentOrganization else
                    {
                        return
                    }
                    
                    for employee in value as! NSArray
                    {
                        let dicemp = employee as! Dictionary<String, AnyObject>
                        let firstName = dicemp["first_name"] as! String
                        let lastName = dicemp["last_name"] as! String
                        var salary: Int = 0;
                        salary = (dicemp["salary"] is Int) ? (dicemp["salary"] as! Int) : 0;
                        let employee = self.delegate?.saveEmployee(firstName, lastName: lastName, salary: salary, birthDate: nil)
                        org.addEmplsObject(employee!)
                    }
                }
            }
        }
        organizations = self.delegate?.getAllOrganization()
        createAndShow(orgs: organizations!)
    }

    func createAndShow(orgs: [Organization])
    {
        let actionDialog = UIAlertController(title: "Organizations", message: "Please, choose organization", preferredStyle: .actionSheet)
        
        for org in orgs
        {
            let orgItem = UIAlertAction(title: org.name, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                NotificationCenter.default.post(name:Notification.Name(rawValue:self.reloadTableWithOrganizationName), object: nil, userInfo: ["name": alert.title!])
                self.dismiss(animated: true, completion: nil)
            })
            actionDialog.addAction(orgItem)
        }
        
        self.present(actionDialog, animated: true)
    }
    
    func FibonacciN(n: Int) -> BigInt {
        
        var firstNumber: BigInt = 1
        var secondNumber: BigInt  = 1
        
        for _ in 0...n
        {
            let temp = secondNumber;
            secondNumber+=firstNumber
            firstNumber = temp;
        }
        
        return secondNumber;
    }
    
    @IBAction func calculateAsyn(_ sender: Any)
    {
        SVProgressHUD.show()
        DispatchQueue.global(qos: .background).async
            {
            let result = self.FibonacciN(n: 100000)
            print(result)
            DispatchQueue.main.sync
            {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    @IBAction func randomizeOrder(_ sender: Any)
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: tableMixingNotificationName), object: nil);
        self.dismiss(animated: true, completion: nil)
    }
}
