import UIKit
import MyFramework // Import your Objective-C framework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup UI
        self.view.backgroundColor = .white
        let greetButton = UIButton(type: .system)
        greetButton.setTitle("Greet", for: .normal)
        greetButton.addTarget(self, action: #selector(greetButtonTapped), for: .touchUpInside)

        greetButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(greetButton)

        NSLayoutConstraint.activate([
            greetButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            greetButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    @objc func greetButtonTapped() {
        let myObjcClass = MyObjcClass()
        myObjcClass.greet()  // Call the greet method
    }
}