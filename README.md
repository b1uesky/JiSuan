# JiSuan
> A Simple && Light-weight **inline** text calculator, which realeases your hands.  
> 妈咪问，挖掘机技术哪家强？  
> 你说，中国山东找蓝翔！  

### OS Requirement:  
  - [x] Mac OS
  - [ ] Windows
  - [ ] Linus
  - [ ] Others

### Installation
```
  1. Clone to your Mac  
  2. Run the JiSuan project in Xcode
  3. (optional)
     Open System Preference -> Keyboard -> Shortcuts  
     -> Services -> add shortcut for JiSuan  
```

### How To
```
  1. Select any mathematical expression which conforms to the rules  
  2. Right-click -> Services -> JiSuan  
     or type the shortcut you define for JiSuan (recommanded)
     (note: the shorcut should be globally unique, e.g. ctrl+cmd+J)
```
### Example
|Selected text | output|
|:--------------:|:----------------:|
|3 * 4 + 5   | 3 * 4 + 5 = 17|
|log(3*5+1, 4) | log(3*5+1, 4)= 2|

### Rules
```
  All selected expressions should conform to the following rules,  
  or it may lead to unexpected result.
```
|Operation|Math Forumla|Priority|
|:--------------:|:----------------:|:-:|
|Parenthesis|(a)|1|
|2nd Root|sqrt(a)|1|
|nth Root|rt(a, n)|1|
|Absolute|abs(a)|1|
|Max|max(a, b)|1|
|Min|min(a, b)|1|
|Ceil|ceil(a)|1|
|Floor|floor(a)|1|
|Round|round(a)|1|
|Log|log(a, base)|1|
|Factorial|a!|2|
|Pow|base^exponent|2|
|Multiply|a * b|3|
|Divide|a / b|3|
|Modulo|a % b|3|
|Add|a + b|4|
|Subtract|a - b|4|
|Negate|-a|4|

### Developers
@Shadowyyyy   (Ruan, Zhen-jie)  
@B1ueSky      (Luo, Tian-you)

###At last, thanks for all your STARs!
```
If you find any bug or have any suggestion, let us know.
```
