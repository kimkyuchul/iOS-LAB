//
//  NavigationStackModifier.swift
//  TabBarTest
//
//  Created by 김규철 on 3/27/25.
//

import SwiftUI

// MARK: - iOS 버전별 네비게이션 처리를 위한 ViewModifier
struct NavigationStackModifier<Destination: View>: ViewModifier {
    let destination: Destination
    let isActive: Binding<Bool>
    
    func body(content: Content) -> some View {
        if #available(iOS 16, *) {
            // iOS 16 이상에서는 NavigationStack 사용
            content
                .navigationDestination(isPresented: isActive) {
                    destination
                }
        } else {
            // iOS 15에서는 NavigationLink 사용
            content
                .background(
                    NavigationLink(
                        destination: destination,
                        isActive: isActive,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
        }
    }
}

// MARK: - 뷰 확장 함수 추가
extension View {
    func navigationDestination<Destination: View>(
        isActive: Binding<Bool>,
        destination: @escaping () -> Destination
    ) -> some View {
        modifier(NavigationStackModifier(
            destination: destination(),
            isActive: isActive
        ))
    }
}

// MARK: - 머니 컨테이너 뷰
struct MoneyContainerView: View {
    @Binding var isPresented: Bool
    @Binding var selectedTab: Int
    
    var body: some View {
        // 최소 iOS 버전에 맞게 네비게이션 처리
        if #available(iOS 16, *) {
            NavigationStack {
                MoneyView(isPresented: $isPresented, selectedTab: $selectedTab)
                    .navigationBarHidden(true)
            }
        } else {
            NavigationView {
                MoneyView(isPresented: $isPresented, selectedTab: $selectedTab)
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(.stack)
        }
    }
}
