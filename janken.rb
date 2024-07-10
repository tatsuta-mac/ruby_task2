def janken
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

    input_val = gets.to_i
    if !(input_val == 0 || input_val == 1 || input_val == 2)
        input_val = 4
    end

    enemy_val = rand(3)

    jankens = ["グー", "チョキ", "パー", "戦わない"]
    puts "ホイ！"
    puts "あなた：#{jankens[input_val]} 相手：#{jankens[enemy_val]}"
    puts "--------------------------------"

    # じゃんけんの結果ごとに値を返す
    if input_val == 3
        return 0
    elsif input_val == 4
        return 1
    elsif input_val - enemy_val == -1 || input_val - enemy_val == 2
        return 2
    elsif input_val - enemy_val == -2 || input_val - enemy_val == 1
        return 3
    else input_val == enemy_val
        return 4
    end
end

def acchimuite_hoi
    puts "あっちむいて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
   
    input_val = gets.to_i
    if !(input_val == 0 || input_val == 1 || input_val == 2 || input_val == 3)
        return 3
    end

    enemy_val = rand(2)

    directions = ["上", "下", "左", "右"]
    puts "ホイ！"
    puts "あなた：#{directions[input_val]} 相手：#{directions[enemy_val]}"
    puts "---------------------------------"

    if input_val == enemy_val
        return 1
    elsif input_val != enemy_val
        return 2
    end
end

# じゃんけんの結果を返す関数
def play
    f1 = janken

    if f1 == 0
        # 3を選択した時の処理
        puts "じゃんけんが放棄されました。"
        puts "ゲームを終了します。"
        puts "---------------------------------"
    elsif f1 == 1
        # 0~3以外を入力した時の処理
        puts "不正な値です。"
        puts "ゲームを終了します。"
    elsif f1 == 2 || f1 == 3 
        #じゃんけんに勝敗がついた時の処理
        f2 = acchimuite_hoi
        if f1 == 2 && f2 == 1
            # じゃんけん：勝ち、あっち向いてホイ：同じ方向　の時の処理
            puts "あなたの勝ち！"
            puts "---------------------------------"
        elsif f1 == 3 && f2 == 1
            # じゃんけん：負け、あっち向いてホイ：同じ方向　の時の処理
            puts "相手の勝ち..."
            puts "---------------------------------"
        elsif f2 == 2
            # あっち向いてホイで勝負がつかなかった時の処理
            puts "じゃんけん..."
            play
        else f2 == 3
            puts "不正な値です"
            puts "中断しました"
            puts "---------------------------------"
        end
    else f1 == 4
        # あいこの処理
        puts "あいこで..."
        play
    end
end

puts "じゃんけん..."
play
