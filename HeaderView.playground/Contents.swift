//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIImageView {
    
    func download(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async() {
                self.image = image
            }
        }
        task.resume()
    }
}

struct Resume: Codable {
    let firstName: String?
    let lastName: String?
    let intro: String?
    let photo: String?
    
    var fullName: String?{
        get{
            switch (firstName, lastName) {
            case (nil, nil):
                return nil
            case (let firstName?, let lastName?):
                return firstName + " " + lastName
            case (let firstName?, nil):
                return firstName
            case (nil, let lastName?):
                return lastName
            }
        }
    }

}

class InfoHeaderView: UIView {
    
    var profileView: UIImageView!
    var fullNameLabel: UILabel!
    var infoText: UILabel!
    var model: Resume!
    
    init(frame: CGRect, resume: Resume) {
        super.init(frame: frame)
        model = resume
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = .lightGray
        translatesAutoresizingMaskIntoConstraints = true
        
        widthAnchor.constraint(equalToConstant: frame.width)
        heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        //        if let superview = superview {
        //            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 0).isActive=true
        //            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: 0).isActive=true
        //            topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive=true
        //        }
        
        addPhotoView()
        addFullName()
        addInfoText()
        
        
    }
    
    func addPhotoView(){
        
        profileView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = UIColor.gray
        profileView.layer.borderColor = UIColor.white.cgColor
        profileView.layer.borderWidth = 1.0
        profileView.layer.cornerRadius = 5.0
        profileView.clipsToBounds = true
        addSubview(profileView)
        
        profileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive=true
        
        if let photo = model.photo, let url = URL(string: photo){
            profileView.download(from: url)
        }
    }
    
    func addFullName(){
        fullNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = model.fullName
        
        fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        fullNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10).isActive=true
        fullNameLabel.sizeToFit()
    }
    
    func addInfoText(){
        infoText = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        addSubview(infoText)
        infoText.translatesAutoresizingMaskIntoConstraints = false
        infoText.text = model.intro
        infoText.numberOfLines = 0
        infoText.textAlignment = .center
        infoText.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        infoText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        infoText.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        infoText.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        infoText.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10).isActive=true
        //        infoText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive=true
        
        infoText.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive=true
        infoText.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive=true
        
        infoText.sizeToFit()
    }
    
}

let resume = Resume(firstName: "Eugene", lastName: "Yagrushkin", intro: "Info", photo: "https://placekitten.com/250/250")

let frame = CGRect(x: 0, y: 0, width: 375, height: 200)
let headerView = InfoHeaderView(frame: frame, resume: resume)
headerView.layoutSubviews()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = headerView
