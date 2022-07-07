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
        {{ f }}
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
      <b-col class="hjl pt-2" xl="1">
        <div >{{ g }}</div>
      </b-col>
    </b-row>

    <div v-if="g >= 1">
    <div class="b-divider"></div>
      <Kolo :g="g" />
    </div>
  </div>
  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from "vuex";
import Kolo from "./kolo.vue";
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
    Kolo,
  },
  methods: {},
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized"]),
    ...mapGetters("contracts", ["getContractData"]),
    f() {
      const wei = 1e18;
      // const web3 = this.drizzleInstance.web3;
      let fh = this.getContractData({
        contract: "SmartLearn",
        method: "getTotal",
      });

      return fh / wei;
      // web3.utils.fromWei(new web3.utils.BN(fh));

      // return this.contractInstances[args.contractName].getCourses
    },

    g() {
      // const web3 = this.drizzleInstance.web3;
      let fg = this.getContractData({
        contract: "SmartLearn",
        method: "reachTotal",
      });

      return fg;

      // return this.contractInstances[args.contractName].getCourses
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", argst);
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", argsy);
  },
};
</script>

<style>

.hjl{
  text-align: center;
}
.b-divider {
  
  width: 100%;
  height: 2px;
  background-color: black;
  border: solid black;
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em black, inset 0 .125em .5em black;
}
</style>
