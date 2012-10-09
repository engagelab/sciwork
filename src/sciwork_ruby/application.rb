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

item0Selected = "false";
item1Selected = "true";
item2Selected = "false";

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
	return [{:id => "1q", :title => "Stikkord", :icon => "keyword.png", :stasks => [{:id => "11", :title => "Level 1", :icon => "cyclepump.png"},{:id => "12", :title => "Level 2", :icon => "vapo.png"},{:id => "13", :title => "Level 3", :icon => "seringe.png"}]}, 
	{:id => "1w", :title => "Eksperiment", :icon => "experiment.png", :stasks => [{:id => "21", :title => "task", :icon => ""},{:id => "22", :title => "task", :icon => ""},{:id => "23", :title => "task", :icon => ""}]},
	{:id => "1e", :title => "Museum", :icon => "museum.png", :stasks => [{:id => "31", :title => "task", :icon => ""},{:id => "32", :title => "task", :icon => ""},{:id => "33", :title => "task", :icon => ""}]},
	{:id => "1r", :title => "Simulering", :icon => "simulation.png", :stasks => [{:id => "41", :title => "task", :icon => ""},{:id => "42", :title => "task", :icon => ""},{:id => "43", :title => "task", :icon => ""}]},
	{:id => "1t", :title => "Presentasjon", :icon => "presentation.png", :stasks => [{:id => "51", :title => "task", :icon => ""},{:id => "52", :title => "task", :icon => ""},{:id => "53", :title => "task", :icon => ""}]},
	{:id => "1y", :title => "Diagram", :icon => "diagram.png", :stasks => [{:id => "61", :title => "task", :icon => ""},{:id => "62", :title => "task", :icon => ""},{:id => "63", :title => "task", :icon => ""}]},
	{:id => "1u", :title => "Artikkel", :icon => "article.png", :stasks => [{:id => "71", :title => "task", :icon => ""},{:id => "72", :title => "task", :icon => ""},{:id => "73", :title => "task", :icon => ""}]},
	{:id => "1i", :title => "Portfolio", :icon => "portfolio.png", :stasks => [{:id => "81", :title => "task", :icon => ""},{:id => "82", :title => "task", :icon => ""},{:id => "83", :title => "task", :icon => ""}]}].to_json;
end


get '/task/:id' do
	if params[:id] == '11'
		return {:description => "this is the description for task ID 11", :taskType => "keywords", :title => "Level 1" }.to_json;
	elsif params[:id] == '12'
		return {:description => "this is the description for task ID 12", :taskType => "assets", :title => "Level 2" }.to_json;
	elsif params[:id] == '13'
		return {:description => "this is the description for task ID 13", :taskType => "keywords", :title => "Level 3" }.to_json;
	else
		return {:description => "", :resources => "", :title => "task" }.to_json;
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

get '/contributions/:groupId/:taskId' do
	return {"svideos" => [{:id => "vid1", :uri => "hCSPf5Viwd0", :title => "my first video", :isPortfolio => item0Selected}, {:id => "vid2", :uri => "_b2F-XX0Ol0", :title => "the bottle", :isPortfolio => item1Selected}], "simages" => [{:id => "img1", :uri => "agY1PPsq6oA", :title => "my first image", :isPortfolio => item2Selected}], "spostits" => []}.to_json;
end

put '/contributions' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	if data['id'] == 'vid1'
		item0Selected = data['state'];
	elsif data['id'] == 'vid2'
		item1Selected = data['state'];
	elsif data['id'] == 'img1'
		item2Selected = data['state'];
	end
	
	return {"status" => 200}.to_json;
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end