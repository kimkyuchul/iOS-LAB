//
//  ContentView.swift
//  TabBarTest
//
//  Created by 김규철 on 3/27/25.
//

import SwiftUI

struct HomeContainerView<Content: View>: View {
    private let tabbar: () -> Content
      
    public init(
      tabbar: @autoclosure @escaping () -> Content
    ) {
      self.tabbar = tabbar
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HomeView()
            
            tabbar()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showMoneyView = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // 첫 번째 탭 - 홈
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }
                .tag(0)
            
            // 두 번째 탭 - 머니 (비어있는 화면)
            Color.clear
                .tabItem {
                    Label("머니", systemImage: "dollarsign.circle.fill")
                }
                .tag(1)
            
            // 세 번째 탭 - 프로필
            ProfileView()
                .tabItem {
                    Label("프로필", systemImage: "person.fill")
                }
                .tag(2)
        }
        .accentColor(.blue)
        .onChange(of: selectedTab) { newValue in
            if newValue == 1 {
                // 머니 탭이 선택되면 Money 뷰를 표시
                showMoneyView = true
            }
        }
        .fullScreenCover(isPresented: $showMoneyView) {
            MoneyContainerView(isPresented: $showMoneyView, selectedTab: $selectedTab)
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("홈 화면")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "house.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .padding()
            
            Text("여기에 홈 화면 콘텐츠를 추가하세요")
                .font(.headline)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("프로필")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "person.circle.fill")
                .font(.system(size: 120))
                .foregroundColor(.blue)
                .padding()
            
            Text("사용자 이름")
                .font(.title)
                .bold()
            
            Text("user@example.com")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Divider()
                .padding(.vertical)
            
            VStack(spacing: 15) {
                Button(action: {
                    // 설정 액션
                }) {
                    HStack {
                        Label("설정", systemImage: "gear")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    // 도움말 액션
                }) {
                    HStack {
                        Label("도움말", systemImage: "questionmark.circle")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    // 앱 정보 액션
                }) {
                    HStack {
                        Label("앱 정보", systemImage: "info.circle")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
