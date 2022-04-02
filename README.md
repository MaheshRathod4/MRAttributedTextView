
# Overview

MRAttributedTextView is made with UiKit.It allows you to change the `font` and `color` of substrings and also handle substring `click` events.


## Usage/Example - 1 

```swift
 GeometryReader { proxy in 
    MRAttributedTextView(text: "We'will send you an One Time Password on this +918141691419",
                      subStrings: ["One Time Password","+918141691419"], 
                      width: proxy, 
                      onTapItemString: { value in
                       //handle actions
                        if value == "+918141691419" {
                        }
                     })
 }

```
![App Screenshot](https://user-images.githubusercontent.com/68275505/161385802-ca28aee4-6214-429f-b40f-cf43d65e9abe.gif)


## Example - 2

```swift
 GeometryReader { proxy in 
    MRAttributedTextView(text: "We'will send you an One Time Password on this +918141691419",
                        subStrings: ["One Time Password","+918141691419"],
                        width: proxy, 
                        textFont: .systemFont(ofSize: 16),
                        subsStringFont: .systemFont(ofSize: 16, weight: .bold), 
                        subsStringColor: .black, 
                        alignment: .center, 
                        onTapItemString: { value in
                               //handle actions
                           
                       })
 }
```

## Screenshot
![App Screenshot](https://user-images.githubusercontent.com/68275505/161385374-81993729-6ea5-440a-b00f-cb8154b40658.gif)

## Example - 3

```swift
 GeometryReader { proxy in 
    MRAttributedTextView(text: "By signing up you are agree to our Terms & Condition and Privacy Policy",
                        subStrings: ["Terms & Condition","Privacy Policy"], 
                        width: proxy, 
                        textFont: .systemFont(ofSize: 16), 
                        subsStringFont: .systemFont(ofSize: 16, weight: .bold), 
                        subsStringColor: .systemBlue, alignment: .center, 
                        onTapItemString: { value in
                            if value == "Privacy Policy" {
                                //handle action
                            } else {

                            }
                        })
}
```
## Screenshot
![App Screenshot](https://user-images.githubusercontent.com/68275505/161386339-a2d2962c-b75c-4dd3-a1cc-6adcb45aa351.gif)

## Example - 4
Note:- If you want padding, use padding horizontal with the same value as padding modifier. 
```swift 
 GeometryReader { proxy in 
    MRAttributedTextView(text: "By signing up you are agree to our Terms & Condition and Privacy Policy",
                        subStrings: ["Terms & Condition","Privacy Policy"], 
                        width: proxy, 
                        textFont: .systemFont(ofSize: 16), 
                        subsStringFont: .systemFont(ofSize: 16, weight: .bold),
                        subsStringColor: .systemBlue, 
                        alignment: .left,
                        paddingHorizontal: 8, // Mandatory
                        onTapItemString: { value in
                             //handle actions
                })
            .padding(8) //Same as paddingHorizontal value
}
```

## Screenshot
![App Screenshot](https://user-images.githubusercontent.com/68275505/161386832-5ee6f95e-fcc1-4c50-b53c-7070b8738127.gif)



## Feedback

If you have any feedback, please reach out to us at maheshr8484@gmail.com


- Special Thanks [@hamdan](https://gist.github.com/hamdan)


