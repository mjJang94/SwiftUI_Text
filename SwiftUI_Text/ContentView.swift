//
//  ContentView.swift
//  SwiftUI_Text
//
//  Created by Paymint on 2020/05/12.
//  Copyright © 2020 Paymint. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        VStack(spacing: 30){
            Text("폰트와 굵기 설정")
                .font(.title)
                .fontWeight(.black)
            
            Text("글자색은 foreground, 배경은 background")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
            
            Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선 적용!")
                .font(.custom("Menlo", size: 16))    //커스텀 폰트 적용
                .bold() //볼드체
                .italic() //이탤릭체
                .underline() //밑줄
                .strikethrough() //취소선
            
            Text("라인 수 제한과 \n 텍스트 정렬 기능입니다. \n 이건 안 보입니다.")
            .lineLimit(2) //텍스트를 최대 2줄까지만 표현
            .multilineTextAlignment(.leading) //다중행 문자열의 정렬 방식 지정
            .fixedSize() //주어진 공간의 크기가 작아도 텍스트를 생략하지 않고 표현되도록 설정
            
            //2개 이상의 텍스트를 하나로 묶어서 동시에 적용할 수도 있음.
            (Text("안녕🙈").kerning(8) //자간
                + Text("조정이 된다?").baselineOffset(8) //기준선
                    .font(.system(size:16)))
        }
 
    
    
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
