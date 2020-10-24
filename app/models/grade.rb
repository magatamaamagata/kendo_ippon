class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '無段' },
    { id: 3, name: '初' },
    { id: 4, name: '二' },
    { id: 5, name: '三' },
    { id: 6, name: '四' },
    { id: 7, name: '五' },
    { id: 8, name: '六' },
    { id: 9, name: '七' },
    { id: 10, name: '八' }
  ]
end
