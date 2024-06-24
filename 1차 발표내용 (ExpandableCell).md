# ExpandableCell
```swift
struct ExpandableNames {
    // 해당 섹션이 확장된 상태인지 아닌지 확인
    var isExpanded: Bool
    let country: String
    // 도시 이름
    let cities: [String]
}
```
```swift
// [수정]
// 해당 메소드는 Objective-C 호환일 필요가 없으므로 `@objc` 어노테이션 제거
func handleExpandClose(button: UIButton) {
    let section = button.tag 
    // button.tag 값을 이용해 섹션값 정의 , tableview각 버튼의 tag값 0부터 오름차순임
    // [수정]
    // `Bool`에 정의된 `toggle()` 메소드 사용
    button.isSelected.toggle()
        
    // [수정]
    // 기존 절차적 로직에서 함수형 프로그래밍 적용하여 리팩토링
    // `indexPaths`가 변수가 아닌 상수가 되면서 이후 코드에서 해당 변수의 값을 훼손시킬 염려가 없어짐
    let indexPaths = twoDimensionalArray[section].cities.enumerated()
        .map { offset, _ in IndexPath(row: offset, section: section) }
        
    twoDimensionalArray[section].isExpanded.toggle()
        
    if isExpanded {
        tableView.deleteRows(at: indexPaths, with: .fade)
    } else {
        tableView.insertRows(at: indexPaths, with: .fade)
    }
}
```
Section에 있는 Button을 눌렀을때 Data들이 펼쳐지거나, 닫혀지는 것이므로 각 tableView의 HeaderSection에 있는 Expandable하게 될 Button의 tag 값으로 Data들의 섹션값을 구별한다.

```swift
override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView.instantiate(CityChooseSection.self)
    // [수정]
    // 버튼의 태그값을 설정하는 것도 메소드를 통해서 하는 것이 좋아 보임
    headerView.configure(atSection: section, withTitle: twoDimensionalArray[section].country)
    headerView.delegate = self
    return headerView
}
```
테이블뷰의 헤더 섹션부분은 Xib로 커스텀을 했으며, 이 과정속에서 헤더섹션뷰의 foldButton의 tag값을 section으로 지정해줌으로서 Data들의 값들을 foldButton의 tag값으로 관리가 가능해졌다.

```swift
protocol CityChooseSectionDelegate: class {
    func cityChooseSection(_ view: UIView, didSelectButton button: UIButton)
}

class CityChooseSection: UIView {
    weak var delegate: CityChooseSectionDelegate?
    // [수정]
    // 접근수준을 internal에서 private으로 변경
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var foldButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foldButton.addTarget(self, action: #selector(touchUpFoldButton(_:)), for: .touchUpInside)
    }
    
    // [수정]
    // 메소드를 만들어 View를 초기화하는 것은 프로퍼티의 접근 수준을 낮추고 필요한 기능만 노출하려는 의도임
    // 현재는 프로퍼티가 외부에 공개되어 있으므로 메소드를 만드는 것이 의미가 없음
    // 그래서 프로퍼티의 접근 수준을 비공개로 설정하고, View를 초기화하기 위한 값을 매개변수로 설정함
    func configure(atSection section: Int, withTitle title: String) {
        foldButton.tag = section
        titleLabel.text = title
    }
  
    @objc private func touchUpFoldButton(_ sender: UIButton) {
        delegate?.cityChooseSection(self, didSelectButton: sender)
    }
}
```
 * Xib의 UIView 클래스 부분의 코드이다.
    
    * CityChooseSectionDelegate protocol TableView의 해당 Section에 맞는 버튼을 눌렀을때 올바르게 foldButton의 data전달이 되기 위한 delegate pattern이다.
    
      > 프로토콜이 델리게이트 패턴인 것은 아님. 델리게이트 패턴을 구현하기 위해 프로토콜을 활용하는 것.
      >
      > `CityChooseSectionDelegate` 프로토콜 : `CityChooseSection` 뷰의 책임을 위임하기 위한 Delegate Pattern을 적용하기 위해 정의한 프로토콜. 여기서는 TableView의 해당 Section에 맞는 버튼을 눌렀을 때의 처리를 위임하는 메소드 하나를 정의하였음
    
* `awakeFromNib()`
    
    * 공식문서의 정의: Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
    
    * 간단하게 해석 하자면 nib 파일에서로드 된 후 서비스를 위해 수신자를 준비하는 함수이다. 그래서 이 메소드 안에서 addTarget을 통해 foldButton에게 delegate패턴인 touchUpFoldButton을 지정해준다.
    
        > - `addTarget`은 타겟-액션 패턴을 위한 메소드임
        > - `touchUpFoldButton`은 액션 메소드임
        > - 액션 메소드가 델리게이트 프로토콜에 정의된 메소드를 호출한다는 식의 문장이 되어야 함
        >
        >  그래서 이 메소드에서 `addTarget(_:action:for:)` 메소드를 사용하여 `foldButton`의 터치업 이벤트에 대한 액션(`touchUpFoldButton(_:)`을 정의하고, 액션 메소드가 호출될 때 델리게이트의 `cityChooseSection(_:didSelectButton:)` 메소드를 호출하도록 한다.

```swift
extension CityChooseTableViewController: CityChooseSectionDelegate {
    func cityChooseSection(_ view: UIView, didSelectButton button: UIButton) {
        handleExpandClose(button: button)
    }
}
```
* 실질적인 ExpandableCell이 보여지는 CityChooseTableViewController에서 Delegate 패턴을 통해
  cityChooseSection 메소드로 handleExpandClose 메소드를 연결시켜서 작동되게 하는 코드.

  > 본문에 메소드를 언급할 때 메소드 시그니처를 밝히는 것이 좋음
  >
  > 실질적인 ExpandableCell이 보여지는 CityChooseTableViewController에서 Delegate 패턴을 통해
  > `cityChooseSection(_:didSelectButton:)` 메소드로 `handleExpandClose(button:)` 메소드를 연결시켜서 작동되게 하는 코드.

* 그리고 지정된 더미데이터의 크기 만큼 순차적으로 indexPath 배열을 만들어준다.

### 왜 indexPaths 배열을 만드는가?<br />

* 뒤에 사용될 `deleteRows(at:with:)`, `insertRows(at:with:)` 메소드의 indexPaths 파라미터는 indexPath로 이루어진 배열이므로.
```swift
let indexPaths = twoDimensionalArray[section].cities.enumerated()
    .map { offset, _ in IndexPath(row: offset, section: section) }

...

if isExpanded {
    tableView.deleteRows(at: indexPaths, with: .fade)
} else {
    tableView.insertRows(at: indexPaths, with: .fade)
}
```
