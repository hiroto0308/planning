class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'バスケットボール' }, { id: 3, name: 'フットサル' },
    { id: 4, name: 'テニス' }, { id: 5, name: '野球' }, { id: 6, name: 'バレーボール' },
    { id: 7, name: 'パークゴルフ' }, { id: 8, name: 'バトミントン' }, { id: 9, name: '卓球' },
    { id: 10, name: 'ボウリング' }, { id: 11, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :events
end
