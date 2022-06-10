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
          <th scope="col"></th>
          <th scope="col">Remove</th>
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

const args = {
  contractName: "SmartLearn",
  method: "getCourses",
  methodArgs: "",
};

export default {
  name: "Courses",
  components: {
    CourseRow,
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
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
          createdAt: course[1],
          finishedAt: course[2],
          value: course[3],
          deadline: course[4],
          completed: course[5],
          killed: course[6],
        };
      });
      return outputTaks;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", args);
  },
};
</script>
