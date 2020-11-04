class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１級以下' },
    { id: 3, name: '初段' },
    { id: 4, name: '二段' },
    { id: 5, name: '三段' },
    { id: 6, name: '四段' },
    { id: 7, name: '五段' },
    { id: 8, name: '六段' },
    { id: 9, name: '七段' },
    { id: 10, name: '八段' }
  ]
end
