const data = {
  services: [
    {
      title: "Terapia manualna",
      img: "/img/services/terapia-manulana.jpg",
      text: "Terapia manualna w bólach kręgosłupa, następstwach urazów narządu ruchu, operacjach, wadach postawy",
      href: "/terapia-manualna/"
    },
    {
      title: "Terapia neurofizjologiczna",
      img: "/img/services/terapia-neurofizjologiczna.jpg",
      text: "Terapia PNF, NDT-BOBATH w chorobach neurologicznych",
      href: "/terapia-neurofizjologiczna"
    },
    {
      title: "Trening funkcjonalny",
      img: "/img/services/trening-funkcjonalny.jpg",
      text: "Trening funkcjonalny w dysfunkcjach narządu ruchu, po urazach, operacjach, wadach postawy",
      href: "/trening-funkcjonalny"
    },
  ]
} 


let template = document.getElementById('offer').innerHTML;
let rendered = Mustache.render(template, data);
document.getElementById('offer').innerHTML = rendered;