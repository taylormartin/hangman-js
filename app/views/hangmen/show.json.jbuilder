json.partial! "hangmen/item", hangman: @hangman

if params[:cheat]
  json.answer @hangman.answer
end
