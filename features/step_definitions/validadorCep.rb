Given('eu faço um get no endpoint de cep {string}') do |cep|
    include HTTParty
    @respostaGet = HTTParty.get('https://viacep.com.br/ws/'+cep+'/json/')

  end
  
  Given('verifico o resultado da request {int}') do |code|
        expect(@respostaGet.code).to eq code
    if code == 200
        expect(@respostaGet.message).to eq 'OK'
    else 
        expect(@respostaGet.message).to eq 'Bad Request'
    end

  end

  Given('exibo o valor do IBGE') do
    puts "IBGE: "+@respostaGet["ibge"]
  end