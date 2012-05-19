# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class ProductsShtPager
  constructor: (@page = 1) ->
    Handlebars.registerPartial('product_description', SHT['sht/product_description'])
    $(window).scroll(@check)
  
  check: =>
    if @nearBottom()
      @page++
      $(window).unbind('scroll', @check)
      $.getJSON($('#productsSht').data('json-url'), page: @page, @render)

  nearBottom: =>
    $(window).scrollTop() > $(document).height() - $(window).height() - 100
    
  render: (products) =>
    for product in products
      $('#productsSht').append SHT['sht/product'](product)
    $(window).scroll(@check) if products.length > 0
    
$ ->
  new ProductsShtPager() if $('#productsSht').length