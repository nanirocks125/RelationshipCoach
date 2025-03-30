//
//  ChangeGenderView.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
}

extension Gender {
    var color: Color {
        switch self {
        case .male:
            return Color.maleColor
        case .female:
            return Color.femaleColor
        }
    }
    
    var id: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        }
    }
}

struct ChangeGenderView: View {
    
    @AppStorage("gender") var gender: Gender = .female
    
    @State var genders: [Gender] = [.female, .male]
    
    var body: some View {
        VStack {
            Text("Select Gender")
            
            ForEach(genders, id: \.self) { gender in
                Text(gender.rawValue)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(.white)
                    .foregroundStyle(gender.color)
                    .border(.blue, width: 1)
                    .padding(.horizontal)
                    .onTapGesture {
                        self.gender = gender
                    }
            }
            Spacer()

        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Change Gender")
                    .foregroundColor(.white)
            }
        }
        .toolbarBackground(gender.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ChangeGenderView()
}
