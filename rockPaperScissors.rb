def jyanken(te)
  case te
    when "0" then
      return "グー"
    when "1" then
      return "チョキ"
    when "2" then
      return "パー"
  end
end

def jyanken_vs(my,your)
  if my == "グー" then
    if your == "グー" then
      return "あいこ"
    elsif your == "チョキ" then
      return "勝ち"
    elsif your == "パー" then
      return "負け"
    end
  elsif my == "チョキ" then
    if your == "グー" then
      return "負け"
    elsif your == "チョキ" then
      return "あいこ"
    elsif your == "パー" then
      return "勝ち"
    end
  elsif my == "パー" then
    if your == "グー" then
      return "勝ち"
    elsif your == "チョキ" then
      return "負け"
    elsif your == "パー" then
      return "あいこ"
    end
  end
end

def finger(yubi)
  case yubi
    when "0" then
      return "上"
    when "1" then
      return "下"
    when "2" then
      return "左"
    when "3" then
      return "右"
  end
end

def finger_vs(my,your,jankenResult)
  if jankenResult == "勝ち" then
    if my == your then
      return "勝ち"
    end
  elsif jankenResult == "負け" then
    if my == your then
      return "負け"
    end
  end
end


fingerResult = nil
while fingerResult == nil

  jankenResult = nil
  while jankenResult == nil or jankenResult == "あいこ"
    if jankenResult == "あいこ" then
      puts "あいこで..."
    else
      puts "じゃんけん..."
    end

    puts "0（グー）1（チョキ）2（パー）3（戦わない）"

    myJankenInt = gets.chomp.to_s
    if myJankenInt == "0" or myJankenInt == "1" or myJankenInt == "2" then
    elsif myJankenInt == "3" then
      puts "戦いませんでした"
      exit
    else
      puts "入力が間違っています"
      exit
    end

    myJanken = jyanken(myJankenInt)
    if jankenResult == "あいこ" then
      puts "ショ！"
    else
      puts "ホイ！"
    end

    puts "-----------------------"
    puts "あなた：" + myJanken + "を出しました"
    yourJankenInt = rand(3).to_s
    yourJanken = jyanken(yourJankenInt)
    puts "相手：" + yourJanken + "を出しました"
    puts "-----------------------"
    jankenResult = jyanken_vs(myJanken,yourJanken)
  end

  puts "あっち向いて〜"
  puts "0（上）1（下）2（左）3（右）"

  myFingerInt = gets.chomp.to_s
  if myFingerInt == "0" or myFingerInt == "1" or myFingerInt == "2" or myFingerInt == "3" then
  else
    puts "入力が間違っています"
    exit
  end

  myFinger = finger(myFingerInt)
  puts "ホイ！"
  puts "-----------------------"
  puts "あなた：" + myFinger
  yourFingerInt = rand(4).to_s
  yourFinger = finger(yourFingerInt)
  puts "相手：" + yourFinger
  fingerResult = finger_vs(myFinger,yourFinger,jankenResult)

  unless fingerResult == nil then
    puts fingerResult
  end
end
