jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: 'YOUR-APP-ID', cookie: true)

window.fbAsyncInit = ->
      FB.init(
        appId      :  ENV['FACEBOOK_KEY'], 
        status     : true, 
        cookie     : true, 
        xfbml      : true  
      )

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      alert(response.authResponse.signedRequest);
      window.location = '/auth/facebook/callback'
  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true


