class Redirection < ActiveHash::Base
  self.data = [
    { id: 1, before: '/blog/posts',       after: '/' },
    { id: 2, before: '/blog/posts/2',     after: '/' },
    { id: 3, before: '/blog/posts/3',     after: '/' },
    { id: 4, before: '/blog/posts/4',     after: '/' },
    { id: 5, before: '/blog/posts/5',     after: '/' },
    { id: 6, before: '/categories',       after: '/blog/categories' },
    { id: 7, before: '/categories/:id',   after: '/blog/categories/%{id}' },
    { id: 8, before: '/tags',             after: '/blog/tags' },
    { id: 9, before: '/tags/:id',         after: '/blog/tags/%{id}' },
    { id: 10, before: '/blog/:id',        after: '/blog/posts/%{id}' }
  ]
end
