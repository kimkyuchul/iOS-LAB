# Autolayout-LAB
Autolayout programmatically 

## Autolayout의 핵심
- 해당 뷰의 X,y 위치 
- 해당 뷰의 가로, 세로 크기
 (양쪽에 CONSTRAINT 걸어져 있으면 Width를 잡아도 CONSTRAINT 충돌이 발생)
 
## snapkit 이슈
- ld: framework not found Pods (https://stackoverflow.com/questions/29865899/ld-framework-not-found-pods?page=1&tab=votes#tab-top)
-  기존 실행하던 .xcodeproj 대신 새로 생성된 .xcworkspace 를 실행
- cannot preview in this file crashed (https://velog.io/@quokka/cannot-preview-in-this-file-crashed)
- crashed due to an uncaught exception `NSGenericException`. Reason: Unable to activate constraint with anchors => addSubView를 안하고 constraint를 해서
