<template>
  <div style="margin: -40px -100%;,padding: 100px 100px;"> <!-- Remove navbar margin -->
    <section class="bghome ">
      <div class="text-center">
        <div class="container">
          <h1 class="title colorw">Welcome to Smartlearn</h1>
          <p class="subtitle">A Powerfull E-Learning Dapp</p>
          <p class="buttons is-centered">
            <b-button
              tag="router-link"
              to="/courses"
              type="is-primary"
              size="is-large"
              inverted
              icon-left="view-dashboard">
              Explore courses
            </b-button>
            <!-- <b-button
              type="is-primary"
              size="is-large"
              outlined inverted
              @click="$auth.loggedIn()?$router.push('/classroom'):$auth.login()"
              icon-left="account-box">
              {{$t($auth.loggedIn() ? 'btnClassroom' : 'btnRegister')}}
            </b-button> -->
          </p>
        </div>
      </div>
    </section>
    <section class="container section">
      <div class="columns">
        <div class="column">
          <div class="promo">
            <b-icon class="has-text-primary" icon="flash" size="is-large" />
            <h3 class="subtitle is-3">Gain new skills quickly</h3>
            <p class="is-size-5">We did our best to make sure our student will learn content as quickly as possible</p>
          </div>
        </div>
        <div class="column">
          <div class="promo">
            <b-icon class="has-text-primary" icon="arrow-up-bold-circle" size="is-large" />
            <h3 class="subtitle is-3">fsd</h3>
            <p class="is-size-5">fsdfsd</p>
          </div>
        </div>
        <div class="column">
          <div class="promo">
            <b-icon class="has-text-primary" icon="web" size="is-large" />
            <h3 class="subtitle is-3">fdsff</h3>
            <p class="is-size-5">fsdfs</p>
          </div>
        </div>
      </div>
    </section>
    <section class="section has-background-info has-text-white">
      <div class="container">
        <div class="columns has-text-centered">
          <div class="column">
            <span class="is-size-3">2</span>
            <span class="heading">fsdfsdf</span>
          </div>
          <div class="column">
            <span class="is-size-3">10+</span>
            <span class="heading">dsffsdfd</span>
          </div>
          <div class="column">
            <span class="is-size-3">3</span>
            <span class="heading">sdfsdfsfd</span>
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <div class="container">
        <div class="columns is-align-items-center">
          <div class="column has-text-centered-mobile">
            <h2 class="title is-4">Sign up now</h2>
            <p>Sign up today and build skills for tomorrow</p>
          </div>
          <!-- <div class="column"> -->
            <!-- <b-button size="is-medium" expanded @click="$auth.login()">{{$t('regBtn')}}</b-button> -->
          <!-- </div> -->
        </div>
      </div>
    </section>
  </div>
</template>




<style>
.colorw{
  color: #fcd200da;
}
.bghome{
  background-color: black;
  height: 400px;
  padding-top: 100px;
}
.promo {
  text-align: center;
}
.promo > .icon {
  display: block;
  margin: 0 auto 1rem;
}
</style>
