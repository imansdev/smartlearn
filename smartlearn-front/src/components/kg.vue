<template>
  <div v-if="isDrizzleInitialized">
  <div >
    <drizzle-contract
        contractName="SmartLearn"
        method="decreaseCount"
        label="Prizes Value"
        units="Ether" :precision="3"
      />
  </div>
  </div>
  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from "vuex";
// const args = {
//   contractName: "SmartLearn",
//   method: "decreaseCount",
//   methodArgs: "",
// };
// const args = {
//   contractName: "SmartLearn",
//   method: "getTotal",
//   methodArgs: "",
// };
export default {
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

    // y() {
    //   // const web3 = this.drizzleInstance.web3;
    //   let yh = this.getContractData({
    //     contract: "SmartLearn",
    //     method: "decreaseCount",
    //   });

    //     return yh
        
    //   // return this.contractInstances[args.contractName].getCourses
    // },

    },
    created() {
    // this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
    // this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
  },

}
</script>
