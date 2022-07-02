<template>
  <div v-if="isDrizzleInitialized" id="app">
    <div>
      <Header />
    </div>
    <div class="container py-3 my-4" style="min-height: 65vh">
      <router-view></router-view>
    </div>
    <div>
      <Footer />
    </div>
  </div>

  <div v-else>
    <p>Loading...</p>
    <p>
      Is <a href="https://metamask.io/" target="_blank">MetaMask</a> extension
      installed on your browser?
    </p>
    <p>
      Is proper network selected in MetaMask? (Rinkeby Test Network or Localhost
      on port 8545)
    </p>
  </div>
</template>

<script>
import Footer from "./components/Footer.vue";
import Header from "./components/Header.vue";
import { mapGetters } from "vuex";

export default {
  name: "app",
  components: {
    Footer,
    Header,
  },

  computed: mapGetters("drizzle", ["isDrizzleInitialized"]),
};
</script>
