//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


struct ResumeColors {
    
    static let white = UIColor.white
    static let gray0 = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
    static let gray1 = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    
}

struct ResumeFonts {
    
    static let H1 = UIFont.boldSystemFont(ofSize: 16)
    static let H2 = UIFont.boldSystemFont(ofSize: 14)
    static let H3 = UIFont.systemFont(ofSize: 13)
    
}

extension UIImageView {
    
    func download(from url: URL?) {
        
        guard let url = url else {
            return
        }
        
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
    let photo: URL?
    
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
    
    var resume: Resume?{
        didSet{
            profileView.download(from: resume?.photo)
            fullNameLabel.text = resume?.fullName
            introLabel.text = resume?.intro
        }
    }
    
    private let profileView : UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.backgroundColor = ResumeColors.gray0
        imgView.layer.borderColor = ResumeColors.white.cgColor
        imgView.layer.borderWidth = 1.0
        imgView.layer.cornerRadius = 5.0
        imgView.clipsToBounds = true
        
        return imgView
    }()
    
    private let fullNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = ResumeFonts.H1
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    private let introLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = ResumeFonts.H3
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = ResumeColors.gray1
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        addPhotoView()
        addFullName()
        addInfoText()
    }
    
    func addPhotoView(){
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive=true
        
    }
    
    func addFullName(){
        addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        fullNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10).isActive=true
    }
    
    func addInfoText(){
        addSubview(introLabel)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        
        introLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        introLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        introLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        introLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10).isActive=true
        introLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive=true
        introLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive=true
        introLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive=true
        
    }
    
}
let resume = Resume(firstName: "Eugene", lastName: "Yagrushkin", intro: "Info", photo: URL(string: "https://placekitten.com/250/250")!)

let frame = CGRect(x: 0, y: 0, width: 375, height: 200)
let headerView = InfoHeaderView(frame: frame)
headerView.resume = resume
headerView.layoutSubviews()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = headerView
