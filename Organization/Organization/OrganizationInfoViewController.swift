    import UIKit

class OrganizationInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
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
        organizations = delegate.getAllOrganization();
        creteAndShow(orgs: organizations!)
    }

    func creteAndShow(orgs: [Organization])
    {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        orgTable = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight-barHeight))
        orgTable?.register(UITableViewCell.self, forCellReuseIdentifier: "orgCell")
        orgTable?.dataSource = self
        orgTable?.delegate = self
        self.view.addSubview(orgTable!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = self.orgTable?.cellForRow(at: indexPath);
        let orgName = cell!.textLabel?.text!
        NotificationCenter.default.post(name:Notification.Name(rawValue:reloadTableWithOrganizationName), object: nil, userInfo: ["name": orgName!])
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return organizations!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orgCell", for: indexPath as IndexPath)
        cell.textLabel!.text =  organizations?[indexPath.row].name
        return cell
    }
    
    @IBAction func randomizeOrder(_ sender: Any)
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: tableMixingNotificationName), object: nil);
        self.dismiss(animated: true, completion: nil)
    }
}
