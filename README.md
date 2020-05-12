# SwiftUI의 Text 관련 포스팅

- 핵심 코드

<pre>
<code>
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
</pre>
</code>

# 수식어 적용 순서 유의사항
1. font 와 foregroundColor 수식어를 보면 아래와 같은 차이가 있다.   
<pre>
<code>
extenstion Text{
  public func font(_font: Font?) -> Text
  public func foregroundColor(_ color: Color?) -> Text}
}

extenstion View{
  public func font(_ font: Font?) -> some View
  public func foregroundColor(_ color: Color?) -> some View
}
}
</pre>
</code>
위 두 코드를 보면 서로 반환타입니다 다르다.
이러한 것들이 의미하는 바는 수식어를 적용할 때는 순서가 중요하는말이 되겠다.
적용되는 시적에 따라 서로 다르게 동작하게 되므로, 뷰 프로토콜의 공용 수식어를 적용하기 전에 각 뷰가 가진 전용 수식어를 구분해서 우선 적용해야한다.    
    
2. 코드 내에서 내용이 동일하고 뷰의 크기를 나타내는 사각형 테두리를 똑같이 그려도, 수식어를 적용하는 순서 차이에 따라 배경색의 범위가 달라진다.
