class Difficulity < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '練習試合' },
    { id: 3, name: '市民大会' },
    { id: 4, name: '県大会' },
    { id: 5, name: '全国大会' }
  ]
end
