import UIKit
import WebKit

class LivingWithInfoViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // What to do on view load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // What to do on view appearing
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "http://www.anxiety.org.nz")!
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
