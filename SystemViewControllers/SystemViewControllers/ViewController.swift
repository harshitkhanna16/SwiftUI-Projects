//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by GEU on 15/01/26.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageViewOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard  let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        imageViewOutlet.image = image
        dismiss(animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
        print("I am Working")
        dismiss(animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        if let image = imageViewOutlet.image {
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = sender as? UIView
            present(activityViewController, animated: true)
            
        }
    }
    
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.modalPresentationStyle = .popover
            present(safariViewController, animated: true)
        }
    }
    
    
    @IBAction func alertButtonTapped(_ sender: Any) {
        let alertVC = UIAlertController(title: "Alert", message: "Do you wish to continue?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            _ in print("Cancelled")
        }
        let okAction = UIAlertAction(title: "Yes", style: .default) {
            _ in print("Yes")
        }
        let noAction = UIAlertAction(title: "No", style: .destructive) {
            _ in print("Deletion")
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(okAction)
        alertVC.addAction(noAction)
        present(alertVC, animated: true)
        
        
    }
    
    
    @IBAction func photoButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    
    @IBAction func mailButtonTapped(_ sender: Any) {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["test@test.com"])
        mailComposer.setMessageBody("Hello World", isHTML: false)
        
        if MFMailComposeViewController.canSendMail() {
            present(mailComposer, animated: true)
        } else {
            print("Cannot send the mail")
        }
  
    }
}

