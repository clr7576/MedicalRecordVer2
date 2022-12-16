class LineService
  def initialize(webhook: nil)
    if webhook.nil?
      @webhook = ENV['LINE_WEBHOOK']
    else
      @webhook = webhook
    end

    def notify(message)
        content_type= 'Authorization: Bearer eLMJ7UuSgVL3xsiEtYTfFbnjRQd1sfekgcKeUfMgGAh'
        method = "POST"
        body = "message=#{message}"
        # body = {message: message}
        
        system %Q(curl -X #{method} -H '#{content_type}' -F '#{body}' #{@webhook})
     
    end
  end
end

# discord = DiscordService.new(webhook: "...")
# discord = DiscordService.new
# discord.notify("...")

# system %Q(curl -X POST -H 'Authorization: Bearer W1pfZsZA5f8t5fhVP8M2tU4xzhuVHG65OTkPlQgweZH' -F 'message="#{@animal.name} 心跳 #{@basal_value.HR} 血壓 #{@basal_value.BP} 呼吸 #{@basal_value.RR}"' https://notify-api.line.me/api/notify)

# system %Q(curl-H “Content-Type: application/json” -X POST -d'{“content”:”新增書本”}'https://discordapp.com/api/webhooks/1051736038218928168/kJ_Ng_NdvXL1olBoixC5U3V8pbZCm8wax_rP0hpEt18ywygRDqtbVXBDwt7jq7SCNZ5G