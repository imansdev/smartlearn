<template>
  <div>
    <div
      style="margin-top: -150px; padding-top: 100px;width: 1280px;margin-left: -50px;"
    >
      <!-- Remove navbar margin -->
      <section class="bghome ">
        <div class="text-center">
          <div class="container">
            <h1 class=" colorw">Welcome To Smartlearn</h1>
            <p class="subtitless">A Powerfull E-Learning Dapp</p>
            <p class="buttons is-centered">
              <b-button
                class="buttonstyle"
                tag="router-link"
                to="/courses"
                variant="outline-secondary"
                inverted
              >
                <p class="buutoncolor">
                  <i class="iconstyle fa-brands fa-audible fa-xl"></i>
                  EXPLORE COURSES
                </p>
              </b-button>
              <b-button
                class="buttonstyle"
                tag="router-link"
                to="/add"
                variant="outline-secondary"
                inverted
              >
                <p class="buutoncolor">
                  <i class="iconstyle fa-solid fa-list fa-xl"></i>
                  ADD COURSE TO DO
                </p>
              </b-button>
            </p>
          </div>
        </div>
      </section>
    </div>
    <!-- <div style="margin: -40px -100%;padding: 100px 100px; height: 1000px ;"> -->
    <section class="bgdownhome">
      <b-row style="padding-top: 10px;">
        <b-col>
          <!-- <i class="fa-brands fa-connectdevelop "></i> -->
          <!-- <i class="fa-solid fa-circle-nodes"></i>
          <i class="fa-solid fa-circle-nodes "></i> -->
          <i class="fa-solid fa-diagram-project fa-3x"></i>
          <div class="fontfitch"><strong>Decentral</strong></div>
          <!-- <i class="fa-brands fa-hive "></i> -->
        </b-col>
        <b-col>
          <!-- <i class="fa-solid fa-user-secret "></i> -->
          <!-- <i class="fa-solid fa-mask"></i> -->
          <i class="fa-solid fa-ghost fa-3x"></i>
          <div class="fontfitch"><strong>Anonymous</strong></div>
        </b-col>

        <b-col>
          <i class="fa-brands fa-gratipay fa-3x"></i>

          <div class="fontfitch"><strong>Free Courses</strong></div>
          <!-- <i class="fa-solid fa-user-secret fa-2xl"></i> -->
        </b-col>
      </b-row>
    </section>
    <div>
      <b-row class="text-center fontFitchExp" style="margin-top: -50px;">
        <b-col
          >Smartlearn stores your Course To Do information in a completly
          <strong class="colorStrong">Decentralized</strong> by using the power
          of ethereum blockchain</b-col
        >

        <b-col
          >Your acticity here is completely
          <strong class="colorStrong">Anonymous</strong> and NO personal
          information is taken from you and is NOT registered on our servers
        </b-col>

        <b-col
          >All available Courses that we offered are
          <strong class="colorStrong">Free</strong> and anyone can use the
          Courses without paying any fees</b-col
        >
      </b-row>
    </div>
    <!-- </div> -->
  </div>
</template>

<style>
.colorStrong {
  color: #fcd200da;
  text-shadow: -0px 0px 2px black;
}
.fontFitchExp {
  font-size: 20px;
  text-shadow: -0px 0px 2px #fcd200da;
}
.fontfitch {
  font-size: 20px;
}
.buutoncolor {
  color: #fcd200da;
  padding-top: 15px;
  padding-bottom: -10px;
}
.buttonstyle {
  margin-right: 15px;
  margin-top: 30px;
}
.iconstyle {
  color: #fcd200da;
  /* min-height: 4000px; */
  padding-right: 5px;
}
.colorw {
  color: #fcd200da;
  letter-spacing: 5px;
  font-size: 40px;
}
.bghome {
  background-color: black;
  height: 350px;
  padding-top: 100px;
}
.promo {
  text-align: center;
}
.promo > .icon {
  display: block;
  margin: 0 auto 1rem;
}
.bgdownhome {
  text-align: center;
  background-color: #fcd200da;
  /* background: linear-gradient(45deg, #fcd200da 50%, transparent 50%),
    linear-gradient(-45deg , #fcd200da 50%, transparent 50%);
  background-size: 30px 30px; */
  padding-bottom: 2px;
  margin-bottom: 70px;
  /* min-height: 100px; */
  margin-left: -50px;
  width: 1280px;
}
.subtitless {
  font-size: 20px;
  color: gray;
}
</style>
