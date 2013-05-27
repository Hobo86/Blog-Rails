module PostsHelper
    def join_tags(post)
        post.tags.map { |t| t.name }.join(", ")
    end
    
    def join_categories(post)
        post.categories.map {|t| t.name }.join("; ")
    end
end
