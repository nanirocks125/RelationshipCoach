//
//  PreferencesView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

import SwiftUI

struct CustomGenderPickerView: View {
    @AppStorage("gender") var gender: Gender = .female
    var genders: [Gender] = [.male, .female]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(genders, id: \.self) { genderOption in
                Button(action: {
                    gender = genderOption
                }) {
                    Text(genderOption.segmentTitle)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(gender == genderOption ? gender.color : Color.white)
                        .foregroundColor(gender == genderOption ? .white : .black)
                        .font(.system(size: 14))
                        .frame(height: 40)
                }
                .cornerRadius(8)
            }
        }
        .frame(width: 160, height: 40)
//        .background(Color.gray.opacity(0.5))
//        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.vertical)
    }
}

struct CustomGenderPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGenderPickerView()
    }
}


struct PreferencesView: View {
    @Environment(\.openURL) var openURL
    @State var routes: [PreferenceRoute] = []
    @ObservedObject var viewModel = PreferenceViewModel()
    @AppStorage("gender") var gender: Gender = .female
    @State private var isSharing = false
    

    var body: some View {
        NavigationStack(path: $routes) {
            VStack {
                ForEach(0..<viewModel.sections.count, id: \.self) { sectionIndex in
                    let section = viewModel.sections[sectionIndex]
                    
                    switch section.type {
                    case .legal, .coach, .settings:
                        Rectangle()
                            .fill(gender.color)
                            .frame(height: 30)
                            .overlay {
                                Text(section.type.title)
                                    .foregroundStyle(.white)
                            }
                    default:
                        EmptyView()
                    }
                    
                    ForEach(0..<section.preferenceItem.count, id: \.self) { itemIndex in
                        let item = section.preferenceItem[itemIndex]
                        switch section.type {
                        case .settings:
                            RCCardView(height: 72) {
                                HStack {
                                    Text(item.type.title)
                                    Spacer()
                                    CustomGenderPickerView()
                                }
                                .padding(.leading, 8)
                            }
                        case .copyright:
                            Text(item.type.title)
                        default:
                            RCCardView(height: 72) {
                                RelationshipCoachRowView(
                                    title: item.type.title,
                                    titleFontSize: UIPreferences.text,
                                    theme: Color.textColor
                                )
                                Image(gender.arrowAsset)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .aspectRatio(contentMode: .fit)
                            }
                            .onTapGesture {
                                let section = viewModel.sections[sectionIndex]
                                let item = section.preferenceItem[itemIndex]
                                switch item.type {
                                case .instagram:
                                    openInstagramProfile(username: "relationshipcoachllc")
                                case .share :
                                    self.isSharing = true
                                default:
                                    if let preferenceRoute = item.type.preferenceRoute {
                                        routes.append(preferenceRoute)
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .background(Color.backgroundColor)
            .padding(.vertical)
            .navigationDestination(for: PreferenceRoute.self) { route in
                switch route {
                case .preference:
                    PreferencesView()
                case .coach:
                    AboutCoachView()
                case .privacyPolicy:
                    PrivacyPolicyView()
                case .termsAndConditions:
                    TermsAndConditionsView()
                case .changeGender:
                    ChangeGenderView()
                }
            }
            .sheet(isPresented: $isSharing) {
                ShareSheet(activityItems: [appURL, appImage!])
            }
        }
        .tint(Color.white)
    }
    
    func openInstagramProfile(username: String) {
        let appURL = URL(string: "instagram://user?username=\(username)")!
        let webURL = URL(string: "https://www.instagram.com/\(username)/")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
}

extension PreferenceSection {
    
    func attributedString(for gender: Gender, size: CGFloat) -> AttributedString {
        switch type {
        case .copyright:
            var string = AttributedString(type.title)
            string.font = .system(size: size)
            if let linkRange = string.range(of: "Relationship Coach Camille") {
                string[linkRange].link = URL(string: "https://relationshipcoachllc.com/")
                string[linkRange].foregroundColor = UIColor(gender.color)
                string[linkRange].underlineColor = UIColor(gender.color)
                string[linkRange].underlineStyle = .single
                string[linkRange].font = .system(size: size, weight: .bold)
            }
            
            return string
        default:
            var string = AttributedString(type.title)
            string.font = .system(size: size)
            return string
        }
    }
    
    var maxHeight: Double {
        if type == .copyright {
            return 5.5
        } else {
            return 2
        }
    }
}

#Preview {
    NavigationStack {
        PreferencesView()
    }
}
