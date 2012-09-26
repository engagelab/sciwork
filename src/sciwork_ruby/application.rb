require 'rubygems'
require 'sinatra'
require 'digest'
require 'json'
require 'fileutils'
require 'logger'

BLACK = '0x000000'
ORANGE = '0xFF9736'
PINK = '0xFF3288'
PURPLE = '0x8111D78'
GREEN = '0x89BD46'
BLUE = '0x4ACAF1'
ROWN = '0x6E3F30'

Dir.mkdir('logs') unless File.exist?('logs')
$log = Logger.new('logs/output.log')

configure do
    $log.level = Logger::DEBUG
end

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/groupInfo' do
	return [{:id => "50505a3430041fb1c28ea433", :name => "Teacher", :colour => BLACK},{:id => "50191e38da061f83602e8825", :name => "LILLA", :colour => ORANGE},{:id => "50191e61da061f83602e882a", :name => "ROSA", :colour => GREEN}].to_json;
end

get '/group' do
	return [{:susers => "[]", :password => "password", :spostits => null, :id => "5051ad583004427957d0da52", :simages => null, :runId => 3, :name => "Group 1", :svideos => null},{:susers => "[]", :password => "teacher", :spostits => null, :id => "50505a3430041fb1c28ea433", :simages => null, :runId => 3, :name => "Teacher", :svideos => null},{:susers => "[]", :password => "password", :spostits => null, :id => "50191e38da061f83602e8825", :simages => null, :runId => 3, :name => "LILLA", :svideos => null}].to_json;
end

post '/connect' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	if data['groupId'] == '50191e38da061f83602e8825' && data['password'] == 'lilla'
		status 200
	elsif data['groupId'] == '50191e61da061f83602e882a' && data['password'] == 'rosa'
		status 200
	else
		status 401
	end
end

get '/menu' do
	return [{:sceneId => "1q", :title => "Stikkord", :tasks => [{:taskId => "11", :title => "task 1"},{:taskId => "12", :title => "task 2"},{:taskId => "13", :title => "task 3"}]}, 
	{:sceneId => "1w", :title => "Eksperiment", :tasks => [{:taskId => "21", :title => "task 4"},{:taskId => "22", :title => "task 5"},{:taskId => "23", :title => "task 6"}]},
	{:sceneId => "1e", :title => "Museum", :tasks => [{:taskId => "31", :title => "task 7"},{:taskId => "32", :title => "task 8"},{:taskId => "33", :title => "task 9"}]},
	{:sceneId => "1r", :title => "Simulering", :tasks => [{:taskId => "41", :title => "task 10"},{:taskId => "42", :title => "task 11"},{:taskId => "43", :title => "task 12"}]},
	{:sceneId => "1t", :title => "Presentasjon", :tasks => [{:taskId => "51", :title => "task 13"},{:taskId => "52", :title => "task 14"},{:taskId => "53", :title => "task 15"}]},
	{:sceneId => "1y", :title => "Diagram", :tasks => [{:taskId => "61", :title => "task 16"},{:taskId => "62", :title => "task 17"},{:taskId => "63", :title => "task 18"}]},
	{:sceneId => "1u", :title => "Artikkel", :tasks => [{:taskId => "71", :title => "task 19"},{:taskId => "72", :title => "task 20"},{:taskId => "73", :title => "task 21"}]},
	{:sceneId => "1i", :title => "Portfolio", :tasks => [{:taskId => "81", :title => "task 22"},{:taskId => "82", :title => "task 23"},{:taskId => "83", :title => "task 24"}]}].to_json;
end


get '/task/:id' do
	return [].to_json;
end
