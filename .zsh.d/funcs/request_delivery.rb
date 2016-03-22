#!/usr/bin/env ruby

require 'capybara'
require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'trollop'
require 'pry'
require 'readline'

opts = Trollop::options do
  opt :address, "", type: :string
  opt :number, "", type: :string
  opt :type, "", type: :string
  opt :phone, "", type: :string
  opt :date, "", type: :string
  opt :confirm, ""
  opt :mail, "", type: :string
  opt :selenium, ""
end

begin
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
  end
  Capybara.default_driver = :poltergeist
  if opts[:selenium]
    Capybara.default_driver = :selenium
  end

  puts "Progress: visit page"

  browser = Capybara.current_session
  url = "https://trackings.post.japanpost.jp/delivery/deli"
  browser.visit url

  puts "Progress: fill address"

  address = opts[:address] || (print 'Input address(7 digits): '; gets.chomp)
  fail "Address has incorrect length(#{address.size})" unless address.size == 7
  input_addr = browser.find(:xpath, '//*[@id="content"]/div[2]/ol/li[1]/div/p/label/input')
  input_addr.set(address)

  puts "Progress: fill number"

  number = opts[:number] || (print 'Input number(6,8 or 11~13 digits): '; gets.chomp)
  if number.size == 6 || number.size == 8
    input_num  = browser.find('#content > div:nth-child(5) > ol > li:nth-child(2) > div > div.clearfix.p_1.m_b10 > dl.form_layout.w_327.float_r > dd.p_10.p_l15 > input')
    input_num.set(number)
  elsif 11 <= number.size && number.size <= 13
    input_num  = browser.find(:xpath, '//*[@id="content"]/div[2]/ol/li[2]/div/div[1]/dl[1]/dd[1]/input')
    input_num.set(number)
  else
    fail "Number has incorrect length(#{number.size})"
  end

  puts "Progress: fill label type"

  labels_type = browser.find('#content > div:nth-child(5) > ol > li:nth-child(4)').all('label')
  type = opts[:type]
  unless type
    labels_type.each do |l|
      input = l.find('input')
      puts "#{input.value}: #{l.text}"
    end
    type = (print 'Input type: '; gets.chomp)
  end
  labels_type.map {|l| l.find('input')}.find {|i| i.value == type}.click

  puts "Progress: jump to second page"

  destination = browser.find('#content > div:nth-child(5) > ol > li:nth-child(5) > div > ul > li:nth-child(1) > label > input')
  destination.click

  browser.find('#content > div:nth-child(5) > ul > li.left_ext_web > input[type="image"]').click

  date_table = browser.find('#con_no_rnav > table > tbody').all('tr').drop(2)
  date = opts[:date]
  unless date
    values = date_table.map do |row|
      row.all('td').map {|td| (child = td.first('input')) ? "#{child.value}:#{child['title']}" : td.text}
    end
    values.each {|v| puts v.join("\t")}
    Readline.completion_proc = proc {|word|
      values.grep(/\A#{Regexp.quote word}/)
    }
    date = Readline.readline("date> ")
  end
  date_table.map {|l| l.all('input').to_a}.flatten.find {|i| i.value == date}.click

  phone_numbers = (opts[:phone] || (print 'Input phone(space separated): '; gets.chomp)).split(' ')
  input_phone1 = browser.find('#clientTelNoArea')
  input_phone1.set(phone_numbers[0])
  input_phone2 = browser.find('#con_no_rnav > div:nth-child(4) > div > div > table > tbody > tr:nth-child(1) > td > input:nth-child(2)')
  input_phone2.set(phone_numbers[1])
  input_phone3 = browser.find('#con_no_rnav > div:nth-child(4) > div > div > table > tbody > tr:nth-child(1) > td > input:nth-child(3)')
  input_phone3.set(phone_numbers[2])

  puts "Progress: fill phone numbers"

  if (mail = opts[:mail])
    puts "Progress: fill email"
    browser.find('#emailAddr').set(mail)
    browser.find('#emailAddrConfirm').set(mail)
  end

  puts "Progress: jump to last page"

  browser.find('#con_no_rnav > div:nth-child(5) > ul > li:nth-child(2) > input[type="image"]').click

  if opts[:confirm]
    selectors = ['div.border_box:nth-child(2) > table:nth-child(1)',
      'div.m_b20:nth-child(4) > div:nth-child(1) > table:nth-child(1)',
      'div.m_b20:nth-child(6) > div:nth-child(1) > table:nth-child(1)']

    selectors.each do |selector|
      browser.find(selector).all('tr').each do |row|
        puts row.all('*').map(&:text).join(":\t")
      end
      puts
    end
    print 'subbmit? (y/n [n])'
    unless /[Yy]/ === gets.chomp
      exit 0
    end
  end

  browser.find('.txt_c > input:nth-child(1)').click

  browser.save_screenshot('screenshot.png')
  `open screenshot.png`
rescue => e
  browser.save_screenshot('screenshot.png')
  raise e
end
