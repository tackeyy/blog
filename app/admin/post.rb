ActiveAdmin.register Post do
  permit_params :slug, :tags, :status, :title, :body

  before_save do |h|
    @post.category_list = params[:post][:category_ids]
    @post.tag_list = params[:post][:tag_ids]
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  filter :status
  filter :title
  filter :body
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column Post.human_attribute_name(:status),       :status
    column Post.human_attribute_name(:category),     :category_list
    column Post.human_attribute_name(:tag),          :tag_list
    column Post.human_attribute_name(:title),        :title
    column Post.human_attribute_name(:body),         :body
    column Post.human_attribute_name(:created_at),   :created_at
    column Post.human_attribute_name(:updated_at),   :updated_at
    actions
  end

  show do
    attributes_table do
      row :status
      row :tag do
        post.category_list
      end
      row :category do
        post.category_list
      end
      row :title
      row :body
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :categories,
        input_html: {
          class: 'select2'
       }
      f.input :tags,
        input_html: {
          class: 'select2'
        }
      f.input :slug
      f.input :title
      f.input :body
      f.input :status
    end
    f.actions
  end
end
