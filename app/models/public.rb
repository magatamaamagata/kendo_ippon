class Public < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '公開する' },
      { id: 3, name: 'しない' },
    ]
end
