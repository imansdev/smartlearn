<template>
  <div v-if="isDrizzleInitialized">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Description</th>
          <th scope="col">Created At</th>
          <th scope="col">Deadline</th>
          <th scope="col">Complete/kill</th>
          <th scope="col">Prize</th>
          <th scope="col">{{gh}}</th>
          <!-- <th scope="col"><div>
    <span >{{
      f.data
    }}</span>
  </div></th> -->
          <!-- <th scope="col"><div v-for="(val, index) in f.data" :key="index">
        <div>
          <strong>{{ val.key }}</strong>
        </div>
        <div>{{ val.value }}</div>
      </div></th> -->
        </tr>
      </thead>
      <tbody>
        <CourseRow
          v-for="(course, index) in courses"
          :key="index"
          :courseID="index.toString()"
          :course="course"
        />
      </tbody>
    </table>
  </div>
  <div v-else>
    <p>Loading...</p>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import CourseRow from "./CourseRow";
// import Kokg from "./Kokg";

const args = {
  contractName: "SmartLearn",
  method: "getCourses",
  methodArgs: "",
};
export default {
  name: "Courses",
  components: {
    CourseRow
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("contracts", ["getContractData","contractInstances"]),
    rawCourses() {
      return this.getContractData({
        contract: args.contractName,
        method: args.method,
      });
    },
    // isSt() {
    //   return !this.contractInstances[this.contractName].synced
    // },
    gh() {
    //   // let compo = 'Kokg'
    //   let f = this.getContractData({
    //     contract: "SmartLearn",
    //     method: "getTotal",
    //   });
    //   // f = Object.entries(f)
    //   //   .filter(([key]) => /^\D/.test(key))
    //   //   .map(([key, value]) => ({ key, value }));
    //   return{
    //     data: f
    //   }
      return this.contractInstances[args.contractName]
    },
    courses() {
      let outputTaks = [...this.rawCourses];
      outputTaks.forEach((course, index, theArray) => {
        theArray[index] = {
          description: course[0],
          anotherWallet: course[1],
          createdAt: course[2],
          finishedAt: course[3],
          value: course[4],
          deadline: course[5],
          completed: course[6],
          killed: course[7],
          punishMe: course[8],
          toAnother: course[9]
        };
      });
      return outputTaks;
    },
  },
  // methods: {
  //   // total(){
  //     f();
  //   // }
  // },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
  },
};
</script>