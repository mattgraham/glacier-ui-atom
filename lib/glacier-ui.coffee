{$} = require 'atom'

module.exports =
  configDefaults:
    allowTreeViewToScrollHorizontally: false

  activate: (state) ->
      atom.config.observe 'glacier-ui.allowTreeViewToScrollHorizontally', ->
        if atom.config.get('glacier-ui.allowTreeViewToScrollHorizontally')
          $('.tree-view-scroller').addClass('tree-view-scrolls-horizontally')
        else
          $('.tree-view-scroller').removeClass('tree-view-scrolls-horizontally')

      useragent = navigator.userAgent

      $(window).on 'resize', @checkFullscreen

      @checkFullscreen()

  checkFullscreen: ->
    if $(window).height() + 1 >= screen.height
      atom.workspaceView.addClass 'glacier-ui-fullscreen'
    else
      atom.workspaceView.removeClass 'glacier-ui-fullscreen'
