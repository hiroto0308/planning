class TimeAll < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '1時間' }, { id: 3, name: '1時間半' },
    { id: 4, name: '2時間' }, { id: 5, name: '2時間半' }, { id: 6, name: '3時間' },
    { id: 7, name: '3時間半' }, { id: 8, name: '4時間' }, { id: 9, name: '4時間半' },
    { id: 10, name: '5時間以上' }, { id: 11, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :events
end
