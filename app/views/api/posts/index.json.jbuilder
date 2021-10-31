@posts.each do |post|
  json.set! post.id do
      json.extract! post, :id, :body

      json.author do
          json.extract! post.author, :id, :username
                        
      end
  end
end