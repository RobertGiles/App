import UIKit

let defaults = UserDefaults(suiteName: "345App")

class CurrentGoalsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var tableRows: [String] = []
    @IBOutlet weak var addRowButton: UIBarButtonItem!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "rows", for: indexPath)
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "rows") as UITableViewCell
        cell.textLabel?.text = tableRows[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return tableRows.count
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableRows.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        //This is the edit button used to delete
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        storeData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func newRowPressed(_ sender: Any) {
        addTableRow()
    }
    func addTableRow(){
        //This creates a UI alert
        let alert = UIAlertController(title: "My Goal:", message: "Create your goal:", preferredStyle: .alert)
        //Adds a text field to the alert
        alert.addTextField{(textField) in
            textField.placeholder = "Enter goal here"
        }
        //Adds a confirm button
        alert.addAction(UIAlertAction(title: "Confirm Goal", style: .default, handler: {[weak alert](_) in
            let text = alert?.textFields![0]
            self.tableRows.append((text?.text)!)
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.reloadData()
        }))
        //Present alert
        self.present(alert, animated: true, completion: nil)
        storeData()
    }
    //storing app data
    func storeData(){
        defaults?.set(tableRows, forKey: "savedData")
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        defaults?.synchronize()
    }
    //getting app data
    func getData(){
        let data = defaults?.value(forKey: "savedData")
        if data != nil {
            tableRows = data as! [String]
        } else{
            
        }
    }
}
