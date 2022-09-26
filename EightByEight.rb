require 'httparty'

# add the queueIDs you want to display below
queueID = ["101", "102", "103"] # numeric IDs from VCC admin API, change as needed
SCHEDULER.every '120s', :first_in => 5 do
auth = { :username => 'TENANT_NAME_HERE', :password => 'API_DATA_REQUEST_TOKEN_HERE'}

queuestatus = Array.new
        queueID.each do |api|
        result = HTTParty.get("https://(TENANT_URL_HERE).8x8.com/api/rtstats/stats/queue/#{api}.json", :basic_auth => auth) # e.g. "vcc-eu01"
        parsed_output = result.parsed_response        
        queuesize = parsed_output['queue']['queue-size']
        queuename = parsed_output['queue']['queue-name']

        if queuesize.between?(0,3)
                result = 1
        elsif queuesize.between?(4,7)
                result = 2
        elsif queuesize > 7
                result = 3
        else
                result = 0
        end

        if result == 1
                icon = "icon-ok-sign"
                colour = "green"
        elsif result == 2
                icon = "icon-warning-sign"
                colour = "yellow"
        elsif result == 3
                icon = "icon-warning-sign"
                colour = "red"
        else
                icon = "icon-warning-sign"
                colour = "pink"
        end

        queuestatus.push({label: queuename, value: queuesize.to_s, arrow: icon, color: colour })
        queuestatus = queuestatus.uniq
        end

        puts queuestatus
        send_event('EightByEight', {items: queuestatus})

end
