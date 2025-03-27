//
//  MoneyView.swift
//  TabBarTest
//
//  Created by 김규철 on 3/27/25.
//

import SwiftUI

// MARK: - 머니 메인 뷰
struct MoneyView: View {
    @Binding var isPresented: Bool
    @Binding var selectedTab: Int
    @State private var balance = 1250000
    @State private var selectedCategory = 0
    
    // 네비게이션 상태 관리
    @State private var showTransactionDetail = false
    @State private var showTransferMoney = false
    @State private var showAccountSetting = false
    @State private var selectedTransactionId = 1
    
    var categories = ["전체", "수입", "지출", "투자"]
    
    var body: some View {
        VStack {
            // 공통 헤더
            HStack {
                Spacer()
                
                Text("내 자산")
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    // 닫기 버튼 클릭 시 먼저 탭을 0번으로 변경한 후 화면 닫기
                    selectedTab = 0
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            
            // 메인 컨텐츠
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("\(formattedBalance)원")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.blue)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            // 입금 액션
                        }) {
                            VStack {
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.green)
                                Text("입금")
                                    .font(.subheadline)
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        Button(action: {
                            // 출금 액션
                        }) {
                            VStack {
                                Image(systemName: "arrow.up.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.red)
                                Text("출금")
                                    .font(.subheadline)
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                        
                        Button(action: {
                            showTransferMoney = true
                        }) {
                            VStack {
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                Text("이체")
                                    .font(.subheadline)
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                    }
                }
                .padding(.bottom, 20)
                
                // 카테고리 선택
                Picker("카테고리", selection: $selectedCategory) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        Text(categories[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                // 계좌 설정 버튼
                Button(action: {
                    showAccountSetting = true
                }) {
                    HStack {
                        Image(systemName: "gear")
                        Text("계좌 설정")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                // 거래 내역 목록
                VStack(alignment: .leading) {
                    Text("최근 거래내역")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(1...10, id: \.self) { i in
                                Button(action: {
                                    selectedTransactionId = i
                                    showTransactionDetail = true
                                }) {
                                    TransactionRow(
                                        title: "거래 내역 \(i)",
                                        amount: Int.random(in: 1000...100000) * (i % 3 == 0 ? -1 : 1),
                                        date: "2025-03-\(i < 10 ? "0\(i)" : "\(i)")"
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.top)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.bottom)
        
        // iOS 버전별 네비게이션 구현
        .navigationDestination(isActive: $showTransactionDetail) {
            TransactionDetailView(
                transactionId: selectedTransactionId,
                dismissAction: { isPresented = false }
            )
            .navigationBarHidden(true)
        }
        .navigationDestination(isActive: $showAccountSetting) {
            AccountSettingView(
                dismissAction: { isPresented = false }
            )
            .navigationBarHidden(true)
        }
        .navigationDestination(isActive: $showTransferMoney) {
            TransferMoneyView(
                dismissAction: { isPresented = false }
            )
            .navigationBarHidden(true)
        }
    }
    
    var formattedBalance: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: balance)) ?? "\(balance)"
    }
}

// 거래 상세 화면
struct TransactionDetailView: View {
    let transactionId: Int
    var dismissAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 60))
                .foregroundColor(.blue)
                .padding()
            
            Text("거래 #\(transactionId) 상세 정보")
                .font(.title2)
                .bold()
            
            VStack(alignment: .leading, spacing: 15) {
                DetailRow(title: "거래 종류", value: transactionId % 3 == 0 ? "출금" : "입금")
                DetailRow(title: "거래 일시", value: "2025-03-\(transactionId < 10 ? "0\(transactionId)" : "\(transactionId)") 14:30")
                DetailRow(title: "거래 금액", value: "\(Int.random(in: 1000...100000))원")
                DetailRow(title: "거래처", value: "거래처 \(transactionId)")
                DetailRow(title: "메모", value: "거래 메모 내용 #\(transactionId)")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button("전체 닫기") {
                if let dismiss = dismissAction {
                    dismiss()
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.top)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("거래 상세")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 계좌 설정 화면
struct AccountSettingView: View {
    @State private var notifications = true
    @State private var autoPay = false
    @State private var biometricAuth = true
    @State private var showTransferMoney = false
    var dismissAction: (() -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                SettingSection(title: "알림 설정") {
                    SettingToggleRow(title: "거래 알림", isOn: $notifications)
                    SettingToggleRow(title: "자동 결제", isOn: $autoPay)
                    SettingToggleRow(title: "생체 인증", isOn: $biometricAuth)
                }
                
                SettingSection(title: "계좌 정보") {
                    SettingRow(title: "계좌번호", detail: "123-456-789012")
                    SettingRow(title: "은행", detail: "스위프트 은행")
                    SettingRow(title: "계좌 종류", detail: "보통예금")
                }
                
                Button(action: {
                    showTransferMoney = true
                }) {
                    Text("로그아웃")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button("전체 닫기") {
                    if let dismiss = dismissAction {
                        dismiss()
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.top)
        }
        .background(Color(.systemGray6))
        .navigationDestination(isActive: $showTransferMoney) {
            TransferMoneyView(
                dismissAction: { }
            )
        }
    }
}

// 이체 화면
struct TransferMoneyView: View {
    @State private var recipient = ""
    @State private var amount = ""
    @State private var memo = ""
    @State private var selectedBank = 0
    var dismissAction: (() -> Void)?
    
    let banks = ["스위프트 은행", "코틀린 은행", "플러터 은행", "리액트 은행"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 은행 선택
                VStack(alignment: .leading) {
                    Text("은행 선택")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Picker("은행", selection: $selectedBank) {
                        ForEach(0..<banks.count, id: \.self) { index in
                            Text(banks[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                // 계좌번호 입력
                VStack(alignment: .leading) {
                    Text("계좌번호")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    TextField("계좌번호를 입력하세요", text: $recipient)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // 금액 입력
                VStack(alignment: .leading) {
                    Text("이체 금액")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    TextField("금액을 입력하세요", text: $amount)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // 메모 입력
                VStack(alignment: .leading) {
                    Text("메모")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    TextField("메모를 입력하세요", text: $memo)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // 이체 버튼
                Button(action: {
                    // 이체 액션
                }) {
                    Text("이체하기")
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                Button("전체 닫기") {
                    if let dismiss = dismissAction {
                        dismiss()
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle("이체하기")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGray6))
    }
}

// 상세 행 컴포넌트
struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(value)
                .bold()
        }
    }
}

// 설정 섹션 컴포넌트
struct SettingSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            VStack(spacing: 0) {
                content
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

// 설정 행 컴포넌트
struct SettingRow: View {
    let title: String
    let detail: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text(detail)
                .foregroundColor(.gray)
        }
        .padding()
        
        Divider()
    }
}

// 설정 토글 행 컴포넌트
struct SettingToggleRow: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding()
        
        Divider()
    }
}

struct TransactionRow: View {
    let title: String
    let amount: Int
    let date: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text("\(amount >= 0 ? "+" : "")\(formattedAmount)원")
                    .foregroundColor(amount >= 0 ? .blue : .red)
                    .font(.headline)
            }
            .padding()
            
            Divider()
        }
    }
    
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: abs(amount))) ?? "\(abs(amount))"
    }
}
