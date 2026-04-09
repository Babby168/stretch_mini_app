# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Stretch.destroy_all

puts "ストレッチデータを作成中..."

# 肩のストレッチ
Stretch.create!([
  {
    name: '肩回し',
    description: '肩をゆっくり回して血行を促進',
    target_area: :shoulder,
    steps: "1. 背筋を伸ばして座る\n2. 両肩を耳に近づけるように上げる\n3. 後ろ → 下 → 前と大きく回す\n4. 前回し・後ろ回しを各5回行う",
    image_path: 'shoulder_rotation.png'
  },
  {
    name: '肩甲骨寄せ',
    description: '肩甲骨を寄せて肩周りをほぐす',
    target_area: :shoulder,
    steps: "1. 背筋を伸ばして座る\n2. 両手を背中で組む\n3. 肩甲骨を寄せながら胸を開く\n4. 20秒キープを3セット行う",
    image_path: 'shoulder_blade.png'
  },
  {
    name: '腕のクロスストレッチ',
    description: '腕を胸の前で伸ばしてほぐす',
    target_area: :shoulder,
    steps: "1. 右腕を胸の前に伸ばす\n2. 左手で右肘を抱える\n3. ゆっくりと左側に引き寄せる\n4. 30秒キープ後、反対側も行う",
    image_path: 'shoulder_cross.png'
  }
])

# 首のストレッチ
Stretch.create!([
  {
    name: '首の側屈',
    description: '首を横に倒して首筋を伸ばす。スマホ首の改善に効果的です。',
    target_area: :neck,
    steps: "1. 背筋を伸ばして座る\n2. 右手で頭の左側を優しく押さえる\n3. ゆっくりと首を右に倒す\n4. 30秒キープ後、反対側も行う",
    image_path: 'neck_stretch.png'
  },

  {
    name: '首の回旋',
    description: '首をゆっくり回して柔軟性を高める',
    target_area: :neck,
    steps: "1. 背筋を伸ばして座る\n2. 首をゆっくり右に回す\n3. 正面 → 右 → 正面 → 左の順に動かす\n4. 各方向で3秒キープ",
    image_path: 'neck_rotation.png'
  }
])

# 腰のストレッチ
Stretch.create!([
  {
    name: '座位ツイスト',
    description: '座ったまま腰をひねってリフレッシュ',
    target_area: :lower_back,
    steps: "1. 背筋を伸ばして座る\n2. 右手を左膝の外側に置く\n3. ゆっくりと体を左にひねる\n4. 30秒キープ後、反対側も行う",
    image_path: 'lower_back_twist.png'
  },

  {
    name: '前屈',
    description: '座ったまま前に倒れて腰を伸ばす',
    target_area: :lower_back,
    steps: "1. 椅子に浅く座る\n2. 足を肩幅に開く\n3. 息を吐きながら上体を前に倒す\n4. 30秒キープして戻る",
    image_path: 'forward_bend.png'
  }
])


puts "☑️ #{Stretch.count}件のストレッチデータを作成しました！"

# 各部位ごとの件数を表示
puts " - 肩: #{Stretch.shoulder.count}件"
puts " - 首: #{Stretch.neck.count}件"
puts " - 腰: #{Stretch.lower_back.count}件"
