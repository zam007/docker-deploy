#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
# meteor@umscloud.com
# generate key for logstash
# http://www.runoob.com/try/runcode.php?filename=strobj_demo&type=ruby
#product: cHJvZHVjdC4xOTg0Lk1kNlEzUU1V
#sandbox: c2FuZGJveC4xOTg0Lm1rcUYvSHRq
#miguwx: bWlndWxpdGVyLjEyNTMuRGdzUHRCRnQ=
#umsski: dW1zc2tpLjE0NTYuTUVYdDNTUWg=


input=Hash["group"=>"miguliter" ,"key"=>"1223"]

require "base64"
str=(Math.sqrt(input["key"].to_i)*10000).to_s.crypt(input["group"])
key= str.to_s[3,8]
key=input["group"]+"."+input["key"]+"."+key;
puts "original=>"+key
puts "Token to use=> "+Base64.encode64(key)





#decode
event=Hash["tags"=>"bWlndWxpdGVyLjEyMjMuaDg1VHkuWWM=.umslog" ,"mesage"=>"mes"]

require "base64"
if(event["tags"]!=nil)

	s=event["tags"].split(pattern=".",10)

	if(s.length!=2)
 		event["tags"]="auth_format_error"
	else
		d=Base64.decode64(s[0]);
		puts "origin=>"+d
		o=d.split(patter=".",3)

		if(o.length==3)
			str=(Math.sqrt(o[1].to_i)*10000).to_s.crypt(o[0])
			key= str.to_s[3,8]

			if(key==o[2])
				event["tags"]=o[0]+"-"+s[1]
			else
				event["tags"]="auth_key_error"
			end
		end
	end
end


puts "result tag>>"+event["tags"]
