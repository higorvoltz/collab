# frozen_string_literal: true

module Shared
  module MessagesHelper
    def append_previous_messages_partial_path
      # if a conversation is opened in the messenger
      if @is_messenger == 'true'
        'shared/load_more_messages/messenger/append_messages'
      else
        'shared/load_more_messages/window/append_messages'
      end
    end

    # if there are no previous messages
    def remove_link_to_messages
      if @is_messenger == 'false'
        if @messages_to_display_offset.zero?
          'shared/load_more_messages/window/remove_more_messages_link'
        else
          'shared/empty_partial'
        end
      else
        'shared/empty_partial'
      end
    end

    # in the messenger load previous messages until the scroll bar appears
    def autoload_messenger_messages
      if @is_messenger == 'true'
        # if previous messages exist, load them
        if @messages_to_display_offset.zero?
          # remove load previous messages link
          'shared/load_more_messages/messenger/remove_previous_messages_link'
        else
          'shared/load_more_messages/messenger/load_previous_messages'
        end
      else
        'shared/empty_partial'
      end
    end
  end
end
