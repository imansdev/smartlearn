<template>
  <div v-if="isDrizzleInitialized">
  <div >
    <drizzle-contract
        contractName="SmartLearn"
        method="getTotal"
        label="Prizes Value"
        units="Ether" :precision="3"
      />
        <div >
    <span >{{
      g
    }}</span>
  </div>
<div v-if="g>=1">
<Kolo :g="g" />
</div>
  </div>
  </div>
  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from "vuex";
import Kolo from "./kolo.vue"
const args = {
  contractName: "SmartLearn",
  method: "reachTotal",
  methodArgs: "",
};
// const args = {
//   contractName: "SmartLearn",
//   method: "getTotal",
//   methodArgs: "",
// };
export default {
  components: {
    Kolo,
  },
  methods: {

  },
    computed: {
      ...mapGetters("drizzle", ["drizzleInstance", 'isDrizzleInitialized']),
    ...mapGetters("contracts", ["getContractData"]),
    // f() {
    //   const web3 = this.drizzleInstance.web3;
    //   let fh = this.getContractData({
    //     contract: "SmartLearn",
    //     method: "getTotal",
    //   });

    //     return web3.utils.fromWei(new web3.utils.BN(fh));
        
    //   // return this.contractInstances[args.contractName].getCourses
    // },

    g() {
      // const web3 = this.drizzleInstance.web3;
      let fg = this.getContractData({
        contract: "SmartLearn",
        method: "reachTotal",
      });

        return fg
        
      // return this.contractInstances[args.contractName].getCourses
    },

    },
    created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
    // this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
  },

}
</script>
