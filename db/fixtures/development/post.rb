index = 0
20.times do
  index += 1
  Post.seed(
    :id,
    id: index,
    title: "これはタイトルです#{index}",
    body: '### リスト
    - リスト
    - リスト
    - リスト
    ### 番号付きリスト
    #
    #1. 番号付きリスト
    #1. 番号付きリスト
    #1. 番号付きリスト',
    status: 'shipped',
    category_list: "カテゴリー#{index}",
    tag_list: "タグ#{rand(1..20)}, タグ#{rand(1..20)}, タグ#{rand(1..20)}"
  )
end
