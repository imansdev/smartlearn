<template>
  <!-- <div v-if="isDrizzleInitialized" id="app"> -->
    <div>
    <div>
      <Header />
    </div>
    <div class="container" id="grad1" style="padding: 50px; min-width: 1280px;">
      <router-view style="padding-right: -100em;"></router-view>
    </div>
    <!-- <div>
      <Footer />
    </div> -->
    </div>
  <!-- </div> -->

  <!-- <div v-else>
    <p>Loading...</p>
    <p>
      Is <a href="https://metamask.io/" target="_blank">MetaMask</a> extension
      installed on your browser?
    </p>
    <p>
      Is proper network selected in MetaMask? (Rinkeby Test Network or Localhost
      on port 8545)
    </p>
  </div> -->
</template>

<script>

import Header from "./components/Header.vue";
// import { mapGetters } from "vuex";

export default {
  name: "app",
  components: {

    Header,
  },

  // computed: mapGetters("drizzle", ["isDrizzleInitialized"]),
};
</script>
<style >
#grad1 {
  /* width: ; */
  min-width: 1000px;
  background-color: white; /* For browsers that do not support gradients */
  background-image: linear-gradient(black, white);

}
</style>
