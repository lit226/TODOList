import UIKit

// Customize this view
@objc
class FullListViewController: UIViewController, UITextViewDelegate {

    lazy var titleField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1
        field.placeholder = "Type your title here..."

        return field
    }()

    lazy var descriptionField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1
        field.placeholder = "Type your description here..."

        return field
    }()

    lazy var listItemField: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.text = "Add your keys here"
        field.textColor = .lightGray
        field.borderStyle = .none
        field.layer.borderWidth = 1
        field.isScrollEnabled = true
        field.delegate = self

        return field
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .circular
        button.setTitle("Add", for: .normal)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        view.addSubview(titleField)
        view.addSubview(descriptionField)
        view.addSubview(listItemField)
        view.addSubview(addButton)
        
        addConstraints()
    }

    private func addConstraints() {
        let constraints: [NSLayoutConstraint] = [
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            titleField.bottomAnchor.constraint(equalTo: descriptionField.topAnchor, constant: -30),

            descriptionField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.topAnchor.constraint(equalTo: listItemField.bottomAnchor, constant: 30),
            descriptionField.bottomAnchor.constraint(equalTo: listItemField.topAnchor, constant: -30),

            listItemField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            listItemField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listItemField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 30),
            listItemField.heightAnchor.constraint(equalToConstant: 100),
            
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.topAnchor.constraint(equalTo: listItemField.bottomAnchor, constant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    func addTarget(target: Any, selector: Selector) {
        addButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = "Add your keys here"
        textView.textColor = .lightGray
    }

    @objc
    func getViewData() -> ListViewData! {
        guard let title = titleField.text, let description = descriptionField.text else {
            return nil
        }

        let list = listItemField.text.components(separatedBy: CharacterSet.newlines)
        let array = NSMutableArray(array: list)
        return ListViewData(titleText: title, descriptionText: description, task: array , viewControllerType: .mainViewController)
    }
}
