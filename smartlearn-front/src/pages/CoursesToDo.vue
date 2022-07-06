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
import CourseRow from "../components/CourseRow";
// import Kokg from "./Kokg";

const args = {
  contractName: "SmartLearn",
  method: "getCourses",
  methodArgs: "",
};
export default {
  name: "CoursesToDo",
  components: {
    CourseRow
  },
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized"]),
    ...mapGetters("contracts", ["getContractData"]),
    rawCourses() {
      return this.getContractData({
        contract: args.contractName,
        method: args.method,
      });
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
