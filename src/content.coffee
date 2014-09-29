$ ->
  DEBUG = true

  debug =  ->
    console.debug.apply console, arguments if DEBUG
    return

  debug 'AllTRD Loaded OK'
  debug 'AllTRD jQuery: ', $().jquery


#  $("a[href*='/transistor.php?transistor=']").each ->
#    keywords = keywords + "+or+" + $(this).text().trim()

#  debug keywords

  skip = 2
  count = 11
  keywords = []

  $('.base_txt').each ->
    if skip
      skip--
      return

    #return if not count
    #count--

    ignore = false
    $(this).find('td').each ->
      value = $(this).text().trim()
      return if value is ""
      if value is "0"
        ignore = true
      return

    return if ignore

    keywords.push $('a', this).text().trim()

    return

  param = keywords.join('+or+')
  url = "http://trd.nov.ru/advanced_search_result.php?&x=0&y=0&categories_id=100846&inc_subcat=1&pfrom=&pto=&dfrom=&dto=&keywords=#{param}"

  p = $('body > table > tbody > tr:nth-child(3) > td > table > tbody > tr > td:nth-child(2) > table > tbody > tr:nth-child(2) > td.base_txt > p:nth-child(5)')

  p.replaceWith "<p><a href=\"#{url}\" target=\"_blank\">#{$(p).text()}</a></p>"

  return
