import UIKit

class OrganizationInfoViewController: UIViewController
{
    var organization: Organization?
    var salarySum: Int32=0
    
    func setOrganization(org: Organization)
    {
        organization = org;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func showDialog(_ sender: Any)
    {
        for empl in (organization?.empls)!
        {
            salarySum+=(empl as! Employee).salary;
        }
        
        let dialog = UIAlertController(title: "Salart sum \(salarySum)", message: "salary summ", preferredStyle: UIAlertControllerStyle.alert);
        let confirmButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        dialog.addAction(confirmButton)
        self.present(dialog, animated: true)
    }

    @IBAction func randomizeOrder(_ sender: Any)
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"tableRandomize"), object: nil);
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
}
