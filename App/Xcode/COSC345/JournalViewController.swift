import UIKit

var editDataArray: [String] = Array()

class JournalViewController: UIViewController {
    
    
    @IBOutlet weak var journalLabel: UILabel!
    

    
    @IBOutlet weak var journalinput: UITextField!
    
    
    @IBAction func JournalNewEntry(_ sender: AnyObject) {
        
        journalinput.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journalLabel.text = list[myrowIndex]
      
        
       // DisplayField.text = journallist[myJournalIndex]
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
