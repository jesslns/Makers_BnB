def bootAnon
  redirect ('/') unless session['user']
end
