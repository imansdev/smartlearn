<template>
  <div style="margin: -1em -1em 0"> <!-- Remove navbar margin -->
    <section class="hero is-primary is-halfheight">
      <div class="hero-body has-text-centered">
        <div class="container">
          <h1 class="title">Welcome to Code</h1>
          <p class="subtitle">An open source E-Learning platform!</p>
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


<script>
export default {
  data() { return {
  } },
  strings: {
    en: {
      welcome: 'Welcome to <A>Code',
      welcomeSubtitle: 'An open source E-Learning platform!',
      btnExplore: 'Explore courses',
      btnClassroom: 'My classroom',
      btnRegister: 'Register for free',
      promoSkills: 'Gain new skills quickly',
      promoSkillsText: 'We did our best to make sure our student will learn content as quickly as possible',
      promoUptodate: 'Learn up-to-date technologies',
      promoUptodateText: 'Unlike some other similar web sites, we offer fresh content only',
      promoUzbeks: 'For uzbeks, by uzbeks',
      promoUzbeksText: 'We are one of the very few learning platforms which have both uzbek content and quality',
      dashboardCourses: 'Courses',
      dashboardUsers: 'Registered users',
      dashboardCompleted: 'Completed courses',
      regTitle: 'Sign up now',
      regText: 'Sign up today and build skills for tomorrow',
      regBtn: 'Open register page',
    },
    uz: {
      welcome: '<A>Code ga xush kelibsiz',
      welcomeSubtitle: "Ochiq onlayn o'quv platformasi!",
      btnExplore: "Kurslarni ko'rish",
      btnClassroom: "Sinfxonaga o'tish",
      btnRegister: "Ro'yhatdan o'tish",
      promoSkills: "Yangi ko'nikmalarga tez erishing",
      promoSkillsText: "Bizning o'quvchilarimiz kurslarimizi iloji boricha tez o'rganishi uchun harakat qilamiz",
      promoUptodate: "Zamon bilan hamnafas bo'ling",
      promoUptodateText: "Ba'zi o'xshash saytlardan farqli o'laroq, biz faqat yangi kontent taqdim etamiz",
      promoUzbeks: "O'zbeklar tomonidan, o'zbeklar uchun",
      promoUzbeksText: "Biz o'zbekcha kontenti bor juda kam onlayn platformalardan birimiz",
      dashboardCourses: 'Kurslar',
      dashboardUsers: "Ro'yxatdan o'tganlar",
      dashboardCompleted: 'Bitiruvchilar',
      regTitle: "Hoziroq ro'yhatdan o'ting",
      regText: "Bugun ro'yhatdan o'ting va ertanggi kun uchun ko'nikmalarga ega bo'ling",
      regBtn: "Ro'yhatdan o'tish sahifasi",
    },
  }
}
</script>

<style>
.promo {
  text-align: center;
}
.promo > .icon {
  display: block;
  margin: 0 auto 1rem;
}
</style>
