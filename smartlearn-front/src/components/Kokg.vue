<template>
  <div>
    <span >{{
      f.data
    }}</span>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
const args = {
  contractName: "SmartLearn",
  method: "getTotal",
  methodArgs: "",
};
export default {
    computed: {

    ...mapGetters("contracts", ["getContractData"]),
    f() {
      // let compo = 'Kokg'
      let f = this.getContractData({
        contract: "SmartLearn",
        method: "getTotal",
      });
      // f = Object.entries(f)
      //   .filter(([key]) => /^\D/.test(key))
      //   .map(([key, value]) => ({ key, value }));
      return{
        data: f
      }
      // return this.contractInstances[args.contractName].getCourses
    },
    },
    created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
  },

}
</script>
