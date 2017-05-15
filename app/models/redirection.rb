class Redirection < ActiveHash::Base
  self.data = [
    {id: 1, before:'/blog/posts',   after:'/' },
    {id: 2, before:'/blog/posts/2', after:'/' },
    {id: 3, before:'/blog/posts/3', after:'/' },
    {id: 4, before:'/blog/posts/4', after:'/' },
    {id: 5, before:'/blog/posts/5', after:'/' },
  ]
end
