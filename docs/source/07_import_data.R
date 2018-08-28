library(tidyverse)
library(lubridate)

if (!requireNamespace("janitor", quietly = TRUE)) {
  install.packages("janitor")
}
library(janitor)

cr <- read_csv("https://gerkelab.github.io/core-r-course/materials/04/CancerRegistryData.csv") %>%
  clean_names() %>%
  mutate(
    date_of_diagnosis = mdy(date_of_diagnosis),
    date_last_patient_contact_dead = mdy(date_last_patient_contact_dead)
  )

cr_patients <- read_csv("https://gerkelab.github.io/core-r-course/materials/04/CancerRegistryDataPatients.csv") %>%
  clean_names() %>%
  mutate(
    date_last_patient_contact_dead = mdy(date_last_patient_contact_dead)
  )

cr_patients$email <- c("bailey.theodis@and.com", "rowland.weber@mann.com", "price@vonrueden.net",
                       "sherwood.cronin@gmail.com", "demi43@herman.com", "doll.thiel@sanford.com",
                       "samir.rodriguez@yahoo.com", "550.245.1108x906", "ptrantow@group.com",
                       "seffertz@group.com", "rosevelt81@hotmail.com", "zula.crona@hotmail.com",
                       "issac79@yahoo.com", "Okuneva, Okuneva and Okuneva", "ccruickshank@hotmail.com",
                       "parker.theodosia@becker.biz", "vida.halvorson@llc.com", "wynona.fisher@ltd.com",
                       "gislason.yajaira@llc.com", "fawn62@yahoo.com", "hheathcote@yahoo.com",
                       "zeta67@lueilwitz.com", "wquitzon@hotmail.com", "coleen.mcclure@yahoo.com",
                       "ahyatt@gmail.com", "ykoss@yahoo.com", "corwin.arnie@and.biz",
                       "fsmith@yahoo.com", "abel07@plc.com", "mitchell.braylon@effertz.com",
                       "illa07@wiegand.org", "anders89@inc.net", "oralia.herzog@hotmail.com",
                       "lizabeth08@yahoo.com", "brandi.christiansen@kuphal.com", "hillary45@rau.com",
                       "elizabet.hegmann@turcotte.com", "ischimmel@hotmail.com", "manda.kreiger@rutherford.net",
                       "rath.evelyne@gmail.com", "lkoss@inc.com", "brittany16@and.com",
                       "kpouros@and.com", "earnestine.mckenzie@gmail.com", "jacobs.kris@mcglynn.com",
                       "corine41@yahoo.com", "feest.clarnce@will.com", "christiansen.tatyanna@hotmail.com",
                       "arden08@hotmail.com", "+92(5)4722895694", "pacocha.ridge@d'amore.info",
                       "ethen.donnelly@llc.com", "feeney.champ@yahoo.com", "barrows.brandie@gmail.com",
                       "corey.herman@kuhlman.com", "gibson.burnett@and.com", "quigley.donaciano@gmail.com",
                       "marley65@hotmail.com", "lorenzo86@llc.biz", "parker.odessa@yahoo.com",
                       "qschmeler@hotmail.com", "814.891.0875x7342", "hilma91@yahoo.com",
                       "(610)647-6685x068", "013-030-7545", "chansen@ltd.net", "conroy.justina@group.com",
                       "moriah48@gmail.com", "christine.grady@yahoo.com", "white.haven@yahoo.com",
                       "susana.parisian@hotmail.com", "vinnie83@and.com", "satterfield.estie@gmail.com",
                       "darl.larson@yahoo.com", "bina61@krajcik.com", "joshuah.turner@hotmail.com",
                       "vhermiston@bruen.biz", "Batz, Batz and Batz", "kreiger.ivanna@yahoo.com",
                       "cleta.ullrich@tromp.info", "sframi@inc.com", "Hammes, Hammes and Hammes",
                       "lacie22@yahoo.com", "antonina81@mertz.com", "lawton.ernser@rosenbaum.biz",
                       "Mayer Ltd", "norval.greenholt@hoppe.info", "stefanie.jacobson@rath.org",
                       "elta90@gmail.com", "ljaskolski@hotmail.com", "268.986.9090x238",
                       "neha96@yahoo.com", "brittany.walsh@yahoo.com", "konopelski.erin@yahoo.com",
                       "(947)787-6881x8309", "severt.paucek@emard.info", "Ratke-Ratke",
                       "jule.glover@group.info", "aframi@hotmail.com", "lueilwitz.valentin@powlowski.com",
                       "ayanna87@kilback.com", "maralyn.schaefer@inc.net", "huels.melodee@yahoo.com",
                       "brant14@nader.net", "O'Reilly, O'Reilly and O'Reilly", "beckie.mcclure@bode.com",
                       "fritsch.rubin@gmail.com", "johnson.trish@yahoo.com", "sfahey@marquardt.com",
                       "savion.funk@hotmail.com", "pbednar@hane.org", "Brakus-Brakus",
                       "tillman.lettie@hotmail.com", "shaneka.hilpert@hotmail.com",
                       "florine96@brown.com", "losinski@inc.com", "tatia.will@yahoo.com",
                       "weffertz@plc.com", "verlin20@bednar.com", "hills.sanaa@hotmail.com",
                       "rfriesen@gmail.com", "edson63@turcotte.net", "tory88@hotmail.com",
                       "Spencer, Spencer and Spencer", "boone.runte@berge.com", "397.981.2233x56350",
                       "charissa37@llc.biz", "ilittel@tremblay.org", "790.197.5667x87625",
                       "aileen81@o'keefe.com", "doug.wintheiser@hotmail.com", "purl36@yahoo.com",
                       "Jerde, Jerde and Jerde", "vida.torphy@yahoo.com", "frami.dave@hotmail.com",
                       "zfarrell@gmail.com", "boyer.ritchie@plc.info", "schuppe.priscilla@yahoo.com",
                       "armani.hansen@gusikowski.biz", "(847)437-7174", "mabshire@group.com",
                       "Durgan, Durgan and Durgan", "fahey.ferrell@gmail.com", "mykel.keeling@yahoo.com",
                       "tiana15@yahoo.com", "rempel.eda@yahoo.com", "dubuque.emmanuel@volkman.info",
                       "alonso.pacocha@gmail.com", "earnest.heaney@kuhic.com", "dino.gaylord@will.com"
)

