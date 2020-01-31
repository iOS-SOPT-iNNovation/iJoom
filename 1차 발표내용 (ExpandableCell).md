# ExpandableCell
***
```swift
struct ExpandableNames {
    var isExpanded: Bool
    let country : String
    let cities  : [String]
}
```
* isExpanded: 변수로 셀들이 확장된 상태인지 아닌지 확인<br />
* cities: 도시들을 저장할 구조체 안의 문자열 배열
```swift
 @objc func handleExpandClose(button: UIButton) {
        
        let section = button.tag 
        // button.tag 값을 이용해 섹션값 정의 , tableview각 버튼의 tag값 0부터 오름차순임
        button.isSelected = !button.isSelected
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].cities.indices{
            print(0,row)
            let indexPath = IndexPath(row: row, section:  section)
            indexPaths.append(indexPath)
            
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        
        twoDimensionalArray[section].isExpanded = !isExpanded
        

        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
            
        } else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
    }
```
* Section에 있는 Button을 눌렀을때 Data들이 펼쳐지거나, 닫혀지는 것이므로 <br />
* 각 tableView의 HeaderSection에 있는 Expandable하게 될 Button의 tag 값으로 Data들의 섹션값을 구별한다.<br />

```swift
override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
let headerView = UIView.instantiate(CityChooseSection.self)
headerView.foldButton.tag = section

headerView.configure(with:  twoDimensionalArray[section].country)
headerView.delegate = self
return headerView
}
```
* 위의 코드를 보면 테이블뷰의 헤더 섹션부분은 Xib로 커스텀을 했으며, 이 과정속에서 헤더섹션뷰의 foldButton의 tag값을 section으로 <br />
* 지정해줌으로서 Data들의 값들을 foldButton의 tag값으로 관리가 가능해졌다.

```swift
protocol CityChooseSectionDelegate: class {
    func cityChooseSection(_ view: UIView, didSelectButton button: UIButton)
}

class CityChooseSection: UIView {
    weak var delegate: CityChooseSectionDelegate?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foldButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foldButton.addTarget(self, action: #selector(touchUpFoldButton(_:)), for: .touchUpInside)
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    @objc private func touchUpFoldButton(_ sender: UIButton) {
        delegate?.cityChooseSection(self, didSelectButton: sender)
    }
}
```
 * 위의 코드 =Xib의 UIView 클래스 부분의 코드이다. <br />
    * CityChooseSectionDelegate protocol TableView의 해당 Section에 맞는 버튼을 눌렀을때 올바르게 foldButton의 data전달이 되기 위한 delegate pattern이다.<br />
* awakeFromNib() <br />
    공식문서의 정의: Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file. <br />
* 간단하게 해석 하자면 nib 파일에서로드 된 후 서비스를 위해 수신자를 준비하는 함수이다. 그래서 이 메소드 안에서 addTarget을 통해 foldButton에게 delegate패턴인 touchUpFoldButton을 지정해준다.

```swift
extension CityChooseTableViewController: CityChooseSectionDelegate {
    func cityChooseSection(_ view: UIView, didSelectButton button: UIButton) {
        handleExpandClose(button: button)
    }
}
```
* 실질적인 ExpandableCell이 보여지는 CityChooseTableViewController에서 Delegate 패턴을 통해
cityChooseSection 메소드로 handleExpandClose 메소드를 연결시켜서 작동되게 하는 코드.

* 그리고 지정된 더미데이터의 크기 만큼 순차적으로 indexPath 배열을 만들어준다.<br />
* #### 왜 indexPaths 배열을 만드는가?<br />
* 뒤에 사용될 deleteRows,insertRows 메소드의 indexPaths 파라미터는 indexPath로 이루어진 배열이므로.
```swift
var indexPaths = [IndexPath]()
       for row in twoDimensionalArray[section].cities.indices{
           print(0,row)
           let indexPath = IndexPath(row: row, section:  section)
           indexPaths.append(indexPath)
           
       }
       
       ....
       
       
       if isExpanded{
                  tableView.deleteRows(at: indexPaths, with: .fade)
                  
              } else{
                  tableView.insertRows(at: indexPaths, with: .fade)
              }
```
