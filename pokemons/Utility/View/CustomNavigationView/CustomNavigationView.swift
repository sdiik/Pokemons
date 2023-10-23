//
//  CustomNavigationView.swift
//  testing
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct CustomNavigationView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = CustomNavigationViewModel()
    
    
    var backTapped: () -> Void = {}
    
    var body: some View {
        render()
    }

    private func render() -> some View {
        renderNavigatonView()
    }
    
    private func renderTitle() -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(vm.title)
                .multilineTextAlignment(.leading)
                .font(Font.headline.weight(.semibold))
        }
    }
    
    private func renderLeftButton() -> some View {
        Button {
            if vm.isCustomBackButtonAction {
                backTapped()
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        } label: {
            Image(systemName: "arrow.left")
        }
    }

    private func renderRightButton() -> some View {
        Button {
            print("action right button")
        } label: {
            Image(systemName: "arrow.right")
        }
    }
    
    private func renderLine() -> some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: UIScreen.main.bounds.width, height: 1.5)
            .foregroundColor( Color.gray
                .opacity(0.1))
            .shadow(color: Color.gray.opacity(0.5), radius: 1.5, x: -2, y: 2)
    }
    
    private func renderNavigatonView() -> some View  {
        VStack(spacing: 16) {
            HStack(alignment: .center,  spacing: 16) {
                if !vm.isHiddenLeftButton {
                    renderLeftButton().frame(width: 22)
                }
                if vm.isCenterTitleNavigation {
                    Spacer()
                }
                renderTitle()
                Spacer()
                if !vm.isHiddenRightButton {
                    renderRightButton().frame(width: 22)
                }
            }.padding(.horizontal, 16)
            renderLine()
        }.padding(.top, 8)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
