import UIKit

class OrganizationInfoViewController: UIViewController
{
    
    public var organization: Organization?
    private var salarySum: Int32 = 0
    
    @IBAction func showDialog(_ sender: Any)
    {
        guard let empls = organization?.empls else {
            return
        }
        
        let org = empls.array.map{$0 as! Employee}
        salarySum = org.reduce(0, {result, employee in result+employee.salary})
        let dialog = UIAlertController(title: "Salart sum \(salarySum)", message: "salary summ", preferredStyle: .alert);
        let confirmButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        dialog.addAction(confirmButton)
        self.present(dialog, animated: true)
    }
}
