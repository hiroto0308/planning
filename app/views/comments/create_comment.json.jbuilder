json.event_id          @event.id
json.comment_id        @comment.id
json.comment_date      @comment.created_at.strftime('%Y/%m/%d %H:%M')
json.text              @comment.text