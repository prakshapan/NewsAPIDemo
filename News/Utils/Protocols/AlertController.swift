import UIKit
protocol AlertController { }

extension UIViewController: AlertController {}

extension AlertController where Self: UIViewController {

    func showAlert(title: String? = nil, message: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func showAlert(title: String? = nil, message: String? = nil, didTapOK: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
            didTapOK?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func showAlertWithCancel(title: String? = nil, message: String? = nil, okTitle: String = "Ok", didTapOK: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
            didTapOK?()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    func showAlertWithSettings(title: String, message: String) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in }
        alertController.addAction(okAction)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let url = NSURL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(url as URL)
        }
        alertController.addAction(settingsAction)

        present(alertController, animated: true, completion: nil)
    }
}
