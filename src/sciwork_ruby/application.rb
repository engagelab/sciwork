require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'digest'
require 'json'
require 'fileutils'
require 'logger'
require 'securerandom'

BLACK = '0x000000'
ORANGE = '0xFF9736'
PINK = '0xFF3288'
PURPLE = '0x811D78'
GREEN = '0x89BD46'
BLUE = '0x4ACAF1'
ROWN = '0x6E3F30'

item0Selected = "false";
item1Selected = "false";
item2Selected = "false";

task_50191e38da061f83602e8825 = [];

Dir.mkdir('logs') unless File.exist?('logs')
$log = Logger.new('logs/output.log')

Dir["./models/*.rb"].each {|file| require file }
configure do
	Mongoid.configure do |config|
    	name = "miracleHash"
    	host = "localhost"
    	config.master = Mongo::Connection.new.db(name)
	end
    $log.level = Logger::DEBUG
end

get '/' do
  File.read(File.join('public', 'index.html'))
end


########## login ###############
get '/groupInfo' do
	return [{:id => "50505a3430041fb1c28ea433", :name => "Teacher", :colour => BLACK},{:id => "50191e38da061f83602e8825", :name => "LILLA", :colour => PURPLE},{:id => "50191e61da061f83602e882a", :name => "ROSA", :colour => PINK}].to_json;
end

post '/connect' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	if data['groupId'] == '50191e38da061f83602e8825' && data['password'] == 'password'
		status 200
	elsif data['groupId'] == '50191e61da061f83602e882a' && data['password'] == 'password'
		status 200
	elsif data['groupId'] == '50505a3430041fb1c28ea433' && data['password'] == 'password'
		status 200
	else
		status 401
	end
end



########## menu ###############
get '/menu' do
	return [{:id => "1q", :title => "Stikkord", :icon => "keyword.png", :stasks => [{:id => "11", :title => "SPØRSMAL 1", :icon => "keyword.png"},{:id => "12", :title => "SPØRSMAL 2", :icon => "keyword.png"},{:id => "13", :title => "SPØRSMAL 3", :icon => "keyword.png"}]}, 
	{:id => "1w", :title => "Eksperiment", :icon => "experiment.png", :stasks => [{:id => "21", :title => "SYKKELPUMPE", :icon => "cyclepump.png"},{:id => "22", :title => "SPRAYBOKS", :icon => "vapo.png"},{:id => "23", :title => "SPRØYTE", :icon => "seringe.png"}]},
	{:id => "1e", :title => "Museum", :icon => "museum.png", :stasks => [{:id => "31", :title => "TWEETS", :icon => "keyword.png"}]},
	{:id => "1r", :title => "Simulering", :icon => "simulation.png", :stasks => [{:id => "41", :title => "SIMU1", :icon => "diagram.png"},{:id => "42", :title => "SIMU2", :icon => "diagram.png"},{:id => "43", :title => "SIMU3", :icon => "diagram.png"}]},
	{:id => "1t", :title => "Presentasjon", :icon => "presentation.png", :stasks => [{:id => "51", :title => "DISCUSSION", :icon => "notask.png"}]},
	{:id => "1y", :title => "Diagram", :icon => "diagram.png", :stasks => [{:id => "61", :title => "notask", :icon => ""},{:id => "62", :title => "notask", :icon => ""},{:id => "63", :title => "notask", :icon => ""}]},
	{:id => "1u", :title => "Artikkel", :icon => "article.png", :stasks => [{:id => "71", :title => "ARTIKLER", :icon => "article.png"}]},
	{:id => "1i", :title => "Portfolio", :icon => "portfolio.png", :stasks => [{:id => "81", :title => "notask", :icon => ""},{:id => "82", :title => "notask", :icon => ""},{:id => "83", :title => "notask", :icon => ""}]}].to_json;
end

########## tasks ###############
get '/tasksCompleted/:groupId' do
	if params[:groupId] == '50191e38da061f83602e8825'
		return task_50191e38da061f83602e8825.to_json;
	else
		return [].to_json;
	end
