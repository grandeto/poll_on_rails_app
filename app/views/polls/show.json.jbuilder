json.partial! "polls/poll", poll: @poll
json.poll_options @poll.poll_options, partial: 'poll_options/poll_option', as: :poll_option
