<template>
  <div class="text-dark" v-if="isDrizzleInitialized">
    <b-row class="py-3">
      <b-col xl="1"><i class="fa-brands fa-ethereum"></i></b-col>
      <b-col xl="7">
        <div>
          Total contribution
        </div>
      </b-col>
      <b-col xl="1">:</b-col>
      <b-col xl="1">
        {{ totalContribution }}
      </b-col>
    </b-row>
    <div class="b-divider"></div>

    <b-row class="py-3">
      <b-col class="pt-2" xl="1"><i class="fa-solid fa-database"></i></b-col>
      <b-col xl="7">
        <div>
          The total number of times can offer course
        </div>
      </b-col>

      <b-col class="pt-2" xl="1">:</b-col>
      <b-col class="timesAlign pt-2" xl="1">
        <div>{{ countOfOffer }}</div>
      </b-col>
    </b-row>

    <div v-if="countOfOffer >= 1">
      <div class="b-divider"></div>
      <OfferCourse :countOfOffer="countOfOffer" />
    </div>
  </div>
  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from "vuex";
import OfferCourse from "./OfferCourse.vue";
const argst = {
  contractName: "SmartLearn",
  method: "reachTotal",
  methodArgs: "",
};
const argsy = {
  contractName: "SmartLearn",
  method: "getTotal",
  methodArgs: "",
};
export default {
  components: {
    OfferCourse,
  },
  methods: {},
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized"]),
    ...mapGetters("contracts", ["getContractData"]),

    totalContribution() {
      const wei = 1e18;
      let amount = this.getContractData({
        contract: "SmartLearn",
        method: "getTotal",
      });
      return amount / wei;
    },

    countOfOffer() {
      let counter = this.getContractData({
        contract: "SmartLearn",
        method: "reachTotal",
      });
      return counter;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", argst);
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", argsy);
  },
};
</script>

<style>
.timesAlign {
  text-align: center;
}
.b-divider {
  width: 100%;
  height: 2px;
  background-color: black;
  border: solid black;
  border-width: 1px 0;
  box-shadow: inset 0 0.5em 1.5em black, inset 0 0.125em 0.5em black;
}
</style>
