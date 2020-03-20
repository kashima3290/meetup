json.user_name @message.user.name
json.user_image @message.user.image_url
json.created_at @message.created_at.strftime("%Y/%m/%d | %H:%M")
json.image @message.image.url
json.text @message.text
json.id @message.id

