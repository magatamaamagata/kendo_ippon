class Youtube < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '面', url_id: "1"},
    { id: 3, name: '小手', url_id: "2"},
    { id: 4, name: '胴', url_id: "3"},
    { id: 5, name: '突き', url_id: "4"},
  ]
end

