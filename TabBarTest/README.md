# TabBarTest

SwiftUI 탭바를 활용한 금융 앱 데모 프로젝트입니다. 이 프로젝트는 다양한 iOS 버전에서 호환되는 탭바 및 네비게이션 구현 방법을 보여줍니다.

## 주요 기능

- iOS 15 이상 호환 탭바 인터페이스
- 특정 탭 선택 시 전체 화면 표시 (머니 탭)
- 다양한 화면 간 네비게이션 구현
- 버전별 네비게이션 스택 처리 (iOS 16 이상과 iOS 15 간 호환성)

## 화면 구성

1. **홈 화면**: 앱의 메인 화면
2. **머니 화면**: 
   - 자산 관리 기능
   - 거래 내역 조회
   - 이체 기능
   - 계좌 설정 기능
3. **프로필 화면**: 사용자 정보 관리

## 구현 내용

- `ContentView`: 메인 탭바 및 앱 구조 관리
- `MoneyView`: 금융 기능 화면 구현
- `NavigationStackModifier`: iOS 버전별 네비게이션 처리를 위한 유틸리티

## 개발 환경

- SwiftUI 
- Xcode 16.4
- iOS 15.0 이상 지원

## 작성자

김규철
