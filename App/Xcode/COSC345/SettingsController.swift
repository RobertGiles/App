import UIKit

class SettingsController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var myImageView: UIImageView!
    /* Selects the image from the users phone */
    @IBAction func importimage(_ sender: Any)
    {
        let userimage = UIImagePickerController()
        userimage.delegate = self
        userimage.sourceType = UIImagePickerControllerSourceType.photoLibrary
        userimage.allowsEditing = false
        self.present(userimage, animated: true)
        {

        }
    }
    /* Brings the image into a local variable */
    @IBOutlet weak var inputButton: UIButton!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let userimage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            backgroundView.image = userimage
             self.inputButton.isHidden = true
        }
        else
        {
            // Error Message
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var backgroundView: UIImageView!
    /* Sets the image as a temporary background */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Relaxing Image"
        let imageThatIgetFromSomewhere = UIImage(named: "userimage")
        if let image = imageThatIgetFromSomewhere {
            backgroundView.image = image
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
