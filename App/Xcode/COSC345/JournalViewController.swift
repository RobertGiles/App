import UIKit

var editDataArray: [String] = Array()

/* Class declaration for a JournalViewController that holds an individual entry in the diary*/
class JournalViewController: UIViewController {
    @IBOutlet weak var fixedDate: UITextField!
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var journalinput: UITextField!
    @IBAction func JournalNewEntry(_ sender: AnyObject) {
        journalinput.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        journalLabel.text = list[myrowIndex]
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: date)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let updatedString = formatter.string(from: yourDate!)
        print(updatedString)
        fixedDate.text = updatedString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
