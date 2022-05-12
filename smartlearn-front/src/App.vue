<template>
  <div v-if="isDrizzleInitialized" id="app">

    <div class="section">
      <h2>Show the Accounts</h2>
      <drizzle-account units="Ether" :precision="3" />
      </div>

    <div class="section">
      <h2>Prizes</h2>
      <Prizes />
    </div>

    <div class="section">
      <h2>SMARTLEARN</h2>
      <SmartLearn />
    </div>

  </div>

  <div v-else>Loading...</div>
</template>

<script>
import SmartLearn from './components/SmartLearn'
import { mapGetters } from 'vuex'
import Prizes from './components/Prizes'

export default {
  name: 'app',
  components: {
    SmartLearn,
    Prizes,
  },

  computed: mapGetters('drizzle', ['isDrizzleInitialized'])
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
