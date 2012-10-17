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
item1Selected = "false";
item2Selected = "false";

keyword1 = "";
keyword2 = "";
keyword3 = "";
keyword4 = "";
keyword5 = "";

task_50191e38da061f83602e8825 = [];
tweets = [];

Dir.mkdir('logs') unless File.exist?('logs')
$log = Logger.new('logs/output.log')

configure do
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
	
	if data['groupId'] == '50191e38da061f83602e8825' && data['password'] == 'lilla'
		status 200
	elsif data['groupId'] == '50191e61da061f83602e882a' && data['password'] == 'rosa'
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
	{:id => "1r", :title => "Simulering", :icon => "simulation.png", :stasks => [{:id => "41", :title => "DIGITAL MODELS", :icon => "diagram.png"}]},
	{:id => "1t", :title => "Presentasjon", :icon => "presentation.png", :stasks => [{:id => "51", :title => "DISCUSSION", :icon => "notask.png"}]},
	{:id => "1y", :title => "Diagram", :icon => "diagram.png", :stasks => [{:id => "61", :title => "notask", :icon => ""},{:id => "62", :title => "notask", :icon => ""},{:id => "63", :title => "notask", :icon => ""}]},
	{:id => "1u", :title => "Artikkel", :icon => "article.png", :stasks => [{:id => "71", :title => "notask", :icon => ""},{:id => "72", :title => "notask", :icon => ""},{:id => "73", :title => "notask", :icon => ""}]},
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

put '/tasksCompleted/:groupId' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	
	if params[:groupId] == '50191e38da061f83602e8825'
		if data['isTaskPortfolioReady'] == "true"
			task_50191e38da061f83602e8825.push(data['taskId']);
		else
			task_50191e38da061f83602e8825.delete(data['taskId']);
		end
	end
	
	status 200;
end

get '/task/:id' do
	if params[:id] == '11'
		return {:description => "Hva er energi?", :taskType => "keywords", :title => "SPØRSMAL 1" }.to_json;
	elsif params[:id] == '12'
		return {:description => "Hvordan henger energi sammen med fenomener du observer rundt deg?", :taskType => "keywords", :title => "SPØRSMAL 2" }.to_json;
	elsif params[:id] == '13'
		return {:description => "Hvordan kan energi transformeres mest mulig effektivt og miljøvennlig?", :taskType => "keywords", :title => "SPØRSMAL 3" }.to_json;
	elsif params[:id] == '21'
		return {:description => "1. Press ﬁngeren hardt mot ventilen og pump kraftig ﬂere ganger.
		
2. Beskriv hva dere gjør, opplever og kjenner.

3. Hvilke sammenhenger er det mellom det dere gjør, opplever eller kjenner? Hvordan vil dere forklare det?", :taskType => "assets", :title => "SYKKELPUMPE" }.to_json;
	elsif params[:id] == '22'
		return {:description => "1. Trykk på ventilen.
		
2. Beskriv hva dere opplever og kjenner.

3. Hvilke sammenhenger er det mellom det dere gjør, opplever eller kjenner? Hvordan vil dere forklare det?", :taskType => "assets", :title => "SPRAYBOKS" }.to_json;
	elsif params[:id] == '23'
		return {:description => "1. Fyll opp sprøyta med varmt vann til den er omtrent halvfull. Ta ut luften som er mellom vannet og åpningen. Hold ﬁngeren hardt foran åpningen og dra (ikke skyv).
		
2. Beskriv hva dere ser.

3. Hvilke sammenhenger er det mellom det dere gjør, opplever eller kjenner? Hvordan vil dere forklare det?", :taskType => "assets", :title => "SPRØYTE" }.to_json;#
	elsif params[:id] == '31'
		return {:description => "!!! Description missing !!!", :taskType => "tweets", :title => "TWEETS" }.to_json;
	elsif params[:id] == '41'
		return {:description => "!!! Description missing !!!", :taskType => "simulation", :title => "DIGITAL MODELS" }.to_json;
	elsif params[:id] == '51'
		return {:description => "1. Forklar hva de fysiske prinsippene eksperimentene dere gjennomførte tidlig illustrerer. Bruk stillbildene dere tok som hjelp.
		
2. Hva er likhetene og forskjellene mellom de tre små eksperimentene?

3. Hvordan passer de fysiske prinsippene med funksjonene i varmepumpa? Velg gjerne en illustrasjon av varmepumpen som støtte til å forklare sammenhengene.", :taskType => "assets", :title => "DISCUSSION"}.to_json;
	else
		return {:description => "", :resources => "", :title => "notask" }.to_json;
	end
end

########## keywords ###############
get '/keywords/:groupId/:taskId' do
	if params[:taskId] == '11'
		return {"id" => "5061a1c40364f440d872358e", "keywords" => [keyword1,keyword2,keyword3,keyword4,keyword5], "taskId" => params[:taskId], "groupId" => params[:groupId]}.to_json;
	else
		return [].to_json;
	end
end

post '/keywords' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	keyword1 = data['keywords'][0];
	keyword2 = data['keywords'][1];
	keyword3 = data['keywords'][2];
	keyword4 = data['keywords'][3];
	keyword5 = data['keywords'][4];
	
	return {"id" => "5061a1c40364f440d872358e", "keywords" => [keyword1,keyword2,keyword3,keyword4,keyword5], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end

put '/keywords' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	keyword1 = data['keywords'][0];
	keyword2 = data['keywords'][1];
	keyword3 = data['keywords'][2];
	keyword4 = data['keywords'][3];
	keyword5 = data['keywords'][4];
	
	return {"id" => "5061a1c40364f440d872358e", "keywords" => [keyword1,keyword2,keyword3,keyword4,keyword5], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end


########## contributions ###############
get '/contributions/:groupId/:taskId' do
	return {"svideos" => [{:id => "vid1", :uri => "hCSPf5Viwd0", :title => "my first video", :isPortfolio => item0Selected, :xpos => "10", :ypos => "10"}, {:id => "vid2", :uri => "_b2F-XX0Ol0", :title => "the bottle", :isPortfolio => item1Selected, :xpos => "20", :ypos => "20"}], "simages" => [{:id => "img1", :uri => "agY1PPsq6oA", :title => "my first image", :isPortfolio => item2Selected, :xpos => "30", :ypos => "30"}], "spostits" => []}.to_json;
end

put '/group/video' do
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

put '/group/image' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	if data['id'] == 'img1'
		item2Selected = data['isPortfolio'];
	end
	
	status 200;
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end

put '/group/postit' do
	request.body.rewind  # in case someone already read it
	content_type :json;
	data = JSON.parse request.body.read
	
	status 200;
	#return {"id" => "5061a1c40364f440d872358e", "keywords" => ["one","two","three","four","five"], "taskId" => data['taskId'], "groupId" => data['groupId']}.to_json;
end


########## tweets ###############
get '/tweet/:groupId' do
	if params[:groupId] == '50191e38da061f83602e8825'
		status 200;
	end
end

post '/tweet' do
	status 200;
end

put '/tweet' do
	status 200;
end