end

put '/tasksCompleted/' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	
	if data['groupId'] == '50191e38da061f83602e8825'
		if data['isTaskCompleted'] == true
			task_50191e38da061f83602e8825.push(data['taskId']);
		else
			task_50191e38da061f83602e8825.delete(data['taskId']);
		end
	end
	
	status 200;
end

get '/task/:id' do
	if params[:id] == '11'
		return {:description => "Hva er energi?", :taskType => "questions", :title => "SPØRSMAL 1" }.to_json;
	elsif params[:id] == '12'
		return {:description => "Hvordan henger energi sammen med fenomener du observer rundt deg?", :taskType => "questions", :title => "SPØRSMAL 2" }.to_json;
	elsif params[:id] == '13'
		return {:description => "Hvordan kan energi transformeres mest mulig effektivt og miljøvennlig?", :taskType => "questions", :title => "SPØRSMAL 3" }.to_json;
	elsif params[:id] == '21'
		return {:description => "1. Press ﬁngeren hardt mot ventilen og pump kraftig ﬂere ganger.<br /><br />2. Beskriv hva dere gjør, opplever og kjenner.<br /><br />3. Hvilke sammenhenger er det mellom det dere gjør, opplever eller kjenner? Hvordan vil dere forklare det?", :taskType => "assets", :title => "SYKKELPUMPE" }.to_json;
	elsif params[:id] == '22'
		return {:description => "1. Trykk på ventilen.<br /><br />2. Beskriv hva dere opplever og kjenner.<br /><br />3. Hvilke sammenhenger er det mellom det dere gjør, opplever eller kjenner? Hvordan vil dere forklare det?", :taskType => "assets", :title => "SPRAYBOKS" }.to_json;
	elsif params[:id] == '23'
		return {:description => "1. Fyll opp sprøyta med varmt vann til den er omtrent halvfull. Ta ut luften som er mellom vannet og åpningen. Hold ﬁngeren hardt foran åpningen og dra (ikke skyv).<br /><br />2. Beskriv hva dere ser.<br /><br />3. Hvilke sammenhenger er det mellom det dere gjør, opplever eller kjenner? Hvordan vil dere forklare det?", :taskType => "assets", :title => "SPRØYTE" }.to_json;#
	elsif params[:id] == '31'
		return {:description => "!!! Description missing !!!", :taskType => "tweets", :title => "TWEETS" }.to_json;
	elsif params[:id] == '41'
		return {:description => "!!! Description missing !!!", :taskType => "simulation", :title => "SIMU1" }.to_json;
	elsif params[:id] == '42'
		return {:description => "!!! Description missing !!!", :taskType => "simulation", :title => "SIMU2" }.to_json;
	elsif params[:id] == '43'
		return {:description => "!!! Description missing !!!", :taskType => "simulation", :title => "SIMU3" }.to_json;
	elsif params[:id] == '51'
		return {:description => "1. Forklar hva de fysiske prinsippene eksperimentene dere gjennomførte tidlig illustrerer. Bruk stillbildene dere tok som hjelp.
		
2. Hva er likhetene og forskjellene mellom de tre små eksperimentene?

3. Hvordan passer de fysiske prinsippene med funksjonene i varmepumpa? Velg gjerne en illustrasjon av varmepumpen som støtte til å forklare sammenhengene.", :taskType => "assets", :title => "DISCUSSION"}.to_json;
	elsif params[:id] == '71'
		return {:description => "!!! Write an article !!!", :taskType => "article" }.to_json;
	else
		return {:description => "", :resources => "", :title => "notask" }.to_json;
	end
end


########## contributions ###############
get '/contributions/:groupId/:taskId' do
	if params[:taskId] == '31'
		return {"simages" => [{:id => "img1", :filePath => "/assets/cool.jpg", :title => "my first image", :isPortfolio => "true", :xpos => "30", :ypos => "30"}]}.to_json;
	else
		return {"svideos" => [{:id => "vid1", :uri => "hCSPf5Viwd0", :title => "my first video", :isPortfolio => item0Selected, :xpos => "10", :ypos => "10"}, {:id => "vid2", :uri => "_b2F-XX0Ol0", :title => "the bottle", :isPortfolio => item1Selected, :xpos => "20", :ypos => "20"}], "simages" => []}.to_json;
	end
end

put '/group/video/' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	if data['id'] == 'vid1'
		item0Selected = data['isPortfolio'];
	elsif data['id'] == 'vid2'
		item1Selected = data['isPortfolio'];
	end
	
	status 200;
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end

put '/group/image/' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	if data['id'] == 'img1'
		item2Selected = data['isPortfolio'];
	end
	
	status 200;
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end

########## tweets ###############
get '/tweet/:tagName' do
	@att = MiracleTweet.where(tag: params[:tagName]).all();
	return @att.to_json;
end

post '/tweet' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	posttwt = MiracleTweet.create(
	:userName => data['userName'],
	:ownerName => data['ownerName'],
	:text => data['text'],
	:xpos => data['xpos'],
	:ypos => data['ypos'],
	:isVisible => data['isVisible'],
	:source => data['source'],
	:tag => data['tag']);
	
	$log.debug 'POST tweet: '+posttwt.to_json;
		
	return posttwt.to_json;
end

put '/tweet' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	puttwt = MiracleTweet.find(data['id']);
	puttwt.update_attributes({
	:xpos => data['xpos'],
	:ypos => data['ypos'],
	:isVisible => data['isVisible']});
	
	$log.debug 'PUT tweet: '+puttwt.to_json;
	
	return puttwt.to_json;
end

########## questions ###############
get '/question/:taskId' do
	@att = MiracleQuestion.where(taskId: params[:taskId]).all();
	return @att.to_json;
end

post '/question' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	posttwt = MiracleQuestion.create(
	:ownerName => data['ownerName'],
	:text => data['text'],
	:xpos => data['xpos'],
	:ypos => data['ypos'],
	:taskId => data['taskId']);
	
	$log.debug 'POST question: '+posttwt.to_json;
		
	return posttwt.to_json;
end

put '/question' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	puttwt = MiracleTweet.find(data['id']);
	puttwt.update_attributes({
	:xpos => data['xpos'],
	:ypos => data['ypos']});
	
	$log.debug 'PUT question: '+puttwt.to_json;
	
	return puttwt.to_json;
end

########## image ###############
post '/image/:groupId/:taskId/:runId' do
	status 200;
end


########## sources ###############
get '/energySources' do
	content_type :json;
	@es = EnergySource.all();
	return @es.to_json;
end

post '/energySources' do
  content_type :json;
  request_body = JSON.parse(request.body.read.to_s);
  
  es = EnergySource.create(
  :energy => request_body["energy"], 
  :inuse => false);
    
  return es.to_json;
end

put '/energySources' do
    content_type :json
    put_request_body = JSON.parse(request.body.read.to_s)
    
	es = EnergySource.find( put_request_body["id"] );
    
    if es.inuse == false && put_request_body["stat"].include?("pick")
		es.update_attributes({:inuse => true, :token => put_request_body["token"].to_s});
		return es.to_json;
    elsif es.inuse == true && put_request_body["stat"].include?("reset")
		es.update_attributes({:inuse => false, :token => ""});
		return es.to_json;
    else
		return {:status => "inuse"}.to_json;
    end
end


########## articles ###############
get '/articleUrl/:groupId' do
	if params[:groupId] == '50191e38da061f83602e8825'
		return {:uri => "https://docs.google.com/document/d/1XvlRaW9X0RYZz1q2mGYLkL9hbChProHpRSQXdc3CPKg/edit"}.to_json;
	elsif params[:groupId] == '50191e61da061f83602e882a'
		return {:uri => "https://docs.google.com/document/d/1cTb5G-TF58l10yZMJB3WnxP7Oq7x3GOSI_kqixeo3cU/edit"}.to_json;
	else
		status 401
	end
end