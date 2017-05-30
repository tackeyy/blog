ActiveAdmin.register Post do
  decorate_with PostDecorator

  permit_params :slug, :tags, :status, :description, :title, :body, :tags, :tag_list, :tag

  before_create do
    @post.category_list = params[:post][:category_ids].reject(&:blank?)
    @post.tag_list = params[:post][:tag_ids].reject(&:blank?)
  end

  before_save do
    category_ids = params[:post][:category_ids].reject(&:blank?)
    category_names = category_ids.select { |category| category.to_i.zero? }
    @post.category_list = ActsAsTaggableOn::Tag.where(id: category_ids).map(&:name)
    @post.category_list.add(category_names.split(',')) if category_names.present?

    tag_ids = params[:post][:tag_ids].reject(&:blank?)
    tag_names = tag_ids.select { |tag| tag.to_i.zero? }
    @post.tag_list = ActsAsTaggableOn::Tag.where(id: tag_ids).map(&:name)
    @post.tag_list.add(tag_names.split(',')) if tag_names.present?
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id]) || scoped_collection.find(params[:id])
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
    column Post.human_attribute_name(:description),  :description
    column Post.human_attribute_name(:title),        :title
    column Post.human_attribute_name(:created_at),   :created_at
    column Post.human_attribute_name(:updated_at),   :updated_at
    actions
  end

  show do
    attributes_table do
      row :status
      row :categories do
        post.category_list
      end
      row :tags do
        post.tag_list
      end
      row :description
      row :title
      row :to_html
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :categories, input_html: { class: 'select2' }
      f.input :tags, input_html: { class: 'select2' }
      f.input :slug
      f.input :description
      f.input :title
      f.input :body
      f.input :status
    end
    f.actions
  end
end
