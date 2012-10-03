require 'rubygems'
require 'sinatra'
require 'digest'
require 'json'
require 'fileutils'
require 'logger'

BLACK = '0x000000'
ORANGE = '0xFF9736'
PINK = '0xFF3288'
PURPLE = '0x811D78'
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
	return [{:id => "50505a3430041fb1c28ea433", :name => "Teacher", :colour => BLACK},{:id => "50191e38da061f83602e8825", :name => "LILLA", :colour => PURPLE},{:id => "50191e61da061f83602e882a", :name => "ROSA", :colour => PINK}].to_json;
end

get '/tasksCompleted/:groupId' do
	if params[:groupId] == '50191e38da061f83602e8825'
		return ["11","21","22","31","41","42"].to_json;
	else
		return [].to_json;
	end
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
	return [{:id => "1q", :title => "Stikkord", :stasks => [{:id => "11", :title => "Level 1"},{:id => "12", :title => "Level 2"},{:id => "13", :title => "Level 3"}]}, 
	{:id => "1w", :title => "Eksperiment", :stasks => [{:id => "21", :title => "task 4"},{:id => "22", :title => "task 5"},{:id => "23", :title => "task 6"}]},
	{:id => "1e", :title => "Museum", :stasks => [{:id => "31", :title => "task 7"},{:id => "32", :title => "task 8"},{:id => "33", :title => "task 9"}]},
	{:id => "1r", :title => "Simulering", :stasks => [{:id => "41", :title => "task 10"},{:id => "42", :title => "task 11"},{:id => "43", :title => "task 12"}]},
	{:id => "1t", :title => "Presentasjon", :stasks => [{:id => "51", :title => "task 13"},{:id => "52", :title => "task 14"},{:id => "53", :title => "task 15"}]},
	{:id => "1y", :title => "Diagram", :stasks => [{:id => "61", :title => "task 16"},{:id => "62", :title => "task 17"},{:id => "63", :title => "task 18"}]},
	{:id => "1u", :title => "Artikkel", :stasks => [{:id => "71", :title => "task 19"},{:id => "72", :title => "task 20"},{:id => "73", :title => "task 21"}]},
	{:id => "1i", :title => "Portfolio", :stasks => [{:id => "81", :title => "task 22"},{:id => "82", :title => "task 23"},{:id => "83", :title => "task 24"}]}].to_json;
end


get '/task/:id' do
	if params[:id] == '11'
		return {:description => "this is the description for task ID 11", :taskType => "keywords", :title => "Level 1" }.to_json;
	elsif params[:id] == '12'
		return {:description => "this is the description for task ID 12", :taskType => "assets", :title => "Level 2" }.to_json;
	elsif params[:id] == '13'
		return {:description => "this is the description for task ID 13", :taskType => "keywords", :title => "Level 3" }.to_json;
	else
		return {:description => "", :resources => ""}.to_json;
	end
end


get '/keywords/:groupId/:taskId' do
	if params[:taskId] == '13'
		return {"id" => "5061a1c40364f440d872358e", "keywords" => ["un","deux","trois","quatre","cinq"], "taskId" => params[:taskId], "groupId" => params[:groupId]}.to_json;
	else
		return [].to_json;
	end
end

post '/keywords' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end

put '/keywords' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end

get '/assets/:groupId/:taskId' do
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["un","deux","trois","quatre","cinq"], "taskId" => params[:taskId], "groupId" => params[:groupId]}.to_json;
	return [].to_json;
end

post '/assets' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	return [].to_json;
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end