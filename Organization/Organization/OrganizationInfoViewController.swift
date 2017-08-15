    import UIKit

class OrganizationInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    private var salarySum: Int32 = 0
    public var organization: Organization?
    public var delegate: DataAccessProtocol?
    public let tableMixingNotificationName = "tableRandomize";
    public var organizations: NSArray?
    
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
        RequestManager.fetchOrganizations(closure: worker)
    }
    
    func worker(dictionary : [String : AnyObject])
    {
        guard let delegate = self.delegate else
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
                    currentOrganization = delegate.saveOrganization(value as! String)
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
                        let employee = delegate.saveEmployee(firstName, lastName: lastName, salary: salary, birthDate: nil)
                        org.addEmplsObject(employee!)
                    }
                    
                }
                
            }
        }
        organizations = delegate.getAllOrganization()! as NSArray;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return organizations!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(String(describing: organizations?[indexPath.row]))"
        return cell
    }
    
    
    @IBAction func randomizeOrder(_ sender: Any)
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: tableMixingNotificationName), object: nil);
        self.dismiss(animated: true, completion: nil)
    }
}
