import UIKit

var myrowIndex = 0
var list: [String] = []

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let listUserDefault = UserDefaults.standard
    
    @IBOutlet weak var myTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell") as UITableViewCell
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            list.remove(at: indexPath.row)
            listUserDefault.set(list, forKey: "best")
            myTableView.reloadData()
        }
    }
    
    @IBOutlet weak var input: UITextField!

    @IBAction func additem(_ sender: Any) {
        if(input.text != "")
        {
            list.append(input.text!)
            input.text = ""
            listUserDefault.set(list, forKey: "best")
            myTableView.reloadData()
        }
    }

    func printLog(log: AnyObject?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS "
        print(formatter.string(from: Date()))
        if log == nil {
            print("nil")
        }
        else {
            print(log!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = UITableViewAutomaticDimension

        self.title = "Diary"
        // Do any additional setup after loading the view.
        
        self.input.delegate = self as? UITextFieldDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    //myIndex is always the cell that the user taps on
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myrowIndex = indexPath.row
        performSegue(withIdentifier: "JournalConnect", sender: self)
    }
}
