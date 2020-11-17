class JudgeCorrect < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '一本'},
    { id: 3, name: '無効'}
  ]
end
