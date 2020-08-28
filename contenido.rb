require_relative 'request'
api_url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key='
api_key = 'nseoc5BEgE5Npedilz6Cd3Mld8MiPSzq63dWKwq9'

def request(url, key)
    mars_photos = get_data("#{url + key}")
    return mars_photos
end
def head()
    head = "
    <!doctype html>
    <html lang='es'>
        <head>
            <!-- Required meta tags -->
            <meta charset='utf-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
        
            <!-- Bootstrap CSS -->
            <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' integrity='sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z' crossorigin='anonymous'>
        
            <title>MARS PHOTOS</title>
        </head>
        <body>
            <h1 class='text-center' >MARS PHOTOS</h1>\n"
    return head
end

def main(a_url, a_key)
    data = request(a_url, a_key)
   
    cards = '           <div class="row card-group">'
        mars = data["photos"]
                    mars.each do |key, value|
                        
                            cards += "
                            <div class = 'col-md-6'>
                                <div class='card'>
                                    <img src='#{key["img_src"]}' class='card-img-top' alt='mars'>
                                </div>
                            </div>
                            "
                        
                    end
            
       
        cards += "</div>\n"
        return cards
end

def foot
    foot = "    
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>
            <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js' integrity='sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN' crossorigin='anonymous'></script>
            <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js' integrity='sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV' crossorigin='anonymous'></script>
        </body>
    </html>"
    return foot
end
def build_web_page(api_url, api_key)
    
    index = head() + main(api_url, api_key) + foot()
    return index
end

File.write('./index.html', build_web_page(api_url, api_key))