# JwtMock

## Usage

execute `bin/console` in the following commands

```ruby
> server = JwtMock::ApplicationServer.new
> user = JwtMock::ApplicationUser.new
=> #<JwtMock::ApplicationUser:0x007fac86845a50 @payload={:id=>1, :name=>"shimomuh", :password=>"uniJ6433YBN9q"}>

> user.build_jwt_client
> user.tell_public_key_to(server)
> user.send_payload_to(server)
=> "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MSwibmFtZSI6InNoaW1vbXVyYSIsInBhc3N3b3JkIjoidW5pSjY0MzNZQk45cSJ9.rZDGFXC6hNbg5VdIib5Ctk8_VZbaYV96wJIZ_S9w2IrFdvnAuwdvraTqwqAz3ZN7p_u9mRaOBmkZAPDzxsKaqDfphPEr5TMos8GmgapAg3PimwltfTllEfxD0aKrvCjfYOMBQJJEEiHtUUos1zE4f8AIvMZYJXb5hBI_pNg-R3fGGLT0K_VDstMp6hTI-DvjJJoM_8K8s5M981db1Yqs3NBKIn-yEwfTRKdl4cTQgaDjk6UdOhFiyXldyETlhh3E4t5uQQUvc1cwid8UkYHgMmYmPJoNpwdUjuZ9VMEa3Cu2cNan2piBUI_5i5s4GH_IX798_h52xKCOjrrqHv0gmA"

> server.decode_token
> server.analyze_payload
=> {"id"=>1, "name"=>"shimomuh", "password"=>"uniJ6433YBN9q"}
```
