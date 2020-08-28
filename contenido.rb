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
def photos_count(a_url, a_key)
    data = request(a_url, a_key)
    mars = data["photos"]
    cont_f = 0
    cont_r = 0
    cont_mast = 0
    cont_chem = 0
    cont_chem = 0
    cont_mahli = 0
    cont_mardi = 0
    cont_navcam = 0
    contador = ''
        mars.each do |k,v| 
            cont_f += 1 if k["img_src"] && k["camera"]["name"] == "FHAZ"
            cont_r += 1 if k["img_src"] && k["camera"]["name"] == "RHAZ"
            cont_mast += 1 if k["img_src"] && k["camera"]["name"] == "MAST"
            cont_chem += 1 if k["img_src"] && k["camera"]["name"] == "CHEM"
            cont_mahli += 1 if k["img_src"] && k["camera"]["name"] == "MAHLI"
            cont_mardi += 1 if k["img_src"] && k["camera"]["name"] == "MARDI"
            cont_navcam += 1 if k["img_src"] && k["camera"]["name"] == "NAVCAM"
            
        end
        contador += "            <p>Cantidad de imágenes de la cámara FHAZ #{cont_f}</p>\n"
        contador += "            <p>Cantidad de imágenes de la cámara RHAZ #{cont_r}</p>\n"
        contador += "            <p>Cantidad de imágenes de la cámara MAST #{cont_mast}</p>\n"
        contador += "            <p>Cantidad de imágenes de la cámara CHEM #{cont_chem}</p>\n"
        contador += "            <p>Cantidad de imágenes de la cámara MAHLI #{cont_mahli}</p>\n"
        contador += "            <p>Cantidad de imágenes de la cámara MARDI #{cont_mardi}</p>\n"
        contador += "            <p>Cantidad de imágenes de la cámara NAVCAM #{cont_navcam}</p>\n"
       return contador  
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
    
    index = head() + photos_count(api_url, api_key) + main(api_url, api_key) + foot()
    return index
end

File.write('./index.html', build_web_page(api_url, api_key))